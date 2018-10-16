//
//  UIImageView+Additions.swift
//  MyFavoriteMovies
//
//  Created by Lucas César  Nogueira Fonseca on 16/10/2018.
//  Copyright © 2018 Lucas César  Nogueira Fonseca. All rights reserved.
//

import UIKit

extension UIImageView {
    func setImage(with url:URL?) {
        DispatchQueue.main.async(){
            self.startActivityIndicator()
            self.sd_setImage(with: url, placeholderImage: UIImage(named: AppConstants.placeHolder)) { (_, _, _, _) in
                self.stopActivityIndicator()
            }
        }
    }
}


