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
    func showListDetail(list: [Image])
}

protocol ListingViewInteractorInputProtocol: class{
    var presenter: ListingViewInteractorOutputProtocol? {get set}
    var localDataManager: ListingViewLocalDataManagerProtocol? {get set}
    var remoteDataManager: ListingViewRemoteDataManagerInputProtocol? {get set}
    
    func retriveList()
}

protocol ListingViewInteractorOutputProtocol: class{
    
    func didRetriveList(list: [Image])
    func onError(message: String)
}

protocol ListingViewRemoteDataManagerInputProtocol: class{
    var requestHandler: ListingViewRemoteDataManagerOutputProtocol? {get set}
    
    func retriveList()
}

protocol ListingViewRemoteDataManagerOutputProtocol: class{
    func onListRetrieved(list: [Image])
    func onError(message: String)
}

protocol ListingViewLocalDataManagerProtocol: class{
    func retriveList() throws -> [Image]
    func saveListItem() throws
}

protocol ListingViewWireFrameProtocol: class{
    static func createListingViewModule() -> UIViewController
    
    func presentDetailScreen(from view: ListingViewProtocol, forImage image: Image)
}
