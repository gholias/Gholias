//
//  BaseSearchTableViewController.swift
//  Gholias
//
//  Created by Felipe Oliveira on 5/9/15.
//  Copyright (c) 2015 Felipe Oliveira. All rights reserved.
//



public class BaseSearchTableViewController: BaseTableViewController, UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating {
    
    public var searchController:UISearchController!
    public var searchActive : Bool = false
    public var searchIsEmpty : Bool = false
    
    public var items:[AnyObject]?
    public var filteredItems:[AnyObject]?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchController = UISearchController(searchResultsController: nil)// [[UISearchController alloc] initWithSearchResultsController:self.resultsTableController];
        self.searchController.searchResultsUpdater = self
        self.searchController.searchBar.sizeToFit()
        self.tableView.tableHeaderView = self.searchController.searchBar
        
        self.searchController.delegate = self
        self.searchController.dimsBackgroundDuringPresentation = false
        self.searchController.searchBar.delegate = self
    }
    
    override public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.searchController.active && searchActive {
            if let total = self.filteredItems?.count {
                return (self.searchIsEmpty) ? 1 : total
            } else {
                return 1 //To show the noResults Cell
            }
        } else {
            if let total = self.items?.count {
                return total
            } else {
                return 0
            }
        }
    }
    
    public func getItemForIndex(indexPath:NSIndexPath) -> AnyObject? {
        if self.searchController.active && searchActive {
            if let items = self.filteredItems  {
                return items[indexPath.row]
            }
        } else {
            if let items = self.items {
                return items[indexPath.row]
            }
        }
        
        return nil
    }
    
    public func filterContentForSearchText(searchText: String) {
    }
    
    public func updateSearchResultsForSearchController(searchController: UISearchController) {
    }

}
