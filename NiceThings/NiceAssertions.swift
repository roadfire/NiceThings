import Foundation
import XCTest

/**
 Checks that two images are equal. Will call XCTFail() if they are not. The images must be in the same colorspace.
 
 - parameter img1: The first image you would like to compare.
 - parameter img2: The second image you would like to compare.
 */
func XCTAssertEqual(_ img1: UIImage?, _ img2: UIImage?) {

    guard let img1 = img1, let data1 = UIImagePNGRepresentation(img1) else {
        XCTFail("Images are not equal")
        return
    }
    guard let img2 = img2, let data2 = UIImagePNGRepresentation(img2) else {
        XCTFail("Images are not equal")
        return
    }
    
    XCTAssertEqual(data1, data2)
}

/**
 Asserts that two dates are equal within a given number of seconds.
 
 - parameter date1: The date you wish to compare against `date2`.
 - parameter date2: The date you wish to compare against `date1`.
 - parameter accuracy: The number of seconds between `date1` and `date2` that is acceptable to consider them equal.
 */
func XCTAssertEqual(_ date1: Date?, _ date2: Date?, accuracy: Double) {
    switch (date1, date2) {
    case (.none, .none):
        XCTAssertTrue(true)
    case (.some(_), .none), (.none, .some(_)):
        XCTAssertEqual(date1, date2)
    case (.some(let date1), .some(let date2)):
        let diff = abs(date1.timeIntervalSince1970 - date2.timeIntervalSince1970)
        if diff <= accuracy {
            XCTAssertTrue(true)
        } else {
            XCTFail("\(date1) is not within \(accuracy) seconds of \(date2).")
        }
    }
}
