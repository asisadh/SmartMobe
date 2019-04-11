//
//  DetailViewProtocols.swift
//  SmartMobe
//
//  Created by Aashish Adhikari on 4/11/19.
//  Copyright © 2019 Smart Mobe. All rights reserved.
//

import Foundation
import UIKit

protocol DetailViewProtocol: class{
    var presenter: DetailViewPresenterProtocol? { get set}
    
    func showLoading()
    func hideLoading()
    func showDetail(data: DetailResponseModel)
}

protocol DetailViewPresenterProtocol: class{
    var view: DetailViewProtocol? {get set}
    var wireFrame: DetailViewWireFrameProtocol? {get set}
    var interactor: DetailViewInteractorInputProtocol? {get set}
    
    var image: Image {get}
    
    func viewDidLoad()
    func showError(message: String)
}

protocol DetailViewInteractorInputProtocol: class{
    var presenter: DetailViewInteractorOutputProtocol? { get set }
    var dataManager: DetailViewRemoteDataManagerInputProtocol? { get set }
    
    func fetchDetail(image: Image)
}

protocol DetailViewInteractorOutputProtocol: class{
    func didFetchDetail(image: DetailResponseModel)
    func onError(message: String)
}

protocol DetailViewRemoteDataManagerInputProtocol: class{
    var requestHandler: DetailViewRemoteDataManagerOutputProtocol? {get set}
    func retriveDetail(imageId id: Int)
}

protocol DetailViewRemoteDataManagerOutputProtocol: class{
    func onDetailReterived(image: DetailResponseModel)
    func onError(message: String)
}

protocol DetailViewWireFrameProtocol: class{
    static func createDetailViewModule() -> UIViewController
    
    func presentErrorScreen(from view: DetailViewProtocol, errorMessage message: String)
}
