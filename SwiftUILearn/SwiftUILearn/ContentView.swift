//
//  ContentView.swift
//  SwiftUILearn
//
//  Created by 韩丛旸 on 2020/10/15.
//

import SwiftUI
import Alamofire
import PromiseKit
import QMUIKit
import SnapKit

struct StringList: View {
    let strings = ["1", "2", "3", "4", "5", "6", "7", "8"]

    var body: some View {
        List(strings, id: \.self) { string in
            Text(string)
        }
    }
}


struct ContentView: View {
    
    @State var title = "title"
    var body: some View {
        
        TabView {
            VStack() {
                
                QMUIButtonForSwiftUI(title:"1").frame(width: 200, height: 100, alignment: Alignment.center)
                StringList()
            }.tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            VStack() {
                Text("\(title)")
                Button("click me") {
                    if (title == "title") {
                        title = "hello"
                    } else {
                        title = "title"
                    }
                }
            }.tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            NavigationView {
                List {
                    Text("Hello world")
                    Text("Hello world")
                    Text("Hello world")
                    Text("Hello world")
                }.navigationTitle("Menu")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}

struct QMUIButtonForSwiftUI: UIViewRepresentable {
    
    private var title: String
    
    init(title: String) {
        self.title = title
    }

    func makeUIView(context: Context) -> QMUIButtonBridge {
        let v = QMUIButtonBridge()
        return v
    }
    
    func updateUIView(_ button: QMUIButtonBridge, context: Context) {

    }
}

class QMUIButtonBridge: QMUIButton {
    var number: Binding<Int>!

    override init(frame:CGRect) {
        super.init(frame: frame)
        createButton()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createButton()
    }

    private func createButton () {
        let button = QMUIButton();
        button.setTitle("Add", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.backgroundColor = UIColor.purple
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        self.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        button.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }

    @objc func buttonTapped(sender: UIButton) {
        print("hello objc view")
        
        let password = CommonCryptoBridge.encryptUseDES("ybwp@1111", key: "ybwpybwp")
        let name = "yb003902".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        let requestURL = "https://datybwp.djbx.com/member/login?username=\(name!)&password=\(password)roleType="
        
        firstly {
            Promise<String> { seal in
                
                AF.request(requestURL).response { response in
                    debugPrint(response)
                    seal.fulfill("Done")
                }
            }
        }.done { foo in
            debugPrint("foo")
            
        }.catch { error in
            debugPrint(error)
        }
    }
}
