//
//  ViewController.swift
//  ikid
//
//  Created by Jason Nguyen on 5/1/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView_categories: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        tableView_categories.delegate = self
        tableView_categories.dataSource = self
        tableView_categories.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        tableView_categories.rowHeight = 100.0
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "toQuestion":
            let other = segue.destination as! JokeViewController
            other.input = String(describing: sender!)
        default:
            print("something is wrong")
        }
        
    }
    
    let data : [String] = [
        "Good", "Pun", "Dad", "Knock Knock"
    ]

    /*
     UITableViewDataSource methods
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }


    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "category", for: indexPath)
        cell.textLabel!.text = data[indexPath.row]
        return cell
    }

    /*
     UITableViewDelegate methods
     */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let item = data[indexPath.row]
        //print(item)
        performSegue(withIdentifier: "toQuestion", sender: item)
    }
    
    
}
