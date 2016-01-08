//
//  RAAddGuestWireframeMock.swift
//  WhoIsTheGuest
//
//  Created by Rafael Luis Neves Amaro on 1/8/16.
//  Copyright © 2016 Rafael Luis Neves Amaro. All rights reserved.
//

import Foundation
@testable import WhoIsTheGuest

class RAAddGuestWireframeMock: RAAddGuestWireframe {
    
    init() {
        super.init(storyboardName: RAGlobalConstants.Storyboard.Main, viewControllerIdentifier: RAGlobalConstants.Storyboard.View.Guest.Add)
    }
    
}