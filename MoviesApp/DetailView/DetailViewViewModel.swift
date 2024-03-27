//
//  DetailViewViewModel.swift
//  MoviesApp
//
//  Created by Andres Leal on 5/3/21.
//  Copyright © 2021 Andres Leal. All rights reserved.

import Foundation
import RxSwift


class DetailViewViewModel {
    private var managerConnections = ManagerConnections()
    private(set) weak var view:MainDetailView?
    private var router: DetailRouter?
    
    func bind(view:MainDetailView, router: DetailRouter){
        self.view = view
        self.router = router
        self.router?.setSourceView(view)
    }
    
    func getMovieData(movieID: String) -> Observable<MovieDetail>{
        return managerConnections.getDetailMovies(movieID: movieID)
    }
}
