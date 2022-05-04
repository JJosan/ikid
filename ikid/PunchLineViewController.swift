//
//  PunchLineViewController.swift
//  ikid
//
//  Created by Jason Nguyen on 5/2/22.
//

import UIKit

class PunchLineViewController: UIViewController {

    var punchline = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(punchline)
        punchline.translatesAutoresizingMaskIntoConstraints = false
        punchline.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        punchline.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
}
