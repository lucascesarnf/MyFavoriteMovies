//
//  SearchViewModel.swift
//  MyFavoriteMovies
//
//  Created by Lucas César  Nogueira Fonseca on 01/10/2018.
//  Copyright © 2018 Lucas César  Nogueira Fonseca. All rights reserved.
//

import Foundation

class SearchViewModel : MovieViewModel, ScrollViewModel{
    
    //MARK:- Private variables
    private var moviePage: MoviePageDTO
    
    //MARK:- Public variables
    var state: MovieState
    var onChange: ((MovieState.Change) -> ())?
    
    var searchQuery: String{
        didSet{
            reload()
        }
    }
    
    //MARK:- Public Methods
    init(){
        searchQuery = ""
        state = MovieState()
        moviePage = MoviePageDTO()
    }
    
    func getSearchCellViewModel(index: Int) -> SearchCellViewModel{
        let cellViewModel = SearchCellViewModel(movie: moviePage.results[index])
        
        return cellViewModel
    }
    
    func getDetailViewModel(index: Int) -> DetailViewModel{
        let movieId = moviePage.results[index].id!
        
        let detailViewModel = DetailViewModel(movieId: movieId)
        
        return detailViewModel
    }
    
    //MARK:- MovieViewModel methods
    func reload(){
        if searchQuery.isEmpty{
            self.moviePage = MoviePageDTO()
            self.onChange!(MovieState.Change.emptyResult)
        }else{
            MovieService.shared().getMoviePageByName(query: searchQuery){ moviePage, reponse, requestError in
                if requestError != nil{
                    self.moviePage = MoviePageDTO()
                    self.onChange!(MovieState.Change.error(requestError!))
                }else if let moviePage = moviePage {
                    if moviePage.results.isEmpty {
                        self.moviePage = MoviePageDTO()
                        self.onChange!(MovieState.Change.emptyResult)
                    }else{
                        self.moviePage = moviePage
                        self.onChange!(MovieState.Change.success)
                    }
                }
            }
        }
    }
    
    //MARK:- ScrollViewModel methods
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows() -> Int{
        return moviePage.results.count
    }
}
