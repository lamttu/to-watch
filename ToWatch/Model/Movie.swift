//
//  Movie.swift
//  ToWatch
//
//  Created by Lam Tu on 7/4/19.
//  Copyright © 2019 Lam Tu. All rights reserved.
//

import Foundation

class Movie : NSObject, Codable {
    var title : String
    var year : Int
    var duration : Int
    var genre : String
    var plot : String
    
    init(movieTitle: String, yearProduced: Int, movieDuration: Int, movieGenre: String, moviePlot: String) {
        title = movieTitle
        year = yearProduced
        duration = movieDuration
        genre = movieGenre
        plot = moviePlot
    }
}
