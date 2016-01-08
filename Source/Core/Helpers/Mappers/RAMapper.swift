//
//  BSMapper.swift
//  WhoIsTheGuest
//
//  Created by Rafael Luis Neves Amaro on 1/6/16.
//  Copyright © 2016 Rafael Luis Neves Amaro. All rights reserved.
//

import Foundation

public protocol RAMapper {
    typealias M
    typealias D
    
    static func modelToData(model: M) -> D
    static func dataToModel(data: D) -> M
}
