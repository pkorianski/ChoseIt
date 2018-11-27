//
//  ChoseList.swift
//  ChoseIt
//
//  Created by Patrick Korianski on 11/25/18.
//  Copyright © 2018 Patrick Korianski. All rights reserved.
//

import UIKit

class ChoseList {
    //MARK: Properties
    var name: String
    var photo: UIImage?
    var list: [String]
    
    //MARK: Initialization
    init?(name: String, photo: UIImage?, list: [String]) {
        
        // Initialization will fail is there is no name
        guard !name.isEmpty else {
            return nil
        }
        
        // Initialize stored properties
        self.name = name
        self.photo = photo
        self.list = list
    }
}
