//
//  ViewController.swift
//  MarvelApp
//
//  Created by serhat yaroglu on 15.02.2022.
//

import UIKit
import Kingfisher
class ViewController: UIViewController {
    var HomePresenterNesnesi:ViewToPresenterHomeProtocol?
    var MarvelList : [Result]?
    var MarvelCountList : [Result]?
    @IBOutlet weak var CharacterCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        HomeRouter.createModule(ref: self)
        HomePresenterNesnesi?.MarvelCharactersInstall()
    }
    override func viewWillAppear(_ animated: Bool) {
        HomePresenterNesnesi?.HomeInteractor?.MarvelCharactersGet()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToDetail"{
            let char = sender as? Result
            let toVC = segue.destination as! DetailViewController
            toVC.charDetail = char
        }
    }
    func configureCollectionView(){
        CharacterCollectionView.delegate = self
        CharacterCollectionView.dataSource = self
        let width = CharacterCollectionView.frame.size.width
        let desingView = UICollectionViewFlowLayout()
        desingView.minimumInteritemSpacing = 5
        desingView.minimumLineSpacing = 20
        desingView.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let itemWidth = (width-25)/2
        desingView.itemSize = CGSize(width: itemWidth, height: itemWidth*1.3)
        CharacterCollectionView.collectionViewLayout = desingView
    }
}
extension ViewController : PresenterToViewHomeProtocol {
    func vieweVeriGonder(MarvelList: Array<Result>) {
        self.MarvelList = MarvelList
        self.MarvelCountList = MarvelList
        DispatchQueue.main.async {
            self.CharacterCollectionView.reloadData()
        }
    }
}
extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MarvelList?.count ?? 0
    }
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let character = MarvelList?[indexPath.row]
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCell", for: indexPath) as! CharactersCollectionViewCell
            let seriesCountInt = character?.series?.returned ?? 0
            let seriesCountValue = "\(seriesCountInt)"
            cell.NameLabel.text = character?.name
            cell.SeriesCountLabel.text = seriesCountValue
            let photoPath = character?.thumbnail?.path ?? ""
            let photoExtension = ".jpg"
            let photoFullPath = photoPath + photoExtension
            cell.characterImage.kf.setImage(with:  URL(string: photoFullPath))
            cell.layer.borderColor = UIColor.red.cgColor
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 22
            cell.layer.shadowColor = UIColor.systemGray2.cgColor
            cell.layer.shadowOffset = CGSize(width: 0, height: 1.2)
            cell.layer.shadowRadius = 2.0
            cell.layer.shadowOpacity = 0.3
            cell.layer.masksToBounds = false
            return cell
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let Character = MarvelList?[indexPath.row]
        performSegue(withIdentifier: "ToDetail", sender: Character)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    }
    
    


