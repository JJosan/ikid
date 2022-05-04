//
//  SetupViewController.swift
//  ikid
//
//  Created by Jason Nguyen on 5/3/22.
//

import UIKit

class SetupViewController: UIViewController {

    var setup = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(setup)
        setup.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        setup.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        setup.translatesAutoresizingMaskIntoConstraints = false
    }
}
