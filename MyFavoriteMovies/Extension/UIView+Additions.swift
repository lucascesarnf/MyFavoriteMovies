//
//  UIView+Additions.swift
//  MyFavoriteMovies
//
//  Created by Lucas César  Nogueira Fonseca on 14/09/2018.
//  Copyright © 2018 Lucas César  Nogueira Fonseca. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    
    func getColor() -> CGColor{
        return #colorLiteral(red: 0.1882352941, green: 0.2588235294, blue: 0.3294117647, alpha: 1)
    }
    
    func setCornerRadius(){
        layer.cornerRadius = 3
        layer.masksToBounds = true
    }
    
    func setBorderFeatured(){
        setCornerRadius()
        layer.borderWidth = 2
        layer.borderColor = getColor()
    }
    
    func setLittleBorderFeatured(){
        //setCornerRadius()
        layer.borderWidth = 1
        layer.borderColor = getColor()
    }
    
    func setBigBorderFeatured(){
        layer.borderWidth = 2
        layer.borderColor = getColor()
    }
}
