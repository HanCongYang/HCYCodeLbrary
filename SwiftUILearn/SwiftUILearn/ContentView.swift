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
    @State var isHideLabel = false
    @State private var action: Int? = 0
    
    var body: some View {
        
        TabView {
            NavigationView {
                
                VStack(spacing: 30) {
                    
                    Text("Hello SwiftUI").font(.system(size: 15)).foregroundColor(Color.pink).padding(EdgeInsets(top: 50, leading: 50, bottom: 50, trailing: 50))
                    QMUIButtonForSwiftUI(title:"1").frame(width: 200, height: 100, alignment: Alignment.center)
                    VStack {
                        NavigationLink(destination: SwipeToDismiss().navigationTitle("1"), tag: 1, selection: $action) {
                            Text("Your Custom View 1").foregroundColor(Color.pink)
                                .onTapGesture {
                                    //perform some tasks if needed before opening Destination view
                                    self.action = 1
                                }
                            
                        }
                        
                        NavigationLink(destination: Text("2222").navigationTitle("2"), tag: 2, selection: $action) {
                            Text("Your Custom View 2").foregroundColor(Color.pink)
                                .onTapGesture {
                                    //perform some tasks if needed before opening Destination view
                                    self.action = 2
                                }
                            
                        }
//                        NavigationLink(destination: Text("Destination_2"), tag: 2, selection: $action) {
//                            SwipeToDismiss()
//                        }
                        

                        Text("Your Custom View 2")
                            .onTapGesture {
                                //perform some tasks if needed before opening Destination view
                                self.action = 2
                            }
                    }
                    StringList()
                    Button(action: {
                        self.isHideLabel = !self.isHideLabel
                    }) {
                        Text("click me")
                    }
                    
                    Text("this label is hide").isHidden(isHideLabel)
                }
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
                    HStack {
                        Image("提问交流_回访").resizable().frame(minWidth: 100, idealWidth: 100, maxWidth: 100, minHeight: 100, idealHeight: 100, maxHeight: 100, alignment: Alignment.leading)
                        HStack(alignment: VerticalAlignment.top) {
                            VStack(alignment: HorizontalAlignment.leading) {
                                Text("Hello world").padding(44)
                                Spacer().frame(height: 10)
                                Text("Hello world37:32.710113+0800 SwiftUILearn[4566:6026549] [] nw_protocol_get_quic").font(.system(size: 15))
                                Spacer()
                            }
                        }
                        
                    }.background(Color.blue)
                    Text("Hello world")
                    Text("Hello world")
                    Text("Hello world")
                    Text("Hello world")
                }.navigationTitle("Menu")
            }.tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
        }
    }
}

extension View {
    
    /// Hide or show the view based on a boolean value.
    ///
    /// Example for visibility:
    /// ```
    /// Text("Label")
    ///     .isHidden(true)
    /// ```
    ///
    /// Example for complete removal:
    /// ```
    /// Text("Label")
    ///     .isHidden(true, remove: true)
    /// ```
    ///
    /// - Parameters:
    ///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
    ///   - remove: Boolean value indicating whether or not to remove the view.
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
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
