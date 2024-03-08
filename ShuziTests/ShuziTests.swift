//
//  ShuziTests.swift
//  ShuziTests
//
//  Created by Weerawut Chaiyasomboon on 7/3/2567 BE.
//

import XCTest
@testable import Shuzi

final class ShuziTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMax() throws {
        //Set up data
        let dataArray = [
            (x: 3, y: 7, z: 10),
            (x: 7, y: 10, z: 3),
            (x: 7, y: 3, z: 10),
            (x: 11, y: -15, z: 10),
            (x: 99, y: 6, z: -110),
        ]
        
        //Expected Value
        let expectedValues = [10,10,10,11,99]
        
        //Test
        for i in 0..<dataArray.count{
            let data = dataArray[i]
            let expectedValue = expectedValues[i]
            XCTAssertEqual(expectedValue, myMax(x: data.x, y: data.y, z: data.z))
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
