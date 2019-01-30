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
    
    func testLoadUIViewFromNib() {
        let view = YourView().loadNib()
        XCTAssertTrue(view is YourView)
    }
    
    func testResult() {
        let result: Result<Any, Any> = .success("hi")
        
        switch result {
        case .success:
            print("success! 🎉")
        case .failure:
            print("failure...")
        }
    }
    
    func testXCTBlockExpectation() {
        var moveAlong = false
        let expectation = XCTBlockExpectation { moveAlong == true }
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            moveAlong = true
        }
        
        wait(for: [expectation], timeout: 5)
    }
        
}
