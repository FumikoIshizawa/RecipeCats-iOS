//
//  RegisterViewDataSource.swift
//  RecipeCatsiOS
//
//  Created by FumikoIshizawa on 2016/01/13.
//  Copyright © 2016年 fumikoi. All rights reserved.
//

import APIKit
import UIKit

class RegisterViewDataSource: NSObject {
    private weak var tableView: UITableView?
    private let cellIdentifier = "RecipeTableViewCell"
    private var recipe: Recipe?
    
    func prepareforUseTableView(tableView: UITableView) {
        self.tableView = tableView
        
        let nib = UINib(nibName: cellIdentifier, bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: cellIdentifier)
        
        let request = GetRecipeListRequest()
        Session.sendRequest(request) { result in
            switch result {
            case .Success(let recipe):
                print(recipe)
                self.recipe = recipe
                self.updateAll()
            case .Failure(let error):
                print("error: \(error)")
            }
        }
    }
    
    private func updateAll() {
        tableView?.reloadData()
    }
    
    private func configureCell(cell: RecipeTableViewCell) {
        guard let recipe = self.recipe else {
            return
        }
        
        let cellButtonTappedBlock = { [weak self] in
            print("tapped\(recipe.url)")
        }
        
        let image = UIImage(named: "first")
        cell.configureContents(recipe.title,
                               content: "にくじゃがにくじゃがにくじゃがにくじゃが",
                               image: image!,
                               cellButtonTappedBlock: cellButtonTappedBlock)
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
        if let cell = cell as? RecipeTableViewCell {
            configureCell(cell)
        }
        return cell
    }
}
