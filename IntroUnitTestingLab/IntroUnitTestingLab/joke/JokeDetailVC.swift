//
//  JokeDetailVC.swift
//  IntroUnitTestingLab
//
//  Created by casandra grullon on 12/2/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import UIKit

class JokeDetailVC: UIViewController {

    @IBOutlet weak var punchlineLabel: UILabel!
    
    var joke: OfficialJoke?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

    }
    func updateUI(){
        punchlineLabel.text = joke?.punchline ?? ""
        navigationItem.title = joke?.setup ?? ""
    }

}
