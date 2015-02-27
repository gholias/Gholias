//
//  ContainerViewController.swift
//  SlideOutNavigation
//
//  Created by James Frost on 03/08/2014.
//  Copyright (c) 2014 James Frost. All rights reserved.
//

import UIKit
import QuartzCore

enum SlideOutState {
    case BothCollapsed
    case LeftPanelExpanded
    case RightPanelExpanded
}

@objc
protocol ContainerViewControllerDelegate {
    optional func toggleLeftPanel()
    optional func toggleRightPanel()
    optional func collapseSidePanels()
    optional func openCenterViewControllerWithIdentifier(identifier: String)
}


public class ContainerViewController: UIViewController, ContainerViewControllerDelegate, UIGestureRecognizerDelegate {

    public var centerViewControllerIdentifier: String = "CenterViewController"
    public var leftViewControllerIdentifier: String = "LeftViewController"
    public var rightViewControllerIdentifier: String = "RightViewController"
    
    var centerNavigationController: UINavigationController!
    var centerViewController:  UIViewController!//CenterViewController!
    
    var currentState: SlideOutState = .BothCollapsed {
        didSet {
            let shouldShowShadow = currentState != .BothCollapsed
            showShadowForCenterViewController(shouldShowShadow)
        }
    }
    
    var leftViewController: SidePanelViewController?
    var rightViewController: SidePanelViewController?
    
    let centerPanelExpandedOffset: CGFloat = 80

    
    override public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        addChildCenterViewController(UIStoryboard.centerViewControllerWithIdentifier(centerViewControllerIdentifier)!)
        addLeftPanelViewController()

