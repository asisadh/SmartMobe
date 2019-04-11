//
//  DetailViewWireFrame.swift
//  SmartMobe
//
//  Created by Aashish Adhikari on 4/11/19.
//  Copyright © 2019 Smart Mobe. All rights reserved.
//

import Foundation
import UIKit

class DetailViewWireFrame: DetailViewWireFrameProtocol{
    
    static func createDetailViewModule(image: Image) -> UIViewController {
        let viewController = DetailView.instantiate(from: .Main)
        let view = viewController as DetailViewProtocol
        let presenter: DetailViewPresenterProtocol & DetailViewInteractorOutputProtocol = DetailViewPresenter(image: image)
        let interactor: DetailViewInteractorInputProtocol & DetailViewRemoteDataManagerOutputProtocol = DetailViewInteractor()
        let remoteDataManager: DetailViewRemoteDataManagerInputProtocol = DetailViewRemoteDataManager()
        let wireFrame: DetailViewWireFrameProtocol = DetailViewWireFrame()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireFrame = wireFrame
        
        interactor.dataManager = remoteDataManager
        interactor.presenter = presenter
        
        remoteDataManager.requestHandler = interactor
        
        return viewController
    }
    
    func presentErrorScreen(from view: DetailViewProtocol, errorMessage message: String) {
        if let view = view as? UIViewController{
            showAlertWithMessageAndDismiss(currentView: view, message: message)
        }
    }
}
