//
//  ChoseList.swift
//  ChoseIt
//
//  Created by Patrick Korianski on 11/25/18.
//  Copyright © 2018 Patrick Korianski. All rights reserved.
//

import UIKit
import os.log

class ChoseList: NSObject, NSCoding {
    
    required convenience init?(coder aDecoder: NSCoder) {
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a ChoseList object.", log: OSLog.default, type: .debug)
            return nil
        }
            
        // Because photo is an optional property of Meal, just use conditional cast.
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
            
        let list = aDecoder.decodeObject(forKey: PropertyKey.list) as? [String]
            
        // Must call designated initializer.
        self.init(name: name, photo: photo, list: list!)
        
            
    }
    
    //MARK: Properties
    var name: String
    var photo: UIImage?
    var list: [String]
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("choseList")
    
    //MARK: Types
    struct PropertyKey {
        static let name = "name"
        static let photo = "photo"
        static let list = "list"
    }
    
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
    
    func encode(with aCoder: NSCoder) {
        //MARK: NSCoding
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(list, forKey: PropertyKey.list)
    }

}
