//
//  ProtocolHome.swift
//  MarvelApp
//
//  Created by serhat yaroglu on 15.02.2022.
//

import Foundation
protocol ViewToPresenterHomeProtocol {
    var HomeInteractor:PresenterToInteractorHomeProtocol? {get set}
    var HomeView:PresenterToViewHomeProtocol? {get set}
    
    func MarvelCharactersInstall()
}


protocol PresenterToInteractorHomeProtocol {
    var HomePresenter:InteractorToPresenterHomeProtocol? {get set}
    
    func MarvelCharactersGet()
}
protocol InteractorToPresenterHomeProtocol {
    func presenteraVeriGonder(MarvelList:Array<Result>)
}

protocol PresenterToViewHomeProtocol {
    func vieweVeriGonder(MarvelList:Array<Result>)
}

protocol PresenterToRouterHomeProtocol {
    static func createModule(ref:ViewController)
}
