//
//  ListingViewInteractor.swift
//  SmartMobe
//
//  Created by Aashish Adhikari on 4/10/19.
//  Copyright © 2019 Smart Mobe. All rights reserved.
//

import Foundation

class ListingViewInteractor: ListingViewInteractorInputProtocol {
    var presenter: ListingViewInteractorOutputProtocol?
    
    var localDataManager: ListingViewLocalDataManagerProtocol?
    
    var remoteDataManager: ListingViewRemoteDataManagerInputProtocol?
    
    func retriveList() {
        do{
            if let list = try localDataManager?.retriveList(){
                let imageList = list.map(){
                    return Image(id: Int($0.id), url: $0.url, largeURL: $0.largeUrl, sourceID: $0.sourceId)
                }
                if imageList.isEmpty{
                    remoteDataManager?.retriveList(request: ListRequestModel(imageOnly: false, videoOnly: false))
                }else{
                    presenter?.didRetriveList(list: imageList)
                }
            }else{
                remoteDataManager?.retriveList(request: ListRequestModel(imageOnly: false, videoOnly: false))
            }
        }catch{
            presenter?.onError(message: PersistenceError.objectNotFound.localizedDescription)
        }
    }
}

extension ListingViewInteractor: ListingViewRemoteDataManagerOutputProtocol{
    func onListRetrieved(list: [Image]) {
        for image in list{
            do {
                try localDataManager?.saveListItem(id: image.id, url: image.url, largeUrl: image.largeURL, sourceId: image.sourceID)
                
            } catch{
                presenter?.onError(message: PersistenceError.couldNotSaveObject.localizedDescription)
            }
        }
        
        presenter?.didRetriveList(list: list)
    }
    
    func onError(message: String) {
        presenter?.onError(message: message)
    }
}
