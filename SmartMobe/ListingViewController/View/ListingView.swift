//
//  ListingView.swift
//  SmartMobe
//
//  Created by Aashish Adhikari on 4/10/19.
//  Copyright © 2019 Smart Mobe. All rights reserved.
//

import UIKit

class ListingView: UIViewController{
    
    var presenter: ListingViewPresenterProtocol?
    
    @IBOutlet weak var tableView: UITableView!
    
    private let identifier = "ListingViewTableCellView"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension ListingView: ListingViewProtocol{
    
    func refreshView() {
        print("refresh")
        tableView.reloadData()
    }
    
    
    func showLoading() {
        print("loading")
    }
    
    func hideLoading() {
        print("loading removed")
    }
}

extension ListingView: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = presenter?.numberOfItems{
            return count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ListingViewTableCellView
    
        if let data = presenter?.item(at: indexPath.row){
            cell.setup(data: data)
            cell.selectionStyle = .none
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
