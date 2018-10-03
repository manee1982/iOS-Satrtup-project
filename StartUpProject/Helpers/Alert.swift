//
//  Alert.swift
//  httpCommon
//
//  Created by Saleh Alshamrani on 29/08/2018.
//  Copyright © 2018 Saleh Alshamrani. All rights reserved.
//

import UIKit

class Alert: UIAlertController {
    
    static func OKAction(in vc: UIViewController, title: String, message: String) {
        
        let uiAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        uiAlert.addAction(UIAlertAction(title: "حسنا", style: .default, handler: { (action: UIAlertAction!) in
            print("Handle Ok logic here")
        }))
        
        vc.present(uiAlert, animated: true, completion: nil)
    }
    
    static func OKAndCancelAction(in vc: UIViewController, titlefor OKAction: String, title: String, message: String) {
        
        let uiAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        uiAlert.addAction(UIAlertAction(title: OKAction, style: .default, handler: { (action: UIAlertAction!) in
            print("Handle Ok logic here")
        }))
        uiAlert.addAction(UIAlertAction(title: "الغاء", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle cancel logic here")
        }))
        
        vc.present(uiAlert, animated: true, completion: nil)
    }
    
}
