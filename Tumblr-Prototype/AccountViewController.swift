//
//  AccountViewController.swift
//  Tumblr-Prototype
//
//  Created by Daniel Eden on 9/7/14.
//  Copyright (c) 2014 Daniel Eden. All rights reserved.
//

import UIKit

class AccountViewController: ViewController {

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
