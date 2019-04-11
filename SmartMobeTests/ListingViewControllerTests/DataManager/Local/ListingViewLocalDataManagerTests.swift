//
//  SmartMobeTests.swift
//  SmartMobeTests
//
//  Created by Aashish Adhikari on 4/10/19.
//  Copyright © 2019 Smart Mobe. All rights reserved.
//

import XCTest
import CoreData
@testable import SmartMobe

class ListingViewLocalDataManagerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try! deleteAllRecords()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try! deleteAllRecords()
    }

    func test_retriveList_ReturnsNil_ifThereIsNoItemsInList(){
        
        let localDataManager = ListingViewLocalDataManager()
        XCTAssertEqual(try! localDataManager.retriveList(), [], "Should return empty when there is no data in database.")
    }
    
    func test_saveListItem_andReturnList_ifSuccessfullySaved(){
        let localDataManager = ListingViewLocalDataManager()
        try! localDataManager.saveListItem(id: 1, url: "URL", largeUrl: "LargeURL", sourceId: 1)
        let data = try! localDataManager.retriveList()
        let dataOne = data.first
        XCTAssertEqual( dataOne?.id, 1)
        XCTAssertEqual( dataOne?.url, "URL")
        XCTAssertEqual( dataOne?.largeUrl, "LargeURL")
        XCTAssertEqual( dataOne?.sourceId, 1)
    }
    
    func test_saveListItems_andReturnLists_ifSuccessfullySaved(){
        let localDataManager = ListingViewLocalDataManager()
        
        let dummyData: [[String]] = [ [ "1","URL", "LargeURL", "1"], [ "2","URL2", "LargeURL2", "2"], ["3","URL3", "LargeURL3", "3"]]
        
        for data in dummyData{
            try! localDataManager.saveListItem(id: Int(data[0]) as? Int, url: data[1] as? String, largeUrl: data[2] as? String, sourceId: Int(data[3]) as? Int)
        }
        
        let listOfData = try! localDataManager.retriveList()
        
        for index in 0..<listOfData.count{
            XCTAssertEqual( listOfData[index].id, Int32(dummyData[index][0]))
            XCTAssertEqual( listOfData[index].url, dummyData[index][1])
            XCTAssertEqual( listOfData[index].largeUrl, dummyData[index][2])
            XCTAssertEqual( listOfData[index].sourceId, Int32(dummyData[index][3]))
        }
    }
    
    private func deleteAllRecords() throws {
        guard let managedObjectContext = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        let request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: String(describing: Item.self))
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        
        do{
            try managedObjectContext.execute(deleteRequest)
        }catch{
            throw PersistenceError.objectNotFound
        }
    }

}
