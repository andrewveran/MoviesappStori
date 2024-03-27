//
//  Extensions.swift
//  MoviesApp
//
//  Created by Andres Leal on 4/29/21.
//  Copyright © 2021 Andres Leal. All rights reserved.
//

import UIKit

extension UIImageView {
    func imageFromServerUrl(urlString: String, placeHolderImage: UIImage){
        if self.image == nil {
            self.image = placeHolderImage
        }
        
        URLSession.shared.dataTask(with: URL(string: urlString)!) { (data, response , error) in
            if error != nil {
                return
            }
            
            DispatchQueue.main.async {
                guard let data = data else {return}
                let image = UIImage(data: data)
                self.image = image
            }
        }.resume()
    }
}
