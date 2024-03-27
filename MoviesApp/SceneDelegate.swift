//
//  SceneDelegate.swift
//  MoviesApp
//
//  Created by Andres Leal on 4/24/21.
//  Copyright © 2021 Andres Leal. All rights reserved.
//
//
// Trabajar sin story board
// 1) Eliminar el "MAin story board"
// 2) ir a el "target del proyecto" -> el menu principal de este, y en la opcion "main interface" - quitar o reemplazar
// 3) info.plist en la ruta   aplication Scene Manifest/Scene Configuration/Aplication Session Role/item 0/Storyboard Name (quitar con el menos(boton))
// 4) SceneDelegate
// 5) Eliminar viewController default que crea al proyecto 


import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }  // modify se agrega la variable windowScene
        
        window = UIWindow(frame: UIScreen.main.bounds) // se inicializa 
        
        let viewController = HomeRouter().viewController  // inicializa el ui del home
        let navController = UINavigationController(rootViewController: viewController) // inicializa navController de la tabla
        
        window?.rootViewController = navController  //
        window?.makeKeyAndVisible()   //
        window?.windowScene = windowScene //
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
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

