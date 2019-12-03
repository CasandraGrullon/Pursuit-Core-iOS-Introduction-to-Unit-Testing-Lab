//
//  StarWarsVC.swift
//  IntroUnitTestingLab
//
//  Created by casandra grullon on 12/2/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import UIKit

class StarWarsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var starwars = [StarWarsInfo](){
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
    }
    
    func loadData(){
        starwars = StarWars.getMovieInfo()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? StarWarsDetailVC, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("segue not working")
        }
        detailVC.starwarsMovie = starwars[indexPath.row]
    }
    
}

extension StarWarsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starwars.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "starWarsCell", for: indexPath)
        let swmovie = starwars[indexPath.row]
        
        cell.textLabel?.text = swmovie.title
        cell.detailTextLabel?.text = "Episode: \(swmovie.episode)"
        
        return cell
    }
}
