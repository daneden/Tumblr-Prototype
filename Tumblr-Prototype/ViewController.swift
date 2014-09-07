//
//  ViewController.swift
//  Tumblr-Prototype
//
//  Created by Daniel Eden on 9/6/14.
//  Copyright (c) 2014 Daniel Eden. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum ViewPresentation {
        case Normal
        case Modal
    }
    
    let presentationMode = ViewPresentation.Normal
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

