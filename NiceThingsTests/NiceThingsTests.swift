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
}
