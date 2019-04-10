//
//  ListingViewProtocols.swift
//  SmartMobe
//
//  Created by Aashish Adhikari on 4/10/19.
//  Copyright © 2019 Smart Mobe. All rights reserved.
//

import Foundation
import UIKit

protocol ListingViewProtocol: class{
    var presenter: ListingViewPresenterProtocol? {get set}
    
    func showLoading()
    func hideLoading()
    func showError()
}

protocol ListingViewPresenterProtocol: class{
    var view: ListingViewProtocol? {get set}
    var interactor: ListingViewInteractorInputProtocol? {get set}
    var wireFrame: ListingViewWireFrameProtocol? {get set}
    
    func viewDidLoad()
    
    #warning("change the string to correct model")
    func showListDetail(list: String)
}

protocol ListingViewInteractorInputProtocol: class{
    var presenter: ListingViewInteractorOutputProtocol? {get set}
    var localDataManager: ListingViewLocalDataManagerProtocol? {get set}
    var remoteDataManager: ListingViewRemoteDataManagerInputProtocol? {get set}
    
    func retriveList()
}

protocol ListingViewInteractorOutputProtocol: class{
    
    #warning("change the string to correct model")
    func didRetriveList(list: String)
    func onError(message: String)
}

protocol ListingViewRemoteDataManagerInputProtocol: class{
    var requestHandler: ListingViewRemoteDataManagerOutputProtocol? {get set}
    
    func retriveList()
}

protocol ListingViewRemoteDataManagerOutputProtocol: class{
    func onListRetrieved(list: String)
    func onError(message: String)
}

protocol ListingViewLocalDataManagerProtocol: class{
    #warning("change the string to correct model")
    func retriveList() throws -> String
    func saveListItem() throws
}

protocol ListingViewWireFrameProtocol: class{
    static func createListingViewModule() -> UIViewController
    
    #warning("change the string to correct model")
    func presentDetailScreen(from view: ListingViewProtocol, forItem item: String)
}
