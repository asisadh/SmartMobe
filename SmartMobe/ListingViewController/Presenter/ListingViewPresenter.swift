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
    
    func viewDidLoad() {
        
    }
    
    func showListDetail(list: [Image]) {
        
    }
}

extension ListingViewPresenter: ListingViewInteractorOutputProtocol{
    func didRetriveList(list: [Image]) {
        view?.hideLoading()
    }
    
    func onError(message: String) {
        view?.hideLoading()
    }
}
