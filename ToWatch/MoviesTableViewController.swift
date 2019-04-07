//
//  ViewController.swift
//  ToWatch
//
//  Created by Lam Tu on 6/4/19.
//  Copyright © 2019 Lam Tu. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController, AddMovieDelegate, UISearchBarDelegate {
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movies = loadData() ?? [Movie]()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        cell.textLabel?.text = movies[indexPath.row].title
        cell.detailTextLabel?.text = String(movies[indexPath.row].year)
        return cell 
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailViewController = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            detailViewController.movie = movies[indexPath.row]
            navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addMovie" {
            let addMovieVC = segue.destination as! AddMovieViewController
            addMovieVC.delegate = self
        }
    }
    func loadData() -> [Movie]? {
        var movies : [Movie]? = nil
        do {
            let fileUrl = Bundle.main.url(forResource: "movies", withExtension: "json")
            let fm = FileManager.default
            let docUrl = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let movieUrl = docUrl.appendingPathComponent("movies.json")
            if !fm.fileExists(atPath: movieUrl.path){
                print("File at path \(movieUrl.path) does not exist!")
                try fm.copyItem(at: fileUrl!, to: movieUrl)
            }
            if let movieData = fm.contents(atPath: movieUrl.path) {
                movies = try JSONDecoder().decode([Movie].self, from: movieData)
            }
        } catch {
            print("Everything is wrong")
        }
        
        return movies
    }
    
    func addMovie(_ movie: Movie) {
        movies.append(movie)
        do {
            let fm = FileManager.default
            let docsurl = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let movieUrl = docsurl.appendingPathComponent("movies.json")
            try fm.removeItem(at: movieUrl)
            let encodedData = try JSONEncoder().encode(movies)
            try encodedData.write(to: movieUrl, options: .atomic)
        } catch {
            print("error adding file")
        }
        self.tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let keyword = searchBar.text {
            movies = movies.filter { $0.title.starts(with: keyword) }
            self.tableView.reloadData()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            movies = loadData()!
            self.tableView.reloadData()
        }
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "addMovie", sender: self)
    }
    @IBAction func sortButtonTapped(_ sender: Any) {
        movies.sort(by: { $0.title < $1.title })
        self.tableView.reloadData()
    }
}

