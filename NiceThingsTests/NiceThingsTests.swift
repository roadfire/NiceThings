//
//  NiceThingsTests.swift
//  NiceThingsTests
//
//  Created by Josh Brown on 2/2/18.
//  Copyright © 2018 Roadfire Software. All rights reserved.
//

import XCTest
@testable import NiceThings

class NiceThingsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testResult() {
        let result = Result.success
        
        switch result {
        case .success:
            print("success! 🎉")
        case .failure:
            print("failure...")
        }
    }
        
}
