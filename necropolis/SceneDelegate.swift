//
//  SceneDelegate.swift
//  necropolis
//
//  Created by Иван Коваленко on 27.10.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let viewController = AuthContainer.assemble()
        window = UIWindow(windowScene: scene)
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }

    func getInitialViewController() -> UIViewController {
        return prepareAuthViewController()
    }
    
    func prepareAuthViewController() -> UIViewController {
        return AuthViewController()
    }

}

