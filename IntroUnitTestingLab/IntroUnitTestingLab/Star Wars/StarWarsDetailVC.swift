//
//  StarWarsDetailVC.swift
//  IntroUnitTestingLab
//
//  Created by casandra grullon on 12/2/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import UIKit

class StarWarsDetailVC: UIViewController {

    
    @IBOutlet weak var textView: UITextView!
    
    var starwarsMovie: StarWarsInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        navigationItem.title = starwarsMovie.title
    }

    func updateUI() {
        textView.text = starwarsMovie.openingCrawl
    }

}
