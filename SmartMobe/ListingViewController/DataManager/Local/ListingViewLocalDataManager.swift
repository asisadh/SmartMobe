//
//  ListingViewLocalDataManager.swift
//  SmartMobe
//
//  Created by Aashish Adhikari on 4/10/19.
//  Copyright © 2019 Smart Mobe. All rights reserved.
//

import Foundation
import CoreData

class ListingViewLocalDataManager: ListingViewLocalDataManagerProtocol{
    
    func retriveList() throws -> [Item] {
        guard let managedObjectContext = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        let request: NSFetchRequest<Item> = NSFetchRequest(entityName: String(describing: Item.self))
        
        do{
            return try managedObjectContext.fetch(request)
        }catch{
            throw PersistenceError.objectNotFound
        }
    }
    
    func saveListItem(id: Int?, url: String?, largeUrl: String?, sourceId: String?) throws {
        guard let managedObjectContext = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        if let newData = NSEntityDescription.entity(forEntityName: "Item", in: managedObjectContext){
            let item = Item(entity: newData, insertInto: managedObjectContext)
            
            item.id = Int32(id ?? 0)
            item.url = url
            item.largeUrl = largeUrl
            item.sourceId = sourceId
        }
    }
}
