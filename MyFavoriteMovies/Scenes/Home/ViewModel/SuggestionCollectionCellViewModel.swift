//
//  SuggestionCollectionCellViewModel.swift
//  MyFavoriteMovies
//
//  Created by Lucas César  Nogueira Fonseca on 09/10/2018.
//  Copyright © 2018 Lucas César  Nogueira Fonseca. All rights reserved.
//

import Foundation

class SuggestionCollectionCellViewModel{
    
    //MARK:- Private variables
    private let movie: MovieDTO!
    
    //MARK:- Public variables
    var posterPath: String{
        return AppConstants.BaseImageURL + Quality.low.rawValue + "/" + (movie.poster_path ?? "")
    }
    
    //MARK:- Public methods
    init(movie: MovieDTO){
        self.movie = movie
    }
}
