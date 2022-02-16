//
//  InteractorHome.swift
//  MarvelApp
//
//  Created by serhat yaroglu on 15.01.2022.
//

import Foundation
import Alamofire
class HomeInteractor : PresenterToInteractorHomeProtocol {
    var HomePresenter: InteractorToPresenterHomeProtocol?

    func MarvelCharactersGet() {
        AF.request("http://gateway.marvel.com/v1/public/characters?ts=1&apikey=a9fa55d163701689601631dcfb4809c8&hash=c05384f5508def9f63340f7c7ed913f7",method: .get).responseJSON{ response in
            if let data = response.data{
                do{
                    let response = try JSONDecoder().decode(Marvel.self, from: data)
                    var liste = [Result]()
                    if let responseMarvel = response.data?.results{
                        liste = responseMarvel
                       
                    }
                        self.HomePresenter?.presenteraVeriGonder(MarvelList: liste)
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}
