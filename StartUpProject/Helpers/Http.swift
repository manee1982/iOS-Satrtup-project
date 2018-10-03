//
//  Http.swift
//  httpCommon
//
//  Created by Saleh Alshamrani on 07/08/2018.
//  Copyright © 2018 Saleh Alshamrani. All rights reserved.
//

import Foundation

class Http {
    
    init () {}
    class var shared: Http {
        struct Static {
            static let instance: Http = Http()
        }
        return Static.instance
    }
    
    func POSTRequest(url: String, params: String, complition: @escaping (Any) -> ()) {
        let url = URL(string: url)
        var request = URLRequest(url: url!)
        
        request.httpMethod = "POST"
        request.addValue(Config.API_TOKEN, forHTTPHeaderField: "Token")
        request.httpBody = String(params).data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print("Error connecting to server \(error)")
                complition("connectionError")
            }
            
            if let response = response as? HTTPURLResponse {
                
                if response.statusCode == 200 {
                    
                    if let data = data {
                        complition(data)
                    }
                } else {
                    complition(response.statusCode)
                }
                
            }
            
        }.resume()
    }
    
    /*
     * http get request
     */
    
    func GETRequest(url: String, complition: @escaping (Any) -> ()) {
        let url = URL(string: url)
        var request = URLRequest(url: url!)
        
        request.httpMethod = "GET"
        request.addValue("Token-String-Heres", forHTTPHeaderField: "Token")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print("Error connecting to server \(error)")
                complition("connectionError")
            }
            
            if let response = response as? HTTPURLResponse {
                
                if response.statusCode == 200 {
                    
                    if let data = data {
                        complition(data)
                    }
                } else {
                    complition(response.statusCode)
                }
                
            }
            
        }.resume()
    }
    
}
