//
//  TabBarViewController.swift
//  Tumblr-Prototype
//
//  Created by Daniel Eden on 9/6/14.
//  Copyright (c) 2014 Daniel Eden. All rights reserved.
//

import UIKit

class TabBarViewController: ViewController {

    @IBOutlet weak var contentView: UIView!
    
    var homeView: HomeViewController!
    var searchView: SearchViewController!
    var composeView: ComposeViewController!
    var accountView: AccountViewController!
    var trendingView: TrendingViewController!
    
    @IBOutlet weak var exploreHint: UIImageView!
    
    @IBOutlet weak var homeTab: UIButton!
    var currentTab: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        homeView = storyboard.instantiateViewControllerWithIdentifier("HomeView") as! HomeViewController
        composeView = storyboard.instantiateViewControllerWithIdentifier("ComposeView")as! ComposeViewController
        searchView = storyboard.instantiateViewControllerWithIdentifier("SearchView") as! SearchViewController
        accountView = storyboard.instantiateViewControllerWithIdentifier("AccountView") as! AccountViewController
        trendingView = storyboard.instantiateViewControllerWithIdentifier("TrendingView")as! TrendingViewController
        
        homeView.view.frame = contentView.frame

        contentView.addSubview(homeView.view)
        currentTab = homeTab
        homeTab.selected = true
        
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.Repeat, animations: {
            self.exploreHint.transform = CGAffineTransformMakeTranslation(0, -5)
        }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTabBarButtonTouch(tabButton: UIButton) {
        var content = ViewController()
        
        switch tabButton.tag {
        case 0:
            content = homeView
        case 1:
            content = searchView
        case 2:
            content = composeView
        case 3:
            content = accountView
        case 4:
            content = trendingView
        default:
            content = homeView
        }
        
        if content.presentationMode == ViewPresentation.Modal {
            self.view.addSubview(content.view)
        } else {
            currentTab.selected = false
            tabButton.selected = true
            
            content.view.frame = contentView.frame
            contentView.addSubview(content.view)
            
            currentTab = tabButton
        }
        
        if currentTab.tag == 1 {
            exploreHint.hidden = true
        } else {
            exploreHint.hidden = false
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
