//
//  ManagerConnections.swift
//  MoviesApp
//
//  Created by Andres Leal on 4/28/21.
//  Copyright © 2021 Andres Leal. All rights reserved.
//

import Foundation
import RxSwift

class ManagerConnections{
    func getPopularMovies() -> Observable<[Movie]> {
        
        return Observable.create { observer in
            
            let session = URLSession.shared
            var request = URLRequest(url: URL(string: Constants.URL.main+Constants.EndPoints.urlListPopularMovies+Constants.apiKey)!)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "content-Type")
            
            session.dataTask(with: request) { (data, response, error) in
                
                guard let data = data, error == nil, let reponse = response as? HTTPURLResponse else { return }
                
                if reponse.statusCode == 200 {
                    do {
                        let decoder = JSONDecoder()
                        let movies = try decoder.decode(Movies.self, from: data)
                        print("\(movies.listOfMovies[5])")
                        observer.onNext(movies.listOfMovies)
                    } catch let error {
                        observer.onError(error)
                        print("ha ocurrido un error \(error.localizedDescription)" )
                    }
                    
                } else if reponse.statusCode == 401 {
                    print("Error 401")
                }
                observer.onCompleted()
            }.resume()
            
            return Disposables.create {
                session.finishTasksAndInvalidate()
            }
        }
    }
    
    func getDetailMovies(movieID: String) -> Observable <MovieDetail>{
        
        return Observable.create { observer in
            
            let session = URLSession.shared
            var request = URLRequest(url: URL(string: Constants.URL.main+Constants.EndPoints.urlDetailMovie+movieID+Constants.apiKey)!)
            print("Ls url es: \(request)")
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "content-Type")
            
            session.dataTask(with: request) { (data, response, error) in
                
                guard let data = data, error == nil, let reponse = response as? HTTPURLResponse else { return }
                
                if reponse.statusCode == 200 {
                    do {
                        let decoder = JSONDecoder()
                        let detailMovie = try decoder.decode(MovieDetail.self, from: data)
                        print("\(detailMovie)")
                        observer.onNext(detailMovie)
                    } catch let error {
                        observer.onError(error)
                        print("ha ocurrido un error \(error.localizedDescription)" )
                    }
                    
                } else if reponse.statusCode == 401 {
                    print("Error 401")
                }
                observer.onCompleted()
            }.resume()
            
            return Disposables.create {
                session.finishTasksAndInvalidate()
            }
        }
        
    }
}
