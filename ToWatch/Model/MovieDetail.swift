//
//  MovieDetail.swift
//  ToWatch
//
//  Created by Lam Tu on 12/4/19.
//  Copyright © 2019 Lam Tu. All rights reserved.
//

import Foundation

class MovieDetail : NSObject, Codable {
    var title : String
    var year : String
    var rated : String
    var score : String
    var director: String
    var plot : String
    var genre : String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case score = "imdbRating"
        case director = "Director"
        case plot = "Plot"
        case genre = "Genre"
    }
    
}
