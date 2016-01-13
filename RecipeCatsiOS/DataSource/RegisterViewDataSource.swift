//
//  RegisterViewDataSource.swift
//  RecipeCatsiOS
//
//  Created by FumikoIshizawa on 2016/01/13.
//  Copyright © 2016年 fumikoi. All rights reserved.
//

import UIKit

class RegisterViewDataSource: NSObject {
    private weak var tableView: UITableView?
    private let cellIdentifier = "RecipeTableViewCell"
    
    func prepareforUseTableView(tableView: UITableView) {
        self.tableView = tableView
        
        let nib = UINib(nibName: cellIdentifier, bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: cellIdentifier)
    }
}


extension RegisterViewDataSource: UITableViewDelegate {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}


extension RegisterViewDataSource: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        return cell
    }
}
