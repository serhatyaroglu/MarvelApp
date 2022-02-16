//
//  DetailViewController.swift
//  MarvelApp
//
//  Created by serhat yaroglu on 15.02.2022.
//

import UIKit
import Kingfisher
import Alamofire
import CoreMedia
class DetailViewController: UIViewController {
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var DescriptionLabel: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
    var charDetail : Result?
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.dataSource = self
        TableView.delegate = self
        TableView.showsVerticalScrollIndicator = false
        TableView.separatorStyle = .none
        characterImage.layer.borderWidth = 1
        characterImage.layer.borderColor = UIColor.red.cgColor
        let photoExtension = charDetail?.thumbnail?.thumbnailImageExtension ?? ""
        let photoPath = charDetail?.thumbnail?.path ?? ""
        let photoFullPath = photoPath + "." + photoExtension
        if let char = charDetail{
            characterName.text = char.name
            characterImage.kf.setImage(with: URL(string: photoFullPath ))
            
            DescriptionLabel.text = char.resultDescription
        }
    }
}
extension DetailViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charDetail?.comics?.returned ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let comicsName = charDetail
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "storiesCell", for: indexPath) as! StoriesTableViewCell
        
       tableCell.StoriesNameLabel.text = comicsName?.comics?.items?[indexPath.row].name
        
        return tableCell
    }
}
