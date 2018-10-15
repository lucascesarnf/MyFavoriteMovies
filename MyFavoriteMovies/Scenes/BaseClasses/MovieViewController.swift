//
//  BaseMovieViewController.swift
//  MyFavoriteMovies
//
//  Created by Lucas César  Nogueira Fonseca on 01/10/2018.
//  Copyright © 2018 Lucas César  Nogueira Fonseca. All rights reserved.
//

import UIKit

protocol MovieViewController{
    func viewModelStateChange(change: MovieState.Change)
    func bindViewModel()
}

protocol DataBaseViewController{
    func viewModelDataBaseChange(change: MovieState.Change)
}