       // let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "handlePanGesture:")
       // centerNavigationController.view.addGestureRecognizer(panGestureRecognizer)
    }
  
    // MARK: CenterViewController delegate methods
  
    func toggleLeftPanel() {
        let notAlreadyExpanded = (currentState != .LeftPanelExpanded)
        
        if notAlreadyExpanded {
            addLeftPanelViewController()
        }
        
        animateLeftPanel(shouldExpand: notAlreadyExpanded)
    }
  
    func toggleRightPanel() {
        let notAlreadyExpanded = (currentState != .RightPanelExpanded)
        
        if notAlreadyExpanded {
            addRightPanelViewController()
        }
        animateRightPanel(shouldExpand: notAlreadyExpanded)
    }
    
    func collapseSidePanels() {
        switch (currentState) {
        case .RightPanelExpanded:
            toggleRightPanel()
        case .LeftPanelExpanded:
            toggleLeftPanel()
        default:
            break
        }
    }
    
    func openCenterViewControllerWithIdentifier(identifier: String) {
        centerViewControllerIdentifier = identifier
        addChildCenterViewController(UIStoryboard.centerViewControllerWithIdentifier(identifier)!)
        collapseSidePanels()
    }
    
    func openCenterAuthenticationViewControllerWithIdentifier(identifier: String) {
        centerViewControllerIdentifier = identifier
        addChildCenterViewController(UIStoryboard.centerAuthenticationViewControllerWithIdentifier(identifier)!)
        collapseSidePanels()
    }
  
    func addLeftPanelViewController() {
        if (leftViewController == nil) {
            leftViewController = UIStoryboard.leftViewControllerWithIdentifier(self.leftViewControllerIdentifier)
            leftViewController?.currentViewController = centerViewControllerIdentifier
            addChildSidePanelController(leftViewController!)
        }
    }
    
    func addChildCenterViewController(newCenterViewController: UIViewController) {
     
        centerViewController = newCenterViewController
        if let centerObj =  newCenterViewController as? CenterTableViewController {
            centerObj.delegate = self
        }
        if let centerObj =  newCenterViewController as? CenterUIViewController {
            centerObj.delegate = self
        }
        
        let newCenterNavigationController = UINavigationController(rootViewController: centerViewController)
        
        if centerNavigationController != nil {
            newCenterNavigationController.view.transform = self.centerNavigationController.view.transform
            newCenterNavigationController.view.frame.origin.x = self.centerNavigationController.view.frame.origin.x
            self.centerNavigationController!.view.removeFromSuperview()
            self.centerNavigationController = nil;
        }
        centerNavigationController = newCenterNavigationController
        
        view.insertSubview(newCenterNavigationController.view, atIndex: 1)
        
        addChildViewController(newCenterNavigationController)
        newCenterNavigationController.didMoveToParentViewController(self)
    }
    
    func addChildSidePanelController(sidePanelController: SidePanelViewController) {
        sidePanelController.delegate = self
        
        view.insertSubview(sidePanelController.view, atIndex: 0)
        
        addChildViewController(sidePanelController)
        sidePanelController.didMoveToParentViewController(self)
    }
    
    func addRightPanelViewController() {
        if (rightViewController == nil) {
            rightViewController = UIStoryboard.rightViewControllerWithIdentifier(self.rightViewControllerIdentifier)
            rightViewController?.currentViewController = centerViewControllerIdentifier
            addChildSidePanelController(rightViewController!)
        }
    }
  
    func animateLeftPanel(#shouldExpand: Bool) {
        //NSLog("animateLeftPanel")
        if (shouldExpand) {
            currentState = .LeftPanelExpanded
            
            animateCenterPanelXPosition(targetPosition: CGRectGetWidth(centerNavigationController.view.frame) - centerPanelExpandedOffset, scale: 0.9) { finished in
                //NSLog("finished")
            }

        } else {
            animateCenterPanelXPosition(targetPosition: 0, scale: 1.0) { finished in
                self.currentState = .BothCollapsed
                //NSLog("finished")
            }
        }
    }
    
    func animateCenterPanelXPosition(#targetPosition: CGFloat, scale: CGFloat, completion: ((Bool) -> Void)! = nil) {
       // NSLog("animateCenterPanelXPosition \(self.centerNavigationController)")
        
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .CurveEaseInOut, animations: {
            self.centerNavigationController.view.transform = CGAffineTransformMakeScale(scale, scale)
            self.centerNavigationController.view.frame.origin.x = targetPosition


            }, completion: completion)
    }
    
    func animateRightPanel(#shouldExpand: Bool) {
        if (shouldExpand) {
            currentState = .RightPanelExpanded
            
            let width = -CGRectGetWidth(centerNavigationController.view.frame) * 0.9
            animateCenterPanelXPosition(targetPosition: width + centerPanelExpandedOffset, scale:0.9)
        } else {
            animateCenterPanelXPosition(targetPosition: 0, scale:1.0) { _ in
                self.currentState = .BothCollapsed
            }
        }
    }
    
    func showShadowForCenterViewController(shouldShowShadow: Bool) {
        if (shouldShowShadow) {
            centerNavigationController.view.layer.shadowOpacity = 0.8
        } else {
            centerNavigationController.view.layer.shadowOpacity = 0.0
        }
    }
  
    // MARK: Gesture recognizer
  
    func handlePanGesture(recognizer: UIPanGestureRecognizer) {
        let gestureIsDraggingFromLeftToRight = (recognizer.velocityInView(view).x > 0)
        
        switch(recognizer.state) {
        case .Began:
            if (currentState == .BothCollapsed) {
                if (gestureIsDraggingFromLeftToRight) {
                    addLeftPanelViewController()
                } else {
                    addRightPanelViewController()
                }
                
                showShadowForCenterViewController(true)
            }
        case .Changed:
            recognizer.view!.center.x = recognizer.view!.center.x + recognizer.translationInView(view).x
            recognizer.setTranslation(CGPointZero, inView: view)
        case .Ended:
            if (leftViewController != nil) {
                // animate the side panel open or closed based on whether the view has moved more or less than halfway
                let hasMovedGreaterThanHalfway = recognizer.view!.center.x > view.bounds.size.width
                animateLeftPanel(shouldExpand: hasMovedGreaterThanHalfway)
            } else if (rightViewController != nil) {
                let hasMovedGreaterThanHalfway = recognizer.view!.center.x < 0
                animateRightPanel(shouldExpand: hasMovedGreaterThanHalfway)
            }
        default:
            break
        }
    }
}

private extension UIStoryboard {
    class func mainStoryboard() -> UIStoryboard { return UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()) }
    class func authenticationStoryboard() -> UIStoryboard { return UIStoryboard(name: "Authentication", bundle: NSBundle.mainBundle()) }
    
    class func leftViewControllerWithIdentifier(identifier: String) -> SidePanelViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier(identifier) as? SidePanelViewController
    }
    
    class func rightViewControllerWithIdentifier(identifier: String) -> SidePanelViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier(identifier) as? SidePanelViewController
    }
    
    class func centerViewControllerWithIdentifier(identifier: String) -> UIViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier(identifier) as? UIViewController
    }
    
    class func centerAuthenticationViewControllerWithIdentifier(identifier: String) -> UIViewController? {
        return authenticationStoryboard().instantiateViewControllerWithIdentifier(identifier) as? UIViewController
    }
}