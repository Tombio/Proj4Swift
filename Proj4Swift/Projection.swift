//
//  Projection.swift
//  Proj4Swift
//
//  Created by Fang-Pen Lin on 3/12/16.
//  Copyright © 2016 Fang-Pen Lin. All rights reserved.
//

import Foundation

import Proj4

public final class Projection {
    enum Error: ErrorType {
        case InitFailed(code: Int, message: String)
    }
    
    let config: String
    
    private let proj: projPJ
    
    init(config: String) throws {
        self.config = config
        proj = pj_init_plus(config)
        if proj == nil {
            let errnoRef = pj_get_errno_ref()
            let errno = Int(errnoRef.memory)
            let message = pj_strerrno(errnoRef.memory)
            throw Error.InitFailed(code: errno, message: String(UTF8String: UnsafePointer<CChar>(message))!)
        }
    }
}
