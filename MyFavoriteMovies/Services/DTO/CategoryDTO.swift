//
//  CategoryDTO.swift
//  MyFavoriteMovies
//
//  Created by Lucas César  Nogueira Fonseca on 12/09/2018.
//  Copyright © 2018 Lucas César  Nogueira Fonseca. All rights reserved.
//

import Foundation

struct CategoryDTO : Codable{
    var id: Int?
    var name: String?
    var movies: [MovieDTO]?
}
