//
//  UIView+Additions.swift
//  MyFavoriteMovies
//
//  Created by Lucas César  Nogueira Fonseca on 14/09/2018.
//  Copyright © 2018 Lucas César  Nogueira Fonseca. All rights reserved.
//

import Foundation
import UIKit

let indicatorTag:Int = 999

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
    
    
    func showAlert(title: String, message: String = ""){
        DispatchQueue.main.async(){
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            
            UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true)
        }
    }
    
    func startActivityIndicator() {
        stopActivityIndicator()
        let actInd: UIActivityIndicatorView = UIActivityIndicatorView()
        actInd.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        actInd.center = self.center
        actInd.hidesWhenStopped = true
        actInd.tag = indicatorTag
        actInd.style = UIActivityIndicatorView.Style.whiteLarge
        actInd.color = UIColor(named: "TextFeatured")
        self.addSubview(actInd)
        actInd.startAnimating()
    }
    
    func stopActivityIndicator() {
        if let subview = self.subviews.filter({$0.tag == indicatorTag}).first as? UIActivityIndicatorView {
            subview.stopAnimating()
            subview.removeFromSuperview()
        }
    }
}
