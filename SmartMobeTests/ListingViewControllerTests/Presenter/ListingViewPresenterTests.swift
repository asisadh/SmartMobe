//
//  ListingViewPresenterTests.swift
//  SmartMobeTests
//
//  Created by Aashish Adhikari on 4/11/19.
//  Copyright © 2019 Smart Mobe. All rights reserved.
//

import XCTest
@testable import SmartMobe

class ListingViewPresenterTests: XCTestCase {
    
    
    func test_numberOfItemsIsZero(){
        let listingViewPresenter = ListingViewPresenter()
        
        XCTAssertEqual(listingViewPresenter.numberOfItems, 0, "Item should be 0")
        XCTAssertEqual(listingViewPresenter.list.count, 0, "list count should be 0")
    }
    
    func test_numberOfItemsShouldBeEqualToItemList(){
        let listingViewPresenter = ListingViewPresenter()
        XCTAssertEqual(listingViewPresenter.numberOfItems, listingViewPresenter.list.count, "Both should be equal")
        
        let data: [Image] = [Image(id: 1, url: "", largeURL: "", sourceID: 1), Image(id: 2, url: "", largeURL: "", sourceID: 2)]
        
        listingViewPresenter.didRetriveList(list: data)
        
        XCTAssertEqual(listingViewPresenter.numberOfItems, 2, "Item should be equal to data count")
        XCTAssertEqual(listingViewPresenter.list.count, 4, "Item should be equal to data count")
    }
}


