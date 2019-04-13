//
//  BrowseIMDBViewController.swift
//  ToWatch
//
//  Created by Lam Tu on 11/4/19.
//  Copyright © 2019 Lam Tu. All rights reserved.
//

import UIKit
import Alamofire

class BrowseIMDBViewController: UITableViewController, UISearchBarDelegate {
    let apikey = "5b80c9a9"
    let OMDBApi = "https://www.omdbapi.com/"
    var movies = [MovieIMDB]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        movies = fetchData()
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func fetchData() -> [MovieIMDB] {
        var imdbMovies = [MovieIMDB]()
        let params : [String : String] = ["s": "Man" , "apikey" : apikey]
        Alamofire.request(OMDBApi, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON {
            response in
            if response.result.isSuccess {
                do {
                    let imdbRes = try JSONDecoder().decode(IMDBResponse.self, from: response.data!)
                    for movie in imdbRes.Search {
                        let m = MovieIMDB(movieTitle: movie.title, yearProduced: movie.year, id: movie.imdbID)
                        imdbMovies.append(m)
                    }
                    self.movies = imdbMovies
                    self.tableView.reloadData()
                } catch {
                    print("Something is wrong")
                }
            } else {
                print("Error")
            }
        }
       
        return imdbMovies
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imdbCell", for: indexPath)
        cell.textLabel?.text = movies[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let imdbDetailViewController = storyboard?.instantiateViewController(withIdentifier: "IMDBDetail") as? IMDBDetailViewController{
            imdbDetailViewController.movieId = movies[indexPath.row].imdbID
            navigationController?.pushViewController(imdbDetailViewController, animated: true)
        }
    }
}
