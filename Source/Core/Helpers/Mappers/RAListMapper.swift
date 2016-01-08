//
//  BSListMapper.swift
//  WhoIsTheGuest
//
//  Created by Rafael Luis Neves Amaro on 1/6/16.
//  Copyright © 2016 Rafael Luis Neves Amaro. All rights reserved.
//

import Foundation

public class RAListMapper<T: RAMapper> : RAMapper {
    
    public typealias M = Array<T.M>
    public typealias D = Array<T.D>
    
    public init() {
    }
    
    public static func modelToData(model: M) -> D {
        var list = D()
        
        for item in model {
            list.append(T.modelToData(item))
        }
        
        return list
    }
    
    public static func dataToModel(data: D) -> M {
        var list = M()
        
        for item in data {
            list.append(T.dataToModel(item))
        }
        
        return list
    }
}