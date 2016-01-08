//
//  BSParameterRequired.swift
//  WhoIsTheGuest
//
//  Created by Rafael Luis Neves Amaro on 1/6/16.
//  Copyright © 2016 Rafael Luis Neves Amaro. All rights reserved.
//

import Foundation

public enum RAParameterError : RABaseError  {
    
    case Required(String)
    
    case Confirm(String)
    
}