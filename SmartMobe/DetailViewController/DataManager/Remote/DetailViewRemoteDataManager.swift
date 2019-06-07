//
//  DetailViewRemoteDataManager.swift
//  SmartMobe
//
//  Created by Aashish Adhikari on 4/11/19.
//  Copyright © 2019 Smart Mobe. All rights reserved.
//

import Foundation
import Alamofire

class DetailViewRemoteDataManager: DetailViewRemoteDataManagerInputProtocol{
    
    weak var requestHandler: DetailViewRemoteDataManagerOutputProtocol?
    
    func retriveDetail(imageId id: Int) {
        Alamofire
            .request(EndPoints.detainAPI(id).url, method: .get, parameters: [ : ])
            .validate()
            .responseDetailResponseModel { response in
                switch response.result{
                case .success(let detailResponseModel):
                    self.requestHandler?.onDetailReterived(image: detailResponseModel)
                case .failure(let error):
                    self.requestHandler?.onError(message: error.localizedDescription)
                }
        }
    }
}
