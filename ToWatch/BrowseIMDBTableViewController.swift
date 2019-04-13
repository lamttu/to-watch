//
//  File.swift
//  ToWatch
//
//  Created by Lam Tu on 11/4/19.
//  Copyright © 2019 Lam Tu. All rights reserved.
//

import UIKit

class BrowseIMDBTableViewController: UITableViewController, UISearchBarDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        return cell
    }
    
}
