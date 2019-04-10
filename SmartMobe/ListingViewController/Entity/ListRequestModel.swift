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
}

extension ListRequestModel{
    var paramaters: [String: Any]{
        return [
            "images_only": imageOnly,
            "videos_only": videoOnly
        ]
    }
}
