//
//  SceneDelegate.swift
//  TMDBTest
//
//  Created by Artur Remizov on 28.03.22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let vc = MovieListViewController.instanceFromStoryboard()
        window.rootViewController = UINavigationController(rootViewController: vc)
        window.overrideUserInterfaceStyle = .dark
        window.makeKeyAndVisible()
        self.window = window
    }
}

