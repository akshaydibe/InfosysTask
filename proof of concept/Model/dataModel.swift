//
//  dataModel.swift
//  proof of concept
//
//  Created by Amit Dhadse on 10/12/19.
//  Copyright © 2019 Akshay Dibe. All rights reserved.
//

import Foundation

struct Response : Codable {
    
    let title : String?
    let rows : [rows]?
    
}

struct rows : Codable {
    
    let title : String?
    let description : String?
    let imageHref : String?
}
