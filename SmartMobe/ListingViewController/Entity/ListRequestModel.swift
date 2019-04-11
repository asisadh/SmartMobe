//
//  ListRequestModel.swift
//  SmartMobe
//
//  Created by Aashish Adhikari on 4/10/19.
//  Copyright © 2019 Smart Mobe. All rights reserved.
//

import Foundation

struct ListRequestModel{
    var imageOnly: Bool
    var videoOnly: Bool
    var query: String?
}

extension ListRequestModel{
    var paramaters: [String: Any]{
        
        if let query = query{
            return[
                "query": query
            ]
        }
        
        return [
            "images_only": imageOnly,
            "videos_only": videoOnly
        ]
    }
}
