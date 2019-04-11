//
//  ListingViewRemoteDataManager.swift
//  SmartMobeTests
//
//  Created by Aashish Adhikari on 4/10/19.
//  Copyright © 2019 Smart Mobe. All rights reserved.
//

import XCTest
import Alamofire
@testable import SmartMobe

class ListingViewRemoteDataManagerTests: XCTestCase {

    func test_gettingJSON(){
        
        let remoteDataManager = MockListingViewRemoteDataManagerTests()
        remoteDataManager.test_retriveList()
    }
}

private class MockListingViewRemoteDataManagerTests: XCTestCase, MockListingViewRemoteDataManagerInputProtocol{
    
    func test_retriveList() {
        
        let expectation = XCTestExpectation.init(description: "...")
        
        Alamofire
            .request(EndPoints.listingAPI.url, method: .get, parameters: ListRequestModel(imageOnly: false, videoOnly: false).paramaters)
            .validate()
            .responseListResponseModel { response in
                XCTAssertNotNil(response.data, "Response data should not be nil.")
                XCTAssertNil(response.error, "Response error should always be nil.")
                expectation.fulfill()
        }
         wait(for: [expectation], timeout: 10.0)
    }
}

protocol MockListingViewRemoteDataManagerInputProtocol: class{
    func test_retriveList()
}
