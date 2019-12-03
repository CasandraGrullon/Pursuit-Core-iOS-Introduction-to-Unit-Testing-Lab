//
//  TriviaVC.swift
//  IntroUnitTestingLab
//
//  Created by casandra grullon on 12/2/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import UIKit

class TriviaVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var trivia = [TriviaInfo]() {
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
        tableView.dataSource = self
    }

    func loadData(){
        trivia = Trivia.getTrivia()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? TriviaDetailVC, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("issue in segue")
        }
        detailVC.triviaQuestion = trivia[indexPath.row]
    }

}

extension TriviaVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trivia.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "triviaCell", for: indexPath)
        
        let triviaQuestion = trivia[indexPath.row]
        
        cell.textLabel?.text = triviaQuestion.question.removingPercentEncoding
        cell.detailTextLabel?.text = triviaQuestion.category.removingPercentEncoding
        
        return cell
    }
}
