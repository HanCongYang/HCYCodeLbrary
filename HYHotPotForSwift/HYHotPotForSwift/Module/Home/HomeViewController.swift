//
//  HomeViewController.swift
//  HYHotPotForSwift
//
//  Created by 韩丛旸 on 2020/12/23.
//

import UIKit
import QMUIKit
import SnapKit
import PromiseKit
import Alamofire
import HandyJSON
import SwiftyJSON

class BasicTypes: HandyJSON {
    var int: Int = 2
    var doubleOptional: Double?
    var stringImplicitlyUnwrapped: String!

    required init() {}
}

class HomeViewController: HPCommonTableViewController {
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        


        let jsonString = "{\"doubleOptional\":1.1,\"stringImplicitlyUnwrapped\":\"hello\",\"int\":1}"
        if let object = BasicTypes.deserialize(from: jsonString) {
            print(object.int)
            print(object.doubleOptional!)
            print(object.stringImplicitlyUnwrapped)
        }
        

        let password = CommonCryptoBridge.encryptUseDES("ybwp@1111", key: "ybwpybwp")
        let name = "yb003902".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        let requestURL = "https://datybwp.djbx.com/member/login?username=\(name!)&password=\(password)roleType="
        
        
        
        
        firstly {
            Promise<Dictionary<String, Any>> { seal in
                
                AF.request(requestURL).responseJSON { response in
                    
                    switch response.result {
                    case .success(let value):
                        
                        if let json = value as? [String: Any] {
                            let testJson = JSON(json)
                            print(testJson["content"]["userVo"].dictionaryObject)
                            seal.fulfill(testJson["content"]["userVo"].dictionaryObject!)
                        }
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }.done { json in
            
//            let dic = json as Dictionary<String, Any>?
//            print(User.deserialize(from: json))
            // 反序列化
//            print(json)
            if let object: User = User.deserialize(from: json) {
                print(object.realName!)
            }
            
            debugPrint("foo")
            
        }.catch { error in
            debugPrint(error)
        }
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 100
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        var cell = tableView .dequeueReusableCell(withIdentifier: "cell")
//        if cell == nil {
//            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
//        }
//        return cell!
//    }
//
//
//    let tableView: HPTableView = HPTableView()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.view.addSubview(self.tableView)
//        self.tableView.snp.makeConstraints { (make) in
//            make.edges.equalTo(self.view)
//        }
//    }
}
