//
//  PresenterHome.swift
//  MarvelApp
//
//  Created by serhat yaroglu on 15.02.2022.
//

import Foundation

class HomePresenter : ViewToPresenterHomeProtocol {
    var HomeInteractor: PresenterToInteractorHomeProtocol?
    var HomeView: PresenterToViewHomeProtocol?
    func MarvelCharactersInstall() {
        HomeInteractor?.MarvelCharactersGet()
    }
}
extension HomePresenter : InteractorToPresenterHomeProtocol {
    func presenteraVeriGonder(MarvelList: Array<Result>) {
        HomeView?.vieweVeriGonder(MarvelList: MarvelList)
    }
}
