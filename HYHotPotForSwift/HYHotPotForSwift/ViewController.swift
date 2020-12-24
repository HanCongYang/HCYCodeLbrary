//
//  ViewController.swift
//  HYHotPotForSwift
//
//  Created by 韩丛旸 on 2020/12/10.
//

import UIKit
import Alamofire
import PromiseKit

//@_cdecl("mlx_init")
//public func mlx_init_swift() {
//    print("++++")
//}
//
//@_cdecl("passIntValue")
//public func passIntValue_swift(value: Int) -> Int {
//
//    print("passIntValue_swift" + "\(value * 5)")
//
//    return value * 2;
//}
//
//@_cdecl("passStringValue")
//public func passStringValue_swift(ptr: UnsafePointer<CChar>?) -> UnsafePointer<CChar>? {
//
//    let str = String(cString: ptr!)
//
//    print("\nstr = \(str)\n")
//
//
//
//    print("passStringValue_swift")
//    let address = "hello there"
//    let newString = strdup(address)
//    return UnsafePointer(newString)
//
//}

import ElastosDIDSDK

class ViewController: UIViewController {
    let cache = "\(NSHomeDirectory())/Library/Caches/.cache.did.elastos"
    let resolver: String = "http://api.elastos.io:21606"
    let storeRoot: String = "\(NSHomeDirectory())/Library/Caches/DIDStore/storeRoot"
    let storePass: String = "passwd"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let adapter = UserAdapter()
        do {
            try DIDBackend.initializeInstance(resolver, cache)
            try ResolverCache.reset()
            print(storeRoot)
            deleteFile(storeRoot)
            var store = try DIDStore.open(atPath: storeRoot, withType: "filesystem", adapter: adapter)
//            let expectedIDString = "iY4Ghz9tCuWvB5rNwvn4ngWvthZMNzEA7U"
            let mnemonic = "cloth always junk crash fun exist stumble shift over benefit fun toe"

            try store.initializePrivateIdentity(using: Mnemonic.DID_ENGLISH, mnemonic: mnemonic, passPhrase: "", storePassword: storePass)
            store = try DIDStore.open(atPath: storeRoot, withType: "filesystem", adapter: adapter)
            let exportedMnemonic = try store.exportMnemonic(using: storePass)
            let doc = try store.newDid(using: storePass)
            print(doc)
        } catch {
            print(error)
        }
        
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
            
            // 反序列化
            
            if let object: User = User.deserialize(from: foo) {
                print(object.realName)
            }
            
            debugPrint("foo")
            
        }.catch { error in
            debugPrint(error)
        }
    }
    
    func deleteFile(_ path: String) {
         do {
             let filemanager: FileManager = FileManager.default
             var isdir = ObjCBool.init(false)
             let fileExists = filemanager.fileExists(atPath: path, isDirectory: &isdir)
             if fileExists && isdir.boolValue {
                 if let dircontents = filemanager.enumerator(atPath: path) {
                     for case let url as URL in dircontents {
                         deleteFile(url.absoluteString)
                     }
                 }
             }
             guard fileExists else {
                 return
             }
             try filemanager.removeItem(atPath: path)
         } catch {
             print("deleteFile error: \(error)")
         }
     }
     
     func exists(_ dirPath: String) -> Bool {
         let fileManager = FileManager.default
         var isDir : ObjCBool = false
         if fileManager.fileExists(atPath: dirPath, isDirectory:&isDir) {
             if isDir.boolValue {
                 return true
             }
         }
         return false
     }
     
     func existsFile(_ path: String) -> Bool {
         let fileManager = FileManager.default
         var isDir : ObjCBool = false
         fileManager.fileExists(atPath: path, isDirectory:&isDir)
         let readhandle = FileHandle.init(forReadingAtPath: path)
         let data: Data = (readhandle?.readDataToEndOfFile()) ?? Data()
         let str: String = String(data: data, encoding: .utf8) ?? ""
         return str.count > 0 ? true : false
     }
}

class UserAdapter: DIDAdapter {
    func createIdTransaction(_ payload: String, _ memo: String?) throws {
        
    }
    
    
}


//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        cCallSwift()
//
//        let password = CommonCryptoBridge.encryptUseDES("ybwp@1111", key: "ybwpybwp")
//        let name = "yb003902".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
//        let requestURL = "https://datybwp.djbx.com/member/login?username=\(name!)&password=\(password)roleType="
//
//        firstly {
//            Promise<String> { seal in
//
//                AF.request(requestURL).response { response in
//                    debugPrint(response)
//                    seal.fulfill("Done")
//                }
//            }
//        }.done { foo in
//            debugPrint("foo")
//
//        }.catch { error in
//            debugPrint(error)
//        }
//    }
//
//
//}
