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
    @IBOutlet weak var searchTextField: UITextField!{
        didSet{
            searchTextField.delegate = self
        }
    }
    
    private let identifier = "ListingViewTableCellView"
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshListData(_:)), for: .valueChanged)
        refreshControl.tintColor = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching Image Data ...")
        presenter?.viewDidLoad()
    }
}

extension ListingView: ListingViewProtocol{
    
    func refreshView() {
        print("refresh")
        self.refreshControl.endRefreshing()
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
        if let data = presenter?.item(at: indexPath.row){
            presenter?.showListDetail(item: data)
        }
    }
}

extension ListingView: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == searchTextField{
            searchTextField.resignFirstResponder()
            if let key = searchTextField.text{
                if !key.isEmpty{
                    presenter?.viewSearchList(key: key)
                }else{
                    presenter?.showError(message: "Search keyword is empty")
                }
            }
        }
        return true
    }
}

extension ListingView{
    @objc private func refreshListData(_ sender: Any) {
        if let key = searchTextField.text{
            if key.isEmpty{
                refreshControl.attributedTitle = NSAttributedString(string: "Fetching Image Data ...")
                presenter?.viewUpdateList()
            }else{
                refreshControl.attributedTitle = NSAttributedString(string: "Fetching Image Data for \(key)")
                presenter?.viewSearchList(key: key)
            }
        }
    }
}
