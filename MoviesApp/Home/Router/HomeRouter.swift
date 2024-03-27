//
//  HomeRouter.swift
//  MoviesApp
//
//  Created by Andres Leal on 4/24/21.
//  Copyright © 2021 Andres Leal. All rights reserved.
//

// Esta clase creara el objeto home , pero tambien servira de router para ir a otras vistas / pantallas
// Inicializador de la clase 


import Foundation
import UIKit


class HomeRouter {
    var viewController: UIViewController {
        return createViewController()
    }
    
    private var sourceView: UIViewController?
    
    private func createViewController() -> UIViewController {
        let view = HomeView(nibName: "HomeView", bundle: Bundle.main)
        return view
    }
    
    func setSourceView(_ sourceView: UIViewController?){
        guard let view = sourceView else {fatalError("Error desconocido")}
        self.sourceView = view
    }
    
    func navigateToDEtailView(movieID: String){
        
        let detailView = DetailRouter(movieID: movieID).viewController
        sourceView?.navigationController?.pushViewController(detailView, animated: true)
        
    }
}
