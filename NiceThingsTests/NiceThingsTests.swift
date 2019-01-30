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
    
    func test_load_UIView_from_nib() {
        let view = YourView().loadNib()
        XCTAssertTrue(view is YourView)
    }
    
    func test_Result() {
        let result: Result<Any, Any> = .success("hi")
        
        switch result {
        case .success:
            print("success! 🎉")
        case .failure:
            print("failure...")
        }
    }
    
    /// Tests the performance of using `XCTBlockExpectation`. Note that the test case finishes
    /// immediately after the block condition returns `true`. This is how you might expect
    /// `XCTNSPredicateExpectation` to work, but that class seems to only evaluate the block
    /// about one time per second. That's insanely slow, especially if you have a large suite
    /// of async tests.
    func test_XCTBlockExpectation() {
        measure {
            var moveAlong = false
            let expectation = XCTBlockExpectation { moveAlong == true }
            
            DispatchQueue.global().asyncAfter(deadline: .now() + 0.05) {
                moveAlong = true
            }
            
            wait(for: [expectation], timeout: 2)
        }
    }
    
    /// Tests the performance of using `XCTNSPredicateExpecation` where the `NSPredicate`
    /// contains a block. Run this by removing the 'x' from the beginning of the method name,
    /// and see how much slower it is than `testXCTBlockExpectation`.
    func xtest_XCTNSPredicateExpectation_should_be_replaced_with_XCTBlockExpectation() {
        measure {
            var moveAlong = false
            let predicate = NSPredicate(block: { _,_ in moveAlong == true })
            let expectation = XCTNSPredicateExpectation(predicate: predicate, object: nil)
            
            DispatchQueue.global().asyncAfter(deadline: .now() + 0.05) {
                moveAlong = true
            }
            
            wait(for: [expectation], timeout: 2)
        }
    }
        
}
