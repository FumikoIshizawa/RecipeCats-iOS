//
//  SecondViewController.swift
//  RecipeCatsiOS
//
//  Created by FumikoIshizawa on 2016/01/13.
//  Copyright © 2016年 fumikoi. All rights reserved.
//

import APIKit
import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var recipeTitleTextField: UITextField!
    @IBOutlet weak var recipeUrlTextField: UITextField!
    @IBOutlet weak var addedRecipeLabel: UILabel!

    @IBAction func addButtonTouchUpInside(sender: AnyObject) {
// TODO: validation
        guard let title: String = self.recipeTitleTextField.text else {
            return
        }
        guard let url: String = self.recipeUrlTextField.text else {
            return
        }
        
        var request = PostRecipeRequest()
        request.title = title
        request.url = url
        request.category = 0
        print("TEST::")
        print(request.parameters["title"])
        print(request.parameters)
        
        Session.sendRequest(request) { [weak self] result in
            switch result {
            case .Success(let recipe):
                print(recipe)
                self!.addedRecipeLabel.hidden = false
            case .Failure(let error):
                print("error: \(error)")
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

