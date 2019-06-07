//
//  DetailViewPresenter.swift
//  SmartMobe
//
//  Created by Aashish Adhikari on 4/11/19.
//  Copyright © 2019 Smart Mobe. All rights reserved.
//

import Foundation

class DetailViewPresenter: DetailViewPresenterProtocol{
    weak var view: DetailViewProtocol?
    var wireFrame: DetailViewWireFrameProtocol?
    var interactor: DetailViewInteractorInputProtocol?

    var image: Image
    
    init(image: Image) {
        self.image = image
    }
    
    deinit {
        print("Detail Presenter is dead.")
    }
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.fetchDetail(image: image)
    }
    
    func showError(message: String) {
        if let view = view{
            wireFrame?.presentErrorScreen(from: view, errorMessage: message)
        }
    }
}

extension DetailViewPresenter: DetailViewInteractorOutputProtocol{
    
    func didFetchDetail(image: DetailResponseModel) {
        view?.hideLoading()
        view?.showDetail(data: image)
    }
    
    func onError(message: String) {
        view?.hideLoading()
        showError(message: message)
    }
}
