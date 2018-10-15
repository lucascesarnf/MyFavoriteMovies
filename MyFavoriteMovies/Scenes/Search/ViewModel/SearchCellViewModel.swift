//
//  SearchCellViewModel.swift
//  MyFavoriteMovies
//
//  Created by Lucas César  Nogueira Fonseca on 08/10/2018.
//  Copyright © 2018 Lucas César  Nogueira Fonseca. All rights reserved.
//

import Foundation

class SearchCellViewModel{
    //MARK:- Private variables
    private let movie: MovieDTO
    
    //MARK:- Public variables
    var posterPath: String{
        guard let path = movie.poster_path else { return "" }
        
        return AppConstants.BaseImageURL + Quality.low.rawValue + path
    }
    
    //MARK:- Public methods
    init(movie: MovieDTO){
        self.movie = movie
    }
}
