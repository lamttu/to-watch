//
//  AddMovieViewController.swift
//  ToWatch
//
//  Created by Lam Tu on 6/4/19.
//  Copyright © 2019 Lam Tu. All rights reserved.
//

import UIKit

protocol AddMovieDelegate {
    func addMovie(_ movie : Movie)
}

class AddMovieViewController: UIViewController {
    var delegate : AddMovieDelegate?
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var genreField: UITextField!
    @IBOutlet weak var durationField: UITextField!
    @IBOutlet weak var plotField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addMovieBtnTapped(_ sender: Any) {
        let mTitle = titleField.text!
        let mYear = Int(yearField.text!)
        let mGenre = genreField.text!
        let mDuration = Int(durationField.text!)
        let mPlot = plotField.text!
        let movie = Movie(movieTitle: mTitle, yearProduced: mYear!, movieDuration: mDuration!, movieGenre: mGenre, moviePlot: mPlot)
        
        delegate?.addMovie(movie);
        navigationController?.popViewController(animated: true)
        
        dismiss(animated: true, completion: nil)
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
