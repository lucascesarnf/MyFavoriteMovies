//
//  HomeViewModel.swift
//  MyFavoriteMovies
//
//  Created by Lucas César  Nogueira Fonseca on 05/10/2018.
//  Copyright © 2018 Lucas César  Nogueira Fonseca. All rights reserved.
//

import Foundation

class HomeViewModel: MovieViewModel, BaseDetailViewModel{
    
    //MARK:- Private variables
    private var moviePageList: [MoviePageDTO]!
    private(set) var movie: MovieDTO?
    
    //MARK:- Public variables
    var state: MovieState
    var onChange: ((MovieState.Change) -> ())?
    
    private func searchMoviePage(sort: Sort, order: Order, label: String, isBestMovieHere: Bool){
        MovieService.shared().getMoviePage(sort: sort, order: order){ newMoviePage, response, error in
            if let error = error {
                self.onChange!(MovieState.Change.error(error))
                return
            }
            var moviePage = newMoviePage
            moviePage?.label = label
            if let moviePage = moviePage {
             self.moviePageList.append(moviePage)
            }
            
            if isBestMovieHere{
                if let bestMovie = moviePage?.results.first{
                    MovieService.shared().getMovieDetail(id: bestMovie.id!){ movie, response, error in
                        if let error = error {
                            self.onChange!(MovieState.Change.error(error))
                            return
                        }
                        self.movie = movie
                        self.onChange!(MovieState.Change.success)
                    }
                }
            }
            
            self.onChange!(MovieState.Change.success)
        }
    }
    
    private func searchTrendingMoviePage(label: String){
        MovieService.shared().getTrendingMovies(){ newMoviePage, response, error in
            if let error = error {
                self.onChange!(MovieState.Change.error(error))
                return
            }
            var moviePage = newMoviePage
            moviePage?.label = label
            if let moviePage = moviePage {
                self.moviePageList.append(moviePage)
            }
            self.onChange!(MovieState.Change.success)
        }
    }
    
    private func setMoviePageList(){
        moviePageList = [MoviePageDTO]()
        
        for i in 0...2{
            switch i{
            case 0:
                searchMoviePage(sort: Sort.popularity, order: Order.descending, label: "Populares da semana", isBestMovieHere: true)
                break
            case 1:
                searchMoviePage(sort: Sort.voteCount, order: Order.descending, label: "Mais votados de todos os tempos", isBestMovieHere: false)
                break
            case 2:
                searchTrendingMoviePage(label: "Melhores do dia")
                break
            default:
                break
            }
        }
    }
    
    //MARK:- Public methods
    init(){
        state = MovieState()
        movie = MovieDTO()
    }
    
    func getSuggestionCellViewModel(index: Int, delegate: SuggestionCellViewModelDelegate) -> SuggestionCellViewModel{
        
        var cellViewModel: SuggestionCellViewModel
        
        switch index{
        case 0:
            cellViewModel = SuggestionCellViewModel(moviePage: moviePageList[index], delegate: delegate, canSearchMore: true, sort: Sort.popularity)
            break
        case 1:
            cellViewModel = SuggestionCellViewModel(moviePage: moviePageList[index], delegate: delegate, canSearchMore: true, sort: Sort.voteCount)
            break
        default:
            cellViewModel = SuggestionCellViewModel(moviePage: moviePageList[index], delegate: delegate, canSearchMore: false)
            break
        }
        
        return cellViewModel
    }
    
    //MARK:- MovieViewModel methods
    func reload() {
        setMoviePageList()
    }
    
    //MARK:- ScrollViewModel methods
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows() -> Int {
        return moviePageList.count
    }
    
    //MARK:- BaseDetailViewModel
    func numberOfGenres() -> Int {
        if movie?.genres == nil {
            return 0
        }
        
        return movie?.genres?.count  ?? 0
    }
    
    func getGenreViewModel(index: Int) -> GenreViewModel? {
        let genreViewModel = GenreViewModel(genre: movie?.genres?[index], style: .pattern)
        
        return genreViewModel
    }
}
