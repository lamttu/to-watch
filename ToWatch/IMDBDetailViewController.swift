//
//  IMDBDetailViewController.swift
//  ToWatch
//
//  Created by Lam Tu on 12/4/19.
//  Copyright © 2019 Lam Tu. All rights reserved.
//

import UIKit
import Alamofire

class IMDBDetailViewController: UIViewController {
    var movieId : String?
    let apikey = "5b80c9a9"
    let OMDBApi = "https://www.omdbapi.com/"
    
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var genreLbl: UILabel!
    @IBOutlet weak var directorLbl: UILabel!
    @IBOutlet weak var ratedLbl: UILabel!
    @IBOutlet weak var plotLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        // Do any additional setup after loading the view.
    }
    
    func fetchData() {
        let params : [String : String] = ["i": movieId! , "apikey" : apikey]
        Alamofire.request(OMDBApi, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON {
            response in
            if response.result.isSuccess {
                do {
                    let movie = try JSONDecoder().decode(MovieDetail.self, from: response.data!)
                    self.updateUI(movie)
                } catch {
                    print("Something is wrong")
                }
            } else {
                self.updateUIFetchFail()
            }
        }
    }
    
    func updateUI(_ movie: MovieDetail) {
        yearLbl.text = "Year: \(movie.year)"
        scoreLbl.text = "Score: \(movie.score)"
        genreLbl.text = "Genre: \(movie.genre)"
        directorLbl.text = "Director: \(movie.director)"
        ratedLbl.text = "Rating: \(movie.rated)"
        plotLbl.text = "Plot: \(movie.plot)"
        titleLbl.text = movie.title
    }
    
    func updateUIFetchFail() {
        yearLbl.text = ""
        scoreLbl.text = ""
        genreLbl.text = ""
        directorLbl.text = ""
        ratedLbl.text = ""
        plotLbl.text = ""
        titleLbl.text = "Connection failed"
    }

}
