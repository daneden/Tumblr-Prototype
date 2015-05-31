//
//  LoginSegue.swift
//  modalTransitions
//
//  Created by Daniel Eden on 8/25/14.
//  Copyright (c) 2014 Daniel Eden. All rights reserved.
//

import UIKit

class LoginSegue: NSObject, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning  {
    
    var isPresenting: Bool!
    var duration = 0.3
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        
        if (isPresenting == true) {
            containerView.addSubview(toViewController!.view)
            toViewController!.view.alpha = 0
            
            UIView.animateWithDuration(duration,
                delay: 0,
                options: nil,
                animations: {
                    
                    toViewController!.view.alpha = 1
                    
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
            
        } else {
            
            UIView.animateWithDuration(duration,
                delay: 0,
                options: nil,
                animations: {
                    
                    UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.Default, animated: true)
                    fromViewController!.view.alpha = 0
                    
                }, completion: { (finished: Bool) -> Void in
                    //                    fromViewController.removeFromParentViewController()
                    fromViewController!.view.removeFromSuperview()
                    transitionContext.completeTransition(true)
            })
        }
        
        
    }
}
