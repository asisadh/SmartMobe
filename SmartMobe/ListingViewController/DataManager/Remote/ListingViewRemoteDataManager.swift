//
//  ListingViewRemoteDataManager.swift
//  SmartMobe
//
//  Created by Aashish Adhikari on 4/10/19.
//  Copyright © 2019 Smart Mobe. All rights reserved.
//

import Foundation
import Alamofire

class ListingViewRemoteDataManager: ListingViewRemoteDataManagerInputProtocol{
    
    var requestHandler: ListingViewRemoteDataManagerOutputProtocol?
    
    func retriveList(request: ListRequestModel) {
        
        var url = EndPoints.listingAPI.url
        
        if let _ = request.query{
            url = EndPoints.searchAPI.url
        }
        
        Alamofire
            .request(url, method: .get, parameters: request.paramaters)
            .validate()
            .responseListResponseModel { response in
                switch response.result{
                    case .success(let listResponseModel):
                        if let images = listResponseModel.images{
                            self.requestHandler?.onListRetrieved(list: images)
                        }
                    case .failure(let error):
                        self.requestHandler?.onError(message: error.localizedDescription)
                }
        }
    }
}
