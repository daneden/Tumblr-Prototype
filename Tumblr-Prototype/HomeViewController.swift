//
//  HomeViewController.swift
//  Tumblr-Prototype
//
//  Created by Daniel Eden on 9/6/14.
//  Copyright (c) 2014 Daniel Eden. All rights reserved.
//

import UIKit

class HomeViewController: ViewController {

    var thisPresentationMode = ViewPresentation.Normal
    
    override var presentationMode: ViewPresentation {
        get {
            return thisPresentationMode
        }
        set {
            thisPresentationMode = newValue as ViewPresentation
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as! LoginViewController
    
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
    
        var transition = LoginSegue()
        transition.duration = 0.4
    
        destinationVC.transitioningDelegate = transition
    }

}
