//
//  SceneDelegate.swift
//  CodeKit
//
//  Created by Jongwook Park on 2023/07/19.
//

import UIKit

// 우리는 Storyboard를 쓰지 않는다
// 그렇다면 첫 화면을 무엇으로 보여줘야할지 부터
// 어떤 전체 구조의 시작점을 설정해야할지 (네비게이션, 탭) 이곳에서 코드로 정해줘야한다

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        // 원래 UIWindowScene 타입의 무엇인가는 _ 로 이름이 없었지만
        // 활용하는 코드를 위해 windowScene으로 이름을 만들어줘야한다
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        /*
        // 단일뷰를 보여주는 전통적인 예시 코드
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = FirstViewController()
        window?.makeKeyAndVisible()
        */
        
        /*
        // 네비게이션으로 들어가는 예시 코드
        let navigationViewController = UINavigationController(rootViewController: FirstViewController())
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = navigationViewController
        window?.makeKeyAndVisible()
        */
        
        // 탭바에서 두 개의 아이템 선택이 가능한 예시 코드
        let firstViewController = UINavigationController(rootViewController: FirstViewController())
        firstViewController.tabBarItem = UITabBarItem(title: "First", image: UIImage(systemName: "pencil.circle"), tag: 0)
        
        let secondViewContoller = UINavigationController(rootViewController: SecondViewController())
        secondViewContoller.tabBarItem = UITabBarItem(title: "Second", image: UIImage(systemName: "eraser.fill"), tag: 0)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [firstViewController, secondViewContoller]
        
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

