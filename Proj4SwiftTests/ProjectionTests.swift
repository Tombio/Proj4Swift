//
//  ProjectionTests.swift
//  Proj4SwiftTests
//
//  Created by Fang-Pen Lin on 3/12/16.
//  Copyright © 2016 Fang-Pen Lin. All rights reserved.
//

import XCTest
@testable import Proj4Swift

class ProjectionTests: XCTestCase {
    func testProjectionWGS84() {
        // web mercator http://spatialreference.org/ref/sr-org/7483/
        let proj = try! Projection(config: "+proj=longlat +ellps=WGS84 +no_defs")
    }
    
    func testProjectionError() {
        do {
            try Projection(config: "bad")
        } catch {
            print("!!!", (error as! Projection.Error))
        }
    }
    
}
