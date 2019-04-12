//
//  MovieIMDB.swift
//  ToWatch
//
//  Created by Lam Tu on 12/4/19.
//  Copyright © 2019 Lam Tu. All rights reserved.
//

import Foundation

class MovieIMDB : NSObject, Codable {
    var title : String
    var year : Int
    var imdbID : String
    
    init(movieTitle: String, yearProduced: String, id: String) {
        title = movieTitle
        year = Int(yearProduced)!
        imdbID = id
    }
}
