//
//  ListResponseModel.swift
//  SmartMobe
//
//  Created by Aashish Adhikari on 4/10/19.
//  Copyright © 2019 Smart Mobe. All rights reserved.
//

import Foundation

struct ListResponseModel: Codable {
    let images: [Image]?
}

struct Image: Codable {
    let id: Int?
    let url: String?
    let largeURL: String?
    let sourceID: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, url
        case largeURL = "large_url"
        case sourceID = "source_id"
    }
}
