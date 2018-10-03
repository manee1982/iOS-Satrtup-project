//
//  ViewController.swift
//  StartUpProject
//
//  Created by Saleh Alshamrani on 29/08/2018.
//  Copyright © 2018 Saleh Alshamrani. All rights reserved.
//

import UIKit

struct Res: Decodable {
    let item_name: String
    let discription: String
}

class Main: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = Config.BASE_URL + "store/main.php"
        let params = "username=manee&password=123"
        
        Http.shared.POSTRequest(url: url, params: params) { (response) in
            
            // Error connecting to server
            if let connectionError = response as? String {
                print(connectionError)
                Alert.OKAndCancelAction(in: self, titlefor: "حسنا", title: "اتصال الانترنت", message: "تعذر الاتصال بالانترنت")
            }
            
            // We got data from server
            if let data = response as? Data {
                do {
                    let json = try JSONDecoder.init().decode([Res].self, from: data)
                    print(json)
                    
                } catch let error {
                    print(error)
                }
            }
            
            // Response code, application specific response code
            if let responseCode = response as? Int {
                print(responseCode)
            }
            
        }
    }
}


