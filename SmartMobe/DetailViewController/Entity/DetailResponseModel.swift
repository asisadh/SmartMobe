//
//  DetailResponseModel.swift
//  SmartMobe
//
//  Created by Aashish Adhikari on 4/11/19.
//  Copyright © 2019 Smart Mobe. All rights reserved.
//

import Foundation

struct DetailResponseModel: Codable {
    let id: Int?
    let url, largeURL: String?
    let sourceID: Int?
    let copyright, site: String?
    
    enum CodingKeys: String, CodingKey {
        case id, url
        case largeURL = "large_url"
        case sourceID = "source_id"
        case copyright, site
    }
}
