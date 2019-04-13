//
//  IMDBResponse.swift
//  ToWatch
//
//  Created by Lam Tu on 12/4/19.
//  Copyright © 2019 Lam Tu. All rights reserved.
//

import Foundation

struct IMDBResponse : Decodable {
    var Response : String
    var totalResults : String
    var Search : [MovieIMDB]
    
    struct MovieIMDB : Decodable {
        var title : String
        var year : String
        var imdbID : String
        var movieType : String
        var poster: String
        
        private enum CodingKeys: String, CodingKey {
            case title = "Title"
            case year = "Year"
            case imdbID
            case movieType = "Type"
            case poster = "Poster"
        }
    }

}
