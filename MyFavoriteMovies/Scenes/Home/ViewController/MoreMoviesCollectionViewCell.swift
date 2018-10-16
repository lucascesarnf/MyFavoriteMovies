//
//  MoreMoviesCollectionViewCell.swift
//  MyFavoriteMovies
//
//  Created by Lucas César  Nogueira Fonseca on 24/09/2018.
//  Copyright © 2018 Lucas César  Nogueira Fonseca. All rights reserved.
//

import Foundation
import UIKit



class MoreMoviesCollectionViewCell: UICollectionViewCell{
    
    //MARK:- Constants
    static let identifier = "moreMoviesCollectionViewCell"
    
    //MARK:- Private variables
    private var viewModel: MoreMoviesCollectionCellViewModel!
    
    //MARK:- View variables
    @IBOutlet weak var searchMoreMoviesButton: UIButton!
    
    //MARK:- View actions
    @IBAction func searchMoreMovies(_ sender: Any) {
        searchMoreMoviesButton.isEnabled = false
        viewModel.reload()
    }
    
    //MARK:- Public methods
    func setup(viewModel: MoreMoviesCollectionCellViewModel){
        self.viewModel = viewModel
        bindViewModel()
    }
}

//MARK:- MoviewViewController methods
extension MoreMoviesCollectionViewCell: MovieViewController{
    func viewModelStateChange(change: MovieState.Change) {
        switch change {
        case .success:
            self.searchMoreMoviesButton.isEnabled = true
        case .error(let error):
            showAlert(title: error.localizedDescription)
        default:
            break
        }
    }
    
    func bindViewModel() {
        viewModel.onChange = viewModelStateChange
    }
}
