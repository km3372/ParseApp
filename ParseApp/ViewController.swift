//
//  ViewController.swift
//  ParseApp
//
//  Created by kenneth moody on 5/22/19.
//  Copyright © 2019 Kenneth Moody Sr. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        findRecord()
        
       // retreiveRecords()
        
       //saveDataToParse()
    }
    
    func findRecord() {
        let query = PFQuery(className: "People")
        query.whereKey("firstName", equalTo: "Dee")
        query.whereKey("lastName", equalTo: "Odus")
        query.getFirstObjectInBackground { (object, error) in
            
            if let object = object {
                print(object)
            }else{
                print(error?.localizedDescription)
            }
        }
    }
    
    func retreiveRecords() {
        
        let query = PFQuery(className: "People")
        query.findObjectsInBackground() { (objects, error) in
            
            if let objecst = objects {
                print(objects)
            }else{
                print(error?.localizedDescription)
            }
            
        }
    }

    func  saveDataToParse() {
        let person = PFObject(className: "People")
        person["firstName"] = "Frank"
        person["lastName"] = "White"
        person.saveInBackground()
    }
}

