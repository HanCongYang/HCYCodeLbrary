//
//  SceneDelegate.swift
//  HYHotPotForSwift
//
//  Created by 韩丛旸 on 2020/12/10.
//

import UIKit
import CYLTabBarController

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    // iOS13以后因为多屏开发这里设置window
    // iOS13之前需要把info.plist中的Application Scene Manifest属性去掉
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        if let windowScene = scene as? UIWindowScene {

            let mainTabBarVc = MainTabBarController(viewControllers: self.viewControllers(), tabBarItemsAttributes: self.tabBarItemsAttributesForController())
            self.window = UIWindow(windowScene: windowScene)
            self.window?.frame  = UIScreen.main.bounds
            self.window?.rootViewController = mainTabBarVc
            self.window?.makeKeyAndVisible()
            
            UITabBar.appearance().backgroundColor = UIColor.white
        }
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func viewControllers() -> [UINavigationController]{
        let home = UINavigationController(rootViewController: HomeViewController("fucking init"))
        let mine = UINavigationController(rootViewController: MineViewController())
        let viewControllers = [home, mine]
        
        return viewControllers
        
    }
    

    func tabBarItemsAttributesForController() ->  [[String : String]] {
        
        let tabBarItemOne = [CYLTabBarItemTitle:"首页",
                             CYLTabBarItemImage:"home_normal",
                             CYLTabBarItemSelectedImage:"home_highlight"]
        
        let tabBarItemTwo = [CYLTabBarItemTitle:"我的",
                             CYLTabBarItemImage:"account_normal",
                             CYLTabBarItemSelectedImage:"account_highlight"]
        
        let tabBarItemsAttributes = [tabBarItemOne,tabBarItemTwo]
        return tabBarItemsAttributes
    }

    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

