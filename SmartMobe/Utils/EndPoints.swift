//
//  EndPoints.swift
//  Login-VIPER
//
//  Created by Aashish Adhikari on 3/3/19.
//  Copyright © 2019 Aashish Adhikari. All rights reserved.
//

import Foundation

struct API{
    static let base_url = "http://www.splashbase.co"
}

protocol EndPoint{
    var path: String { get }
    var url: String { get }
}

enum EndPoints{
    
    case listingAPI
}

extension EndPoints: EndPoint{
    var path: String {
        switch self{
            case .listingAPI:                      return "/api/v1/images/latest"
        }
    }
    
    var url: String {
        return "\(API.base_url)\(path)"
    }
}
