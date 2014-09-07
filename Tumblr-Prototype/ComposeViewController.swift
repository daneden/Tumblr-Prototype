//
//  ComposeViewController.swift
//  Tumblr-Prototype
//
//  Created by Daniel Eden on 9/6/14.
//  Copyright (c) 2014 Daniel Eden. All rights reserved.
//

import UIKit

class ComposeViewController: ViewController {
    
    var thisPresentationMode = ViewPresentation.Modal
    
    override var presentationMode: ViewPresentation {
        get {
            return thisPresentationMode
        }
        set {
            thisPresentationMode = newValue as ViewPresentation
        }
    }
    
    @IBOutlet weak var composeTextButton: UIButton!
    @IBOutlet weak var composePhotoButton: UIButton!
    @IBOutlet weak var composeQuoteButton: UIButton!
    @IBOutlet weak var composeLinkButton: UIButton!
    @IBOutlet weak var composeChatButton: UIButton!
    @IBOutlet weak var composeVideoButton: UIButton!
    
    var buttons: [UIButton]!
    
    @IBOutlet weak var dismissButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        buttons = [composeTextButton, composeQuoteButton, composePhotoButton, composeLinkButton, composeVideoButton, composeChatButton]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.view.alpha = 0
        
        for button in buttons {
            button.transform = CGAffineTransformMakeTranslation(0, self.view.frame.height)
        }
        
        dismissButton.transform = CGAffineTransformMakeTranslation(0, dismissButton.frame.height)
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.2, animations: {
            self.view.alpha = 1
            }) { (finished: Bool) -> Void in
                
                UIView.animateWithDuration(0.2, animations: {
                    self.dismissButton.transform = CGAffineTransformIdentity
                })
            
                for button in enumerate(self.buttons) {
                    
                    var delay = NSTimeInterval(CGFloat(button.index) / 45)
                    
                    UIView.animateWithDuration(0.5,
                        delay: delay,
                        usingSpringWithDamping: 0.7,
                        initialSpringVelocity: 4,
                        options: nil,
                        animations: {
                            
                            button.element.transform = CGAffineTransformIdentity
                            
                        }) { (finished: Bool) -> Void in

                    }
                }
                
        }
    }

    @IBAction func onDismissTouch(sender: AnyObject) {
        
        UIView.animateWithDuration(0.2, animations: {
            self.dismissButton.transform = CGAffineTransformMakeTranslation(0, self.dismissButton.frame.height)
        })
        
        for button in enumerate(self.buttons) {
            
            var delay = NSTimeInterval(CGFloat(button.index) / 45)
            
            UIView.animateWithDuration(0.3,
                delay: delay,
                options: nil,
                animations: {
                    
                    button.element.transform = CGAffineTransformMakeTranslation(0, -self.view.frame.height)
                    
                }) { (finished: Bool) -> Void in
                    if (button.index + 1) == self.buttons.count {
                        UIView.animateWithDuration(0.2, animations: {
                            self.view.alpha = 0
                            }) { (finished: Bool) -> Void in
                                self.view.removeFromSuperview()
                        }
                    }
            }
        }
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
