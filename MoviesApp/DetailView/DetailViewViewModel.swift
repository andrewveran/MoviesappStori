//
//  DetailViewViewModel.swift
//  MoviesApp
//
//  Created by Andres Leal on 5/3/21.
//  Copyright © 2021 Andres Leal. All rights reserved.
// (set) = es publica para lectura pero privada para setear un valor
//

import Foundation
import RxSwift


class DetailViewViewModel {
    private var managerConnections = ManagerConnections()
    private(set) weak var view:MainDetailView?
    private var router: DetailRouter?
    
    func bind(view:MainDetailView, router: DetailRouter){
        self.view = view
        self.router = router
        // TODO: setear la vista en el router
        self.router?.setSourceView(view)
    }
    
    func getMovieData(movieID: String) -> Observable<MovieDetail>{
        return managerConnections.getDetailMovies(movieID: movieID)
    }
}
