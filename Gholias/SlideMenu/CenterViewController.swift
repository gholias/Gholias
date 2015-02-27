//
//  CenterViewController.swift
//  SlideOutNavigation
//
//  Created by James Frost on 03/08/2014.
//  Copyright (c) 2014 James Frost. All rights reserved.
//

import UIKit

protocol CenterViewController {
    var delegate: ContainerViewControllerDelegate? { get set }
    var leftButton: HamburgerButton! { get set }
}

public class CenterTableViewController: BaseTableViewController, CenterViewController {
  
    var delegate: ContainerViewControllerDelegate?
    var leftButton: HamburgerButton!

    override public func viewDidLoad() {
        super.viewDidLoad()
        self.setupLeftMenuButton()
    }

    //MARK: - Left Button
    public func setupLeftMenuButton() {
        self.leftButton = HamburgerButton(frame: CGRectMake(0, 0, 44, 44))
        self.leftButton.addTarget(self, action: "leftMenuTapped:", forControlEvents:.TouchUpInside)
        var leftBarButtonItem : UIBarButtonItem = UIBarButtonItem(customView: self.leftButton)
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    var shinked: Bool = false {
        didSet {
            if self.shinked {
                UIView.animateWithDuration(0.6, animations: {
                    self.leftButton.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.7, 0.7)

                })
            } else {
                UIView.animateWithDuration(0.6, animations: {
                    self.leftButton.transform = CGAffineTransformIdentity
                })
            }
        }
    }
    
    // MARK: Button actions
    
    @IBAction func leftMenuTapped(sender: AnyObject) {
       // NSLog("leftMenuTapped")
        if let d = self.delegate {
            self.shinked = !self.shinked
            d.toggleLeftPanel?()
        }
    }
    
    @IBAction func rightMenuTapped(sender: AnyObject) {
        if let d = self.delegate {
            d.toggleRightPanel?()
        }
    }
}

public class CenterUIViewController: BaseViewController, CenterViewController {
    
    var delegate: ContainerViewControllerDelegate?
    var leftButton: HamburgerButton!
    

    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.setupLeftMenuButton()
    }
    
    public func setupLeftMenuButton() {
        self.leftButton = HamburgerButton(frame: CGRectMake(0, 0, 44, 44))
        self.leftButton.addTarget(self, action: "leftMenuTapped:", forControlEvents:.TouchUpInside)
        var leftBarButtonItem : UIBarButtonItem = UIBarButtonItem(customView: self.leftButton)
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    var shinked: Bool = false{
        didSet {
            if self.shinked {
                UIView.animateWithDuration(0.6, animations: {
                    self.leftButton.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.7, 0.7)
                    
                })
            } else {
                UIView.animateWithDuration(0.6, animations: {
                    self.leftButton.transform = CGAffineTransformIdentity
                })
            }
        }
    }
    
    // MARK: Button actions
    
    @IBAction func leftMenuTapped(sender: AnyObject) {
        // NSLog("leftMenuTapped")
        if let d = delegate {
            shinked = !shinked
            d.toggleLeftPanel?()
        }
    }
    
    @IBAction func rightMenuTapped(sender: AnyObject) {
        if let d = delegate {
            d.toggleRightPanel?()
        }
    }
}