//
//  UIScrollView+Additions.swift
//  MyFavoriteMovies
//
//  Created by Lucas César  Nogueira Fonseca on 25/09/2018.
//  Copyright © 2018 Lucas César  Nogueira Fonseca. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView{
    func showEmptyCell(string: String){
        let emptyCell: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height))
        emptyCell.text = string
        emptyCell.textColor = UIColor(named: "TextPattern")
        emptyCell.textAlignment = .center
        backgroundView  = emptyCell
    }
    
    func hideEmptyCell(){
        backgroundView = nil
    }
}

