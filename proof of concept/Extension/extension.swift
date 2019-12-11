//
//  extension.swift
//  proof of concept
//
//  Created by Amit Dhadse on 10/12/19.
//  Copyright © 2019 Akshay Dibe. All rights reserved.
//

import Foundation
import NVActivityIndicatorView


extension UIViewController : NVActivityIndicatorViewable {

    func activityIndicatorStart() {
        let size = CGSize(width: 60, height: 60)
        startAnimating(size, message: "Loading...", type: .lineScalePulseOut, fadeInAnimation: nil)
        print("start")
    }
    
    func activityIndicatorStop() {
        self.stopAnimating(nil)
    }
    
    func showErrorAlert(message:String){
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)

        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func navigateToAnotherVC(storyBoardName : String, storyBoardIdentifier : String){
        let storyBoard = UIStoryboard(name: storyBoardName, bundle: nil)
        let VC = storyBoard.instantiateViewController(withIdentifier: storyBoardIdentifier)
        self.navigationController?.pushViewController(VC, animated: true)
    }
}
