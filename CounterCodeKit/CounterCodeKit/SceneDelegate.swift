//
//  SceneDelegate.swift
//  CounterCodeKit
//
//  Created by SONYOONHO on 2023/07/19.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let plusOneViewController = UINavigationController(rootViewController: PlusOneViewController())
        plusOneViewController.tabBarItem = UITabBarItem(title: "PlusOne", image: UIImage(systemName: "1.lane"), tag: 0)
        
        let plusTwoController = UINavigationController(rootViewController: PlusTwoViewController())
        plusTwoController.tabBarItem = UITabBarItem(title: "PlusTwo", image: UIImage(systemName: "2.lane"), tag: 0)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [plusOneViewController, plusTwoController]
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {
 
    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }


}

