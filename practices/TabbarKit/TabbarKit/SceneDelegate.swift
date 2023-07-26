//
//  SceneDelegate.swift
//  TabbarKit
//
//  Created by 아라 on 2023/07/19.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let firstViewController = UINavigationController(rootViewController: FirstViewController())
        firstViewController.tabBarItem = UITabBarItem(title: "First", image: UIImage(systemName: "plus.app"), tag: 0)
        
        let secondViewContoller = UINavigationController(rootViewController: SecondViewController())
        secondViewContoller.tabBarItem = UITabBarItem(title: "Second", image: UIImage(systemName: "plus.square.on.square"), tag: 1)
        
        let thirdViewController = UINavigationController(rootViewController: ThirdViewController())
        thirdViewController.tabBarItem = UITabBarItem(title: "Third", image: UIImage(systemName: "medical.thermometer"), tag: 2)
        
        let fourthViewController = UINavigationController(rootViewController: FourthViewController())
        fourthViewController.tabBarItem = UITabBarItem(title: "Fourth", image: UIImage(systemName: "medical.thermometer.fill"), tag: 3)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [firstViewController, secondViewContoller, thirdViewController, fourthViewController]
        
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

