//
//  DetailRouter.swift
//  MoviesApp
//
//  Created by Andres Leal on 5/3/21.
//  Copyright © 2021 Andres Leal. All rights reserved.
//

import UIKit

class DetailRouter {
    
    var movieID: String?
    var viewController: UIViewController {
           return createViewController()
    }
       
       private var sourceView: UIViewController?
    
    init(movieID: String? = "") {
        self.movieID = movieID
    }
       
       func setSourceView(_ sourceView: UIViewController?){
           guard let view = sourceView else {fatalError("Error desconocido")}
           self.sourceView = view
       }
    
    private func createViewController() -> UIViewController {
        let view = MainDetailView(nibName: "MainDetailView", bundle: Bundle.main)
        view.movieID = self.movieID
        return view
    }
}
