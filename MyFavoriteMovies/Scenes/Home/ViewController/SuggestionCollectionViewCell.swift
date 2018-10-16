//
//  SuggestionCollectionViewCell.swift
//  MyFavoriteMovies
//
//  Created by Lucas César  Nogueira Fonseca on 14/09/2018.
//  Copyright © 2018 Lucas César  Nogueira Fonseca. All rights reserved.
//

import Foundation
import UIKit

class SuggestionCollectionViewCell: UICollectionViewCell{
    
    //MARK:- Constants
    static let identifier = "suggestionMovieCollectionViewCell"
    
    //MARK:- Private variables
    private var viewModel: SuggestionCollectionCellViewModel!
    
    //MARK:- View variables
    @IBOutlet weak var posterImageView: UIImageView!
    
    //MARK:- Private methods
    private func configure(){
        posterImageView.setLittleBorderFeatured()
        posterImageView.setImage(with:URL(string: viewModel.posterPath))
    }
    
    //MARK:- Public methods
    func setup(viewModel: SuggestionCollectionCellViewModel){
        self.viewModel = viewModel
        configure()
    }
}
