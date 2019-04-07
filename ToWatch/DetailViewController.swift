//
//  DetailViewController.swift
//  ToWatch
//
//  Created by Lam Tu on 6/4/19.
//  Copyright © 2019 Lam Tu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var genreLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var plotLbl: UILabel!
    var movie : Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let selectedMovie = movie {
            titleLbl.text = selectedMovie.title
            yearLbl.text = String(selectedMovie.year)
            genreLbl.text = String(selectedMovie.genre)
            durationLbl.text = String(selectedMovie.duration)
            plotLbl.text = selectedMovie.plot
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
