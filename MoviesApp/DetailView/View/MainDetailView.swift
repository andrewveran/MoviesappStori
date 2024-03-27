//
//  MainDetailView.swift
//  MoviesApp
//
//  Created by Andres Leal on 4/30/21.
//  Copyright © 2021 Andres Leal. All rights reserved.
//

import UIKit
import RxSwift

class MainDetailView: UIViewController {
    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet private weak var imgMainFilmImage: UIImageView!
    @IBOutlet private weak var lblOverview: UILabel!
    @IBOutlet private weak var lblReleaseDate: UILabel!
    @IBOutlet private weak var lblOriginalTitle: UILabel!
    @IBOutlet private weak var lblVoteAverage: UILabel!
    
    private var router = DetailRouter()
    private var viewModel = DetailViewViewModel()
    private var disposeBag = DisposeBag()
    var movieID: String?   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataAndShowDetailMovie()
        viewModel.bind(view: self, router: router)
    }
    
    private func getDataAndShowDetailMovie(){
        guard let idMovie = movieID else {return}
        
        return viewModel.getMovieData(movieID: idMovie).subscribe(onNext: { movie in
            self.showMovieData(movie: movie)
        }, onError: { (error) in
            print("Ha ocurrido un error: \(error)")
        }, onCompleted: {
            
        }).disposed(by: disposeBag)
    }

    func showMovieData(movie: MovieDetail){
        DispatchQueue.main.async {
            self.imgMainFilmImage.image = UIImage(named: "claqueta")
            self.lblTitle.text = movie.title
            self.lblOverview.text = movie.overview
            self.lblReleaseDate.text = movie.releaseDate
            self.lblOriginalTitle.text = movie.originalTitle
            self.lblVoteAverage.text = String(movie.voteAverage)
        }
    }
}
