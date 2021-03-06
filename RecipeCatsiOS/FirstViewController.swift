//
//  FirstViewController.swift
//  RecipeCatsiOS
//
//  Created by FumikoIshizawa on 2016/01/13.
//  Copyright © 2016年 fumikoi. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet private var registerTableView: UITableView!
    private let registerViewDataSource = RegisterViewDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableView.dataSource = registerViewDataSource
        registerTableView.delegate = registerViewDataSource
        registerViewDataSource.prepareforUseTableView(registerTableView)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

