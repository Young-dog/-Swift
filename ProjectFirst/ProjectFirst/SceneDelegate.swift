//
//  SceneDelegate.swift
//  ProjectFirst
//
//  Created by Maxim Terekhin on 04.12.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let tabBarController = UITabBarController()
        
        let friendsViewController = FriendsViewController()
        
        let groupsViewController = GroupsViewController()
        
        let photosViewController = PhotosViewController()
        
        friendsViewController.tabBarItem.title = "Friends"
        
        groupsViewController.tabBarItem.title = "Groups"
        
        photosViewController.tabBarItem.title = "Photos"

        let controllers = [friendsViewController, groupsViewController, photosViewController]
        
        //tabBarController.tabBar.layer.borderWidth = 1
        
        tabBarController.viewControllers = controllers
        
        let navigationController = UINavigationController(rootViewController: tabBarController)
        
        window = UIWindow(windowScene: scene)
        window?.rootViewController = navigationController
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

