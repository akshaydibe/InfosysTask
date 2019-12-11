//
//  DataService.swift
//  proof of concept
//
//  Created by Amit Dhadse on 10/12/19.
//  Copyright © 2019 Akshay Dibe. All rights reserved.
//

import Foundation

struct DataService
{
    // MARK: - Singleton
    static let sharedInstance = DataService()
    
    
    
    mutating func callWebservice(completion: @escaping (Response?, Error?) -> ()) {
        
        if let path = Bundle.main.path(forResource: "test", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let dataDictionar = try decoder.decode(Response.self, from: data)
                print(dataDictionar)
                completion(dataDictionar,nil)
 
            } catch {
                // handle error
            }
        }
        
//        let headers = [
//            "cache-control": "no-cache"
//        ]
//
//        let request = NSMutableURLRequest(url: NSURL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json")! as URL,
//                                          cachePolicy: .useProtocolCachePolicy,
//                                          timeoutInterval: 10.0)
//        request.httpMethod = "GET"
//        request.allHTTPHeaderFields = headers
//
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//            guard let data = data else {return}
//
//            do {
//
//                let decoder = JSONDecoder()
//                let dataDictionar = try decoder.decode(Response.self, from: data)
//                print(dataDictionar)
//                completion(dataDictionar,nil)
//
//            }catch let err {
//                print(err)
//            }
//
//            guard let err = error else {return}
//            completion(nil,err)
//        })
//
//        dataTask.resume()
        

    }
}
