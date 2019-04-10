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
}

protocol ListingViewInteractorInputProtocol: class{
    
}

protocol ListingViewInteractorOutputProtocol: class{
    
}

protocol ListingViewRemoteDataManagerInputProtocol: class{
    
}

protocol ListingViewRemoteDataManagerOutputProtocol: class{
    
}

protocol ListingViewLocalDataManagerProtocol: class{
    
}

protocol ListingViewWireFrameProtocol: class{
    static func createListingViewModule() -> UIViewController
    
    #warning("change the string to correct model")
    func presentDetailScreen(from view: ListingViewProtocol, forItem item: String)
}
