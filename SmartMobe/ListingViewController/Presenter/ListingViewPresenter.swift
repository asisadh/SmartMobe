//
//  ListingViewPresenter.swift
//  SmartMobe
//
//  Created by Aashish Adhikari on 4/10/19.
//  Copyright © 2019 Smart Mobe. All rights reserved.
//

import Foundation

class ListingViewPresenter: ListingViewPresenterProtocol{
    
    var view: ListingViewProtocol?
    var interactor: ListingViewInteractorInputProtocol?
    var wireFrame: ListingViewWireFrameProtocol?
    
    var numberOfItems: Int = 0
    var list: [Image] = []
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.retriveList()
    }
    
    func item(at row: Int) -> Image {
        return list[row]
    }
    
    func showListDetail(item: Image) {
        
    }
    
    func showError(message: String) {
        if let view = view{
            wireFrame?.presentErrorScreen(from: view, errorMessage: message)
        }
    }
}

extension ListingViewPresenter: ListingViewInteractorOutputProtocol{
    func didRetriveList(list: [Image]) {
        view?.hideLoading()
        self.list = list
        numberOfItems = list.count
        view?.refreshView()
    }
    
    func onError(message: String) {
        view?.hideLoading()
    }
}
