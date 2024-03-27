//
//  HomeView.swift
//  MoviesApp
//
//  Created by Andres Leal on 4/24/21.
//  Copyright © 2021 Andres Leal. All rights reserved.


import UIKit
import RxSwift
import RxCocoa

class HomeView: UIViewController {
    
    @IBOutlet private weak var mainTableView: UITableView!
    private var router = HomeRouter()
    @IBOutlet private weak var loadActivity: UIActivityIndicatorView!
    private var viewModel = HomeViewModel()
    private var disposeBag = DisposeBag()
    private var movies = [Movie]()
    private var filteredMovies = [Movie]()
    
    lazy var searchController: UISearchController = ({
        let controller = UISearchController(searchResultsController: nil)
        controller.hidesNavigationBarDuringPresentation = true
        controller.obscuresBackgroundDuringPresentation = false
        controller.searchBar.sizeToFit()
        controller.searchBar.barStyle = .black
        controller.searchBar.backgroundColor = .clear
        controller.searchBar.placeholder = "Buscar una Pelicula"
        
        return controller
    })()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Stori movies App"
        configureTableView()
        viewModel.bind(view: self, router: router)
        getData()
        manageSearchBarController()
    }
    
    private func configureTableView(){
        mainTableView.rowHeight = UITableView.automaticDimension
        mainTableView.register(UINib(nibName: "MainTableCustomViewCell", bundle: nil), forCellReuseIdentifier: "MainTableCustomViewCell")
    }
    
    private func getData(){
        return viewModel.getListMoviesData()

            .subscribe(on: MainScheduler.instance)
            .observe(on: MainScheduler.instance)

            .subscribe(
                onNext: { movies in
                    self.movies = movies
                    self.reloadTableView()
            }, onError: { error in
                print(error.localizedDescription)
            }, onCompleted: {
                print("completado")
            }).disposed(by: disposeBag)
    }
    
    private func reloadTableView(){
        DispatchQueue.main.async {
            self.loadActivity.stopAnimating()
            self.loadActivity.isHidden = true
            self.mainTableView.reloadData()
        }
    }
    private func manageSearchBarController(){
        let searchBar = searchController.searchBar
        searchController.delegate = self
        mainTableView.tableHeaderView = searchBar
        mainTableView.contentOffset = CGPoint(x: 0, y: searchBar.frame.size.height)
        
        searchBar.rx.text
            .orEmpty
            .distinctUntilChanged()
            .subscribe(onNext: { (result) in
                self.filteredMovies = self.movies.filter({ movie in
                    self.reloadTableView()
                    return movie.title.contains(result)
                })
            }).disposed(by: disposeBag)
    }
}

extension HomeView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" {
            return self.filteredMovies.count
        } else {
            return self.movies.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableCustomViewCell") as! MainTableCustomViewCell
        
        if searchController.isActive && searchController.searchBar.text != "" {
            cell.imgMovie.imageFromServerUrl(urlString: "\(Constants.URL.urlImages+self.filteredMovies[indexPath.row].image)", placeHolderImage: UIImage(named: "claqueta")!)
            cell.lblTitleMovie.text = filteredMovies[indexPath.row].title
            cell.lblDescriptionMovie.text = filteredMovies[indexPath.row].sinopsis
        } else {
            
            cell.imgMovie.imageFromServerUrl(urlString: "\(Constants.URL.urlImages+self.movies[indexPath.row].image)", placeHolderImage: UIImage(named: "claqueta")!)
            cell.lblTitleMovie.text = movies[indexPath.row].title
            cell.lblDescriptionMovie.text = movies[indexPath.row].sinopsis
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if searchController.isActive && searchController.searchBar.text != "" {
            viewModel.makeDetailView(movieID: String(self.filteredMovies[indexPath.row].movieID))
            print("Seleccionado con 1: \(self.filteredMovies[indexPath.row].movieID)")
        } else {
             viewModel.makeDetailView(movieID: String(self.movies[indexPath.row].movieID))
            print("Seleccionado con 2: \(self.movies[indexPath.row].movieID)")
        }
    }
}

extension HomeView: UISearchControllerDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar){
        searchController.isActive = false
        reloadTableView()
    }
}
