//
//  ListingViewWireFrame.swift
//  SmartMobe
//
//  Created by Aashish Adhikari on 4/10/19.
//  Copyright © 2019 Smart Mobe. All rights reserved.
//

import Foundation
import UIKit

class ListingViewWireFrame: ListingViewWireFrameProtocol{
    
    static func createListingViewModule() -> UIViewController {
        let listingViewController: ListingView = ListingView.instantiate(from: .Main, bundle: nil)
        
        let view:ListingViewProtocol = listingViewController as ListingViewProtocol
        let presenter: ListingViewPresenterProtocol & ListingViewInteractorOutputProtocol = ListingViewPresenter()
        let interactor: ListingViewInteractorInputProtocol & ListingViewRemoteDataManagerOutputProtocol = ListingViewInteractor()
        let localDataManager: ListingViewLocalDataManagerProtocol = ListingViewLocalDataManager()
        let remoteDataManager: ListingViewRemoteDataManagerInputProtocol = ListingViewRemoteDataManager()
        let wireFrame: ListingViewWireFrameProtocol = ListingViewWireFrame()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        interactor.localDataManager = localDataManager
        interactor.remoteDataManager = remoteDataManager
        
        remoteDataManager.requestHandler = interactor
        
        return listingViewController
    }
    
    func presentDetailScreen(from view: ListingViewProtocol, forImage image: Image) {
        
    }
    
    func presentErrorScreen(from view: ListingViewProtocol, errorMessage message: String) {
        if let view = view as? UIViewController{
            showAlertWithMessage(view: view, message: message)
        }
    }
}
