//
//  viewModel.swift
//  proof of concept
//
//  Created by Amit Dhadse on 10/12/19.
//  Copyright © 2019 Akshay Dibe. All rights reserved.
//

import Foundation


class viewModel {
    
    // MARK: - Properties
    private var response: Response? {
        didSet {
            guard let data = response else { return }
            self.setData(with: data)
            self.didFinishFetch?()
        }
    }
    
    private var dataService : DataService?
    
    var error : Error? {
        didSet{ self.showAlertClosure?() }
    }
    
    var isLoading : Bool = false {
        didSet{ self.updateLoadingStatus?() }
    }
    
    var message : String!
    var title : String!
    var rows : [rows]!

    
    
    
    
    // MARK: - Closures for callback, since we are not using the ViewModel to the View.
    var showAlertClosure: (() -> ())?
    var updateLoadingStatus: (() -> ())?
    var didFinishFetch: (() -> ())?
    
    // MARK: - Constructor
    init(dataService : DataService){
        self.dataService = dataService
    }
    
    // MARK: - Network Call
    
    func callWebservice(){
        self.dataService?.callWebservice(completion: { (response, error) in
            if let error = error {
                self.error = error
                self.isLoading = false
                return
            }
            
            self.error = nil
            self.isLoading = false
            self.response = response
            print(self.response!)
        })
        
    }
    
    // MARK: - UI Logic
    private func setData(with data: Response){
        

        if let title = data.title {
            self.title = title
        }
        
        if let rows = data.rows {
            self.rows = rows
        }
        
    }
}
