//
//  DetailViewInteractor.swift
//  SmartMobe
//
//  Created by Aashish Adhikari on 4/11/19.
//  Copyright © 2019 Smart Mobe. All rights reserved.
//

import Foundation

class DetailViewInteractor: DetailViewInteractorInputProtocol{
    
    weak var presenter: DetailViewInteractorOutputProtocol?
    var dataManager: DetailViewRemoteDataManagerInputProtocol?
    
    func fetchDetail(image: Image) {
        if let id = image.id{
            dataManager?.retriveDetail(imageId: id)
        }else{
            presenter?.onError(message: "Could not fetch detail of this image.")
        }
    }
}

extension DetailViewInteractor: DetailViewRemoteDataManagerOutputProtocol{
    func onDetailReterived(image: DetailResponseModel) {
        presenter?.didFetchDetail(image: image)
    }
    
    func onError(message: String) {
        presenter?.onError(message: message)
    }
}
