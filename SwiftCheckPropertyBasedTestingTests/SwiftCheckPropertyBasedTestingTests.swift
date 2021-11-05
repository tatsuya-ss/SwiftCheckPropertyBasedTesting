//
//  SwiftCheckPropertyBasedTestingTests.swift
//  SwiftCheckPropertyBasedTestingTests
//
//  Created by 坂本龍哉 on 2021/11/06.
//

import XCTest
import SwiftCheck
@testable import SwiftCheckPropertyBasedTesting

final class SwiftCheckPropertyBasedTestingTests: XCTestCase {
    
    func testCalculate() {
        XCTAssertEqual(1 + 1, 2)
        XCTAssertEqual(1 + 2, 3)
        
        // xとyに対して、SwiftCheckがランダムな値を生成してクロージャ内を検証してくれる。
        property("交換法則が成り立つこと") <- forAll({ (x: Int, y: Int) in
            print("交換法則が成り立つこと x:\(x), y:\(y)")
            return x + y == y + x
        })
        
        property("ある値について、２を足したものと、１を２回足したものは等しい") <- forAll({ (x: Int) in
            print("ある値について、２を足したものと、１を２回足したものは等しい x:\(x)")
            return x + 2 == x + 1 + 1
        })
    }
    
}
