//
//  DetailView.swift
//  SmartMobe
//
//  Created by Aashish Adhikari on 4/11/19.
//  Copyright © 2019 Smart Mobe. All rights reserved.
//

import UIKit

class DetailView: UIViewController{
    
    var presenter: DetailViewPresenterProtocol?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
}

extension DetailView: DetailViewProtocol{
    
    func showLoading() {
        print("Show Loading")
    }
    
    func hideLoading() {
        print("Show Loading")
    }
    
    func showDetail(data: DetailResponseModel) {
        print("Show Detail")
        if let imageURL = data.largeURL,
            let site = data.site,
            let copyRight = data.copyright {
                imageView.sd_setImage(with: URL(string: imageURL),placeholderImage: UIImage(named: ""))
                titleLabel.text = site + " © " + copyRight
        }else{
            presenter?.showError(message: "Something went wrong")
        }
    }
}
