//
//  StoriesTableViewCell.swift
//  MarvelApp
//
//  Created by serhat yaroglu on 15.02.2022.
//

import UIKit

class StoriesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var storiesView: UIView!
    @IBOutlet weak var StoriesNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        storiesView.layer.borderWidth = 1
        storiesView.layer.borderColor = UIColor.white.cgColor

    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
