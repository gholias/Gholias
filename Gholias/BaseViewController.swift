//
//  BaseViewController.swift
//  Gholias
//
//  Created by Felipe Oliveira on 2/21/15.
//  Copyright (c) 2015 Felipe Oliveira. All rights reserved.
//


import Gholias


//MARK: - BaseViewController
public class BaseViewController: UIViewController {
    
    public override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        super.touchesBegan(touches, withEvent: event)
        self.view.endEditing(true)
    }
}

//MARK: - UITableViewController
public class BaseTableViewController: UITableViewController {
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
      //  var tapGesture = UITapGestureRecognizer(target: self, action: "endEditing")
      //  self.tableView.addGestureRecognizer(tapGesture)
        
    }
    
    public override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        super.touchesBegan(touches, withEvent: event)
        self.endEditing()
    }
    
    override public func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
}


//MARK: - UIViewController Extension
public extension UIViewController {
    
    //MARK: Data
    public func fetchData() {
        self.showNetWorkActivity()
    }
    
    public func dataWasFetched() {
        self.hideNetWorkActivity()
    }
    
    //MARK: Loading Indicator
    public func showLoading() {
        self.showLoading("Aguarde...", subtitle: "")
    }
    
    public func showLoading(title:String, subtitle: String) {
        var text = title
        if subtitle != "" {
            text = title + "\n" + subtitle
        }
        self.showWaitOverlayWithText(text)
    }

    public func hideLoading() {
        SwiftOverlays.removeAllOverlaysFromView(self.view)
    }
    
    public func showNetWorkActivity() {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    public func hideNetWorkActivity() {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
    //MARK: Alerts
    public func showAlert(style:SCLAlertViewStyle, title: String, subtitle: String) {
        let alert = SCLAlertView()

        switch style {
        case SCLAlertViewStyle.Success:
            alert.showSuccess(title, subTitle: subtitle, closeButtonTitle: "OK")
            
        case .Error:
            alert.showError(title, subTitle: subtitle, closeButtonTitle: "OK")
            
        case .Notice:
            alert.showNotice(title, subTitle: subtitle, closeButtonTitle: "OK")
            
        case .Warning:
            alert.showWarning(title, subTitle: subtitle, closeButtonTitle: "OK")
            
        case .Info:
            alert.showInfo(title, subTitle: subtitle, closeButtonTitle: "OK")
            
        case .Edit:
            alert.showEdit(title, subTitle: subtitle, closeButtonTitle: "OK")
        }
    }
    
    public func showError( title: String, subtitle: String) {
        self.showAlert(.Error, title: title, subtitle: subtitle)
    }
    
    public func endEditing() {
        self.view.endEditing(true)
    }
    
    public func heightForText(text:String, font:UIFont ) -> CGFloat {
        var attributes: NSDictionary = NSDictionary(objectsAndKeys: font, NSFontAttributeName)
        var titleRect = text.boundingRectWithSize(CGSizeMake(self.view.frame.size.width - 30, 1128), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: attributes as [NSObject : AnyObject], context: nil)
        return titleRect.height
    }
}
