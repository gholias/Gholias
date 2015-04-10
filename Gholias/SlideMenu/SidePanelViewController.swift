//
//  LeftViewController.swift
//  SlideOutNavigation
//
//  Created by James Frost on 03/08/2014.
//  Copyright (c) 2014 James Frost. All rights reserved.
//

import UIKit



public class SidePanelViewController: UITableViewController{

    
    var delegate: ContainerViewControllerDelegate?
    var currentViewController: String?
    
    
    struct TableView {
        struct CellIdentifiers {
            static let Cell = "Cell"
        }
    }
  
    override public func viewDidLoad() {
        super.viewDidLoad()
        //tableView.reloadData()
    }
    
    // MARK: Table View Data Source
    override public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TableView.CellIdentifiers.Cell, forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel!.text = "Menu \(indexPath.row)"
        
        return cell
    }
    
    // Mark: Table View Delegate
    override public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedViewController = getTargetIdentifier(indexPath.row)
        if let d = delegate {
            if self.currentViewController != selectedViewController {
                self.currentViewController = selectedViewController
                d.openCenterViewControllerWithIdentifier?(selectedViewController)
             } else {
                d.collapseSidePanels?()
            }
        }
        
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func getTargetIdentifier(index:Int) -> String {
//        let row = MenuTableRows(rawValue: indexPath.row)!
//        let selectedViewController = row.targetIdentifier()
        
        return ""
    }
    
    
    
    
}