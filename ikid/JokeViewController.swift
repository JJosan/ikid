//
//  JokeViewController.swift
//  ikid
//
//  Created by Jason Nguyen on 5/2/22.
//

import UIKit

class JokeViewController: UIViewController {

    var input = ""
    
    var jokes : [String : [String]] = [
        "Good": ["The longer you don't pee,", "The longer you pee"],
        "Pun": ["I drove my car into a tree", "Now, it's a Mercedes-Bends"],
        "Dad" : ["How many apples grow on a tree?", "All of them"],
        "Knock Knock" : ["Knock Knock", "Who's There?", "Dejav", "Dejav Who?", "Knock Knock"]
    ]
    
    @IBOutlet weak var toolbar: UIToolbar!
    var setupVC : SetupViewController! = nil
    var punchlineVC : PunchLineViewController! = nil
    
    var knock1 : Knock1ViewController! = nil
    var knock2 : Knock2ViewController! = nil
    var knock3 : Knock3ViewController! = nil
    
    @IBOutlet weak var btn_dismiss: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        btn_dismiss.addTarget(self, action: #selector(dismiss(_:)), for: .touchUpInside)
        firstBuilder()
        switchViewController(nil, to: setupVC)
        toolbar.clipsToBounds = true
    }
    
    @objc func dismiss(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    
    @IBAction func btn_switchViews(_ sender: Any) {
        secondBuilder()
        firstBuilder()
        if input == "Knock Knock" {
            thirdBuilder()
            fourthBuilder()
            fifthBuilder()
        }
        
        
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if input != "Knock Knock" {
            if setupVC != nil && setupVC?.view.superview != nil {
                UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
                punchlineVC.view.frame = self.view.frame
                switchViewController(setupVC, to: punchlineVC)
            }
            else {
                UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
                setupVC.view.frame = view.frame
                switchViewController(punchlineVC, to: setupVC)
            }
        } else {
            if setupVC != nil && setupVC?.view.superview != nil {
                UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
                punchlineVC.view.frame = self.view.frame
                switchViewController(setupVC, to: punchlineVC)
            }
            else if punchlineVC != nil && punchlineVC?.view.superview != nil {
                UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
                setupVC.view.frame = view.frame
                switchViewController(punchlineVC, to: knock1)
            } else if knock1 != nil && knock1?.view.superview != nil {
                UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
                knock1.view.frame = view.frame
                switchViewController(knock1, to: knock2)
            } else if knock2 != nil && knock2?.view.superview != nil {
                UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
                knock2.view.frame = view.frame
                switchViewController(knock2, to: knock3)
            } else {
                UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
                knock3.view.frame = view.frame
                switchViewController(knock3, to: setupVC)
            }
            
        }
        UIView.commitAnimations()
    }
    
//    func changeLabel(_ input : String) {
//        label_question.text = jokes[input]
//    }
    
    fileprivate func switchViewController(_ from: UIViewController?, to: UIViewController?) {
        if from != nil {
            from!.willMove(toParent: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParent()
        }
        
        if to != nil {
            self.addChild(to!)
            self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParent: self)
        }
    }

    fileprivate func firstBuilder() {
        if setupVC == nil {
            setupVC =
                storyboard?
                    .instantiateViewController(withIdentifier: "Setup")
                as! SetupViewController
            setupVC.setup.text = jokes[input]![0]
        }
    }
    fileprivate func secondBuilder() {
        if punchlineVC == nil {
            punchlineVC =
                storyboard?
                    .instantiateViewController(withIdentifier: "Punchline")
                as! PunchLineViewController
            punchlineVC.punchline.text = jokes[input]![1]
        }
    }

    fileprivate func thirdBuilder() {
        if knock1 == nil {
            knock1 =
                storyboard?
                    .instantiateViewController(withIdentifier: "Knock1")
                as! Knock1ViewController
            knock1.label.text = jokes[input]![2]
        }
    }
    
    fileprivate func fourthBuilder() {
        if knock2 == nil {
            knock2 =
                storyboard?
                    .instantiateViewController(withIdentifier: "Knock2")
                as! Knock2ViewController
            knock2.label.text = jokes[input]![3]
        }
    }
    
    fileprivate func fifthBuilder() {
        if knock3 == nil {
            knock3 =
                storyboard?
                    .instantiateViewController(withIdentifier: "Knock3")
                as! Knock3ViewController
            knock3.label.text = jokes[input]![4]
        }
    }
}
