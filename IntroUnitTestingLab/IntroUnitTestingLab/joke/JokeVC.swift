//
//  ViewController.swift
//  IntroUnitTestingLab
//
//  Created by casandra grullon on 12/2/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import UIKit

class JokeVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var jokes = [OfficialJoke](){
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
        jokes = OfficialJoke.getJokes()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? JokeDetailVC,
        let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("segue issue")
        }
        detailVC.joke = jokes[indexPath.row]
    }
    

}
extension JokeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jokeCell", for: indexPath)
        let joke = jokes[indexPath.row]
        
        cell.textLabel?.text = joke.setup
        
        return cell
    }
}
