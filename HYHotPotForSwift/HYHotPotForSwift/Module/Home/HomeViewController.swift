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
import RainbowSwift
import IGListKit


class HomePageInfo: HandyJSON {
    
    var id: Int?
    var title: String?
    var imageURL: String?
    
    required init() {}
    
}

class UpdateVersionInfo: HandyJSON {
    
    var currentVersionCode: String?
    var versionUpdatePrompt: String?
    
    required init() {}
    
}


class BasicTypes: HandyJSON {
    var int: Int = 2
    var doubleOptional: Double?
    var stringImplicitlyUnwrapped: String!
    
    required init() {}
}

class HomeViewController: UIViewController, ListAdapterDataSource, UIScrollViewDelegate, UICollectionViewDelegate  {
    
    
    private let refreshControl = UIRefreshControl()
    
    
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    lazy var items = Array(0...20)
    var loading = false
    let spinToken = "spinner"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        view.addSubview(collectionView)
        adapter.collectionView = collectionView
        adapter.dataSource = self
        adapter.scrollViewDelegate = self
        collectionView.backgroundColor = UIColor.white
        
        let requestURL = "http://localhost:8080/home"
        AF.request(requestURL).responseJSON { response in
            
            switch response.result {
            case .success(let value):
                
                if let json = value as? [String: Any] {
                    let testJson = JSON(json)
                    print(testJson)
                    
                    print([HomePageInfo].deserialize(from: testJson["content"].arrayObject))
                }
            case .failure(let error):
                print(error)
            }
        }
        
        let checkVersionInfo = "http://localhost:8080/version"
        AF.request(checkVersionInfo).responseJSON { response in
            
            switch response.result {
            case .success(let value):
                
                if let json = value as? [String: Any] {
                    let testJson = JSON(json)
                    print(testJson)
                    
                    
                    if let updateInfo = [UpdateVersionInfo].deserialize(from: testJson["content"].arrayObject)?.first  {
                        
                        let appVersion = Bundle.main
                    }
                    
                    
                    
                    //                    print([UpdateVersionInfo].deserialize(from: testJson["content"].arrayObject))
                    
                    //                    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
                    
                }
                
            case .failure(let error):
                print(error)
            }
        }
        
        refreshControl.addTarget(self, action: #selector(didPullToRefresh(_:)), for: .valueChanged)
        collectionView.alwaysBounceVertical = true
        collectionView.refreshControl = refreshControl // iOS 10+
    }
    
    @objc
    private func didPullToRefresh(_ sender: Any) {
        
        DispatchQueue.global(qos: .default).async {
            // fake background loading task
            sleep(3)
            DispatchQueue.main.async {
                self.refreshControl.endRefreshing()
            }
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    // MARK: ListAdapterDataSource
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        var objects = items as [ListDiffable]
        
        if loading {
            objects.append(spinToken as ListDiffable)
        }
        
        return objects
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if let obj = object as? String, obj == spinToken {
            return spinnerSectionController()
        } else {
            return LabelSectionController()
        }
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {

    }
    
    
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? { return nil }
    
    // MARK: UIScrollViewDelegate
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                   withVelocity velocity: CGPoint,
                                   targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let distance = scrollView.contentSize.height - (targetContentOffset.pointee.y + scrollView.bounds.height)
        if !loading && distance < 200 {
            loading = true
            adapter.performUpdates(animated: true, completion: nil)
            DispatchQueue.global(qos: .default).async {
                // fake background loading task
                sleep(8)
                DispatchQueue.main.async {
                    self.loading = false
                    let itemCount = self.items.count
                    self.items.append(contentsOf: Array(itemCount..<itemCount + 5))
                    self.adapter.performUpdates(animated: true, completion: nil)
                }
            }
        }
    }
    

    
    //    override func initDataSource() {
    //
    //        self.dataSourceWithDetailText = QMUIOrderedDictionary()
    //        self.dataSourceWithDetailText?.add("swift 数据存储解决方案", forKey: "使用SQLite.swift")
    //        self.dataSourceWithDetailText?.add("swift map filter 用法", forKey: "swift map filter 用法")
    //
    //    }
    //
    //    override func didSelectCellWithTitle(title: NSString) {
    //
    //        if title == "使用SQLite.swift" {
    //            let vc = SQLiteLabViewController()
    //            self.navigationController?.pushViewController(vc, animated: true)
    //        } else if title == "swift map filter 用法" {
    //            let vc = SwiftLanguageMapAndFilterViewController()
    //            self.navigationController?.pushViewController(vc, animated: true)
    //        }
    //
    //
    //    }
    //
    //    override func viewDidLoad() {
    //
    //        super.viewDidLoad()
    //
    //        print("hello rainBow".onBlue)
    //
    //
    //        self.initDataSource()
    //
    //        let jsonString = "{\"doubleOptional\":1.1,\"stringImplicitlyUnwrapped\":\"hello\",\"int\":1}"
    //        if let object = BasicTypes.deserialize(from: jsonString) {
    //            print(object.int)
    //            print(object.doubleOptional!)
    //        }
    //
    //
    //        let password = CommonCryptoBridge.encryptUseDES("ybwp@1111", key: "ybwpybwp")
    //        let name = "yb003902".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
    //        let requestURL = "https://datybwp.djbx.com/member/login?username=\(name!)&password=\(password)roleType="
    //
    //
    //
    //
    //        firstly {
    //            Promise<Dictionary<String, Any>> { seal in
    //
    //                AF.request(requestURL).responseJSON { response in
    //
    //                    switch response.result {
    //                    case .success(let value):
    //
    //                        if let json = value as? [String: Any] {
    //                            let testJson = JSON(json)
    //                            print(testJson["content"]["userVo"].dictionaryObject)
    //                            seal.fulfill(testJson["content"]["userVo"].dictionaryObject!)
    //                        }
    //                    case .failure(let error):
    //                        print(error)
    //                    }
    //                }
    //            }
    //        }.done { json in
    //
    ////            let dic = json as Dictionary<String, Any>?
    ////            print(User.deserialize(from: json))
    //            // 反序列化
    ////            print(json)
    //            if let object: User = User.deserialize(from: json) {
    //                print(object.realName!)
    //            }
    //
    //            debugPrint("foo")
    //
    //        }.catch { error in
    //            debugPrint(error)
    //        }
    //    }
    //
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
