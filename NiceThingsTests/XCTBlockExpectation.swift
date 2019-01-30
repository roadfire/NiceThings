//
//  XCTBlockExpectation.swift
//  NiceThingsTests
//
//  Created by Matt Lorentz and Josh Brown on 1/30/19.
//  Copyright © 2019 Roadfire Software. All rights reserved.
//

import XCTest

/// Like `XCTNSPredicateExpectation`, but insanely fast.
/// `XCTBlockExpectation` is fulfilled *immediately* when the block condition is met,
/// rather than taking a full second to fulfill like `XCTNSPredicateExpectation`.
class XCTBlockExpectation: XCTestExpectation {
    var queue = DispatchQueue(label: "XCTBlockExpectationQueue", qos: .background)
    
    init(condition: @escaping () -> Bool) {
        super.init(description: "XCTBlockExpectation")
        waitForCondition(condition: condition)
    }
    
    func waitForCondition(condition: @escaping () -> Bool) {
        queue.async { [weak self] in
            if condition() {
                self?.fulfill()
            } else {
                self?.waitForCondition(condition: condition)
            }
        }
    }
}

