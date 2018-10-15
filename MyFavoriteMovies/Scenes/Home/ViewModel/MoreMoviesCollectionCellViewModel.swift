//
//  MoreMoviesCollectionCellViewModel.swift
//  MyFavoriteMovies
//
//  Created by Lucas César  Nogueira Fonseca on 09/10/2018.
//  Copyright © 2018 Lucas César  Nogueira Fonseca. All rights reserved.
//

import Foundation

protocol MoreMoviesCollectionViewCellDelegate {
    func searchMoreMovies(completion: @escaping () -> ())
}

class MoreMoviesCollectionCellViewModel: MovieViewModel{

    //MARK:- Private variables
    private let delegate: MoreMoviesCollectionViewCellDelegate!
    
    //MARK:- Public variables
    var state: MovieState
    var onChange: ((MovieState.Change) -> ())?
    
    //MARK:- MovieViewModel methods
    func reload() {
        delegate.searchMoreMovies {
            self.onChange!(MovieState.Change.success)
        }
    }
    
    //MARK:- Public methods
    init(delegate: MoreMoviesCollectionViewCellDelegate){
        self.state = MovieState()
        self.delegate = delegate
    }
}
