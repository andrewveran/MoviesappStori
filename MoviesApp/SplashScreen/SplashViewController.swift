//
//  SplashView.swift
//  MoviesApp
//
//  Created by Mini on 26/03/24.
//  Copyright © 2024 Andres Leal. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.showMainViewController()
        }
    }
    
    func showMainViewController() {
    }
}
