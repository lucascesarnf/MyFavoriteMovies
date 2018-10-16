//
//  SearchCollectionViewCell.swift
//  MyFavoriteMovies
//
//  Created by Lucas César  Nogueira Fonseca on 03/09/18.
//  Copyright © 2018 Lucas César  Nogueira Fonseca. All rights reserved.
//

import UIKit
import SDWebImage

class SearchCollectionViewCell : UICollectionViewCell{
    
    //MARK:- Constants
    static let identifier: String = "searchCollectionViewCell"
    
    //MARK:- Private variables
    private var viewModel: SearchCellViewModel!
    
    //MARK:- View variables
    @IBOutlet weak var posterImage: UIImageView!
    
    //MARK:- Primitive functions
    override func awakeFromNib() {
        super.awakeFromNib()
        
        posterImage.setLittleBorderFeatured()
    }
    
    //MARK:- Private functions
    func configure(){
        posterImage.setImage(with:URL(string: viewModel.posterPath))
    }
    
    //MARK:- Public functions
    func setup(viewModel: SearchCellViewModel){
        self.viewModel = viewModel
        
        configure()
    }
}
