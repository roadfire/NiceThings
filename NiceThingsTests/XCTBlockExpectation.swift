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
    private var queue = DispatchQueue(label: "XCTBlockExpectationQueue", qos: .background)
    
    /// Creates an expectation that is fulfilled immediately when a block returns true.
    /// - parameter condition: The block that is evaluated by the expectation.
    init(condition: @escaping () -> Bool) {
        super.init(description: "XCTBlockExpectation")
        waitForCondition(condition: condition)
    }
    
    private func waitForCondition(condition: @escaping () -> Bool) {
        queue.async { [weak self] in
            if condition() {
                self?.fulfill()
            } else {
                self?.waitForCondition(condition: condition)
            }
        }
    }
}

