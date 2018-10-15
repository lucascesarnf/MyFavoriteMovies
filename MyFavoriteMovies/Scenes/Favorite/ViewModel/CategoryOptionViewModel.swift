//
//  CategoryOptionViewModel.swift
//  MyFavoriteMovies
//
//  Created by Lucas César  Nogueira Fonseca on 09/10/2018.
//  Copyright © 2018 Lucas César  Nogueira Fonseca. All rights reserved.
//

import Foundation

class CategoryOptionViewModel{
    
    //MARK:- Private variables
    private let category: CategoryDTO
    
    //MARK:- Public variables
    var name: String{
        return category.name ?? "Genero"
    }
    
    //MARK:- Public methods
    init(category: CategoryDTO){
        self.category = category
    }
}
