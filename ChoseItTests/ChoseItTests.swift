//
//  ChoseItTests.swift
//  ChoseItTests
//
//  Created by Patrick Korianski on 11/12/18.
//  Copyright © 2018 Patrick Korianski. All rights reserved.
//

import XCTest
@testable import ChoseIt

class ChoseItTests: XCTestCase {
    
    //MARK: ChooseList Tests
    func testChooseListInitializationSucceeds() {
        // Testing a blank list
        let zeroItemsInList = ChoseList.init(name: "Dinner",photo: nil, list: [])
        XCTAssertNotNil(zeroItemsInList)
        
        let itemsinList = ChoseList.init(name: "Moves", photo: nil, list: ["Qdoba","Finz","Turners"])
        XCTAssertNotNil(itemsinList)
        
    }
    
    func testChooseListInitializationFails() {
        // Testing blank name
        let blankName = ChoseList.init(name: "", photo: nil, list: [])
        XCTAssertNil(blankName)
        
        // Actual Fail
        //let fail = ChoseList.init(name: "Food Recipes", photo: nil, list: [])
        //XCTAssertNil(fail)
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
