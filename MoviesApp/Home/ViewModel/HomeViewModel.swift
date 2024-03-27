//
//  HomeViewModel.swift
//  MoviesApp
//
//  Created by Andres Leal on 4/24/21.
//  Copyright © 2021 Andres Leal. All rights reserved.
//
// weak para evitar ciclos de retenciones de memoria

import Foundation
import RxSwift

class HomeViewModel{
    private weak var view: HomeView?
    private var router: HomeRouter?
    private var managerConnections = ManagerConnections()
    
    
    func bind (view: HomeView, router: HomeRouter){
        self.view = view
        self.router = router
        self.router?.setSourceView(view)
        // bindear el router con la vista 
    }
    
    func getListMoviesData() -> Observable<[Movie]>{
        return managerConnections.getPopularMovies()
    }
    
    func makeDetailView(movieID: String){
        router?.navigateToDEtailView(movieID: movieID)
    }
    
}
