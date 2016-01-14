//
//  RecipeTableViewCell.swift
//  RecipeCatsiOS
//
//  Created by FumikoIshizawa on 2016/01/13.
//  Copyright © 2016年 fumikoi. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    @IBOutlet private weak var recipeTitleLabel: UILabel!
    @IBOutlet private weak var recipeContentLabel: UILabel!
    @IBOutlet private weak var recipeImageView: UIImageView!
    var cellButtonTapped: (Void -> Void)?
    
    @IBAction func cellButtonTouchUpInside(sender: UIButton) {
        if let cellButtonTapped = cellButtonTapped {
            cellButtonTapped()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureContents(title: String, content: String, image: UIImage, cellButtonTappedBlock: (Void -> Void)) {
        recipeTitleLabel.text = title
        recipeContentLabel.text = content
        recipeImageView.image = image
        cellButtonTapped = cellButtonTappedBlock
    }
}
