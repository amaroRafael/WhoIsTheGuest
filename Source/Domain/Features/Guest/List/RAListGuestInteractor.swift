//
//  RAListGuestInteractor.swift
//  WhoIsTheGuest
//
//  Created by Rafael Luis Neves Amaro on 1/6/16.
//  Copyright © 2016 Rafael Luis Neves Amaro. All rights reserved.
//

import Foundation

class RAListGuestInteractor: RAInteractorResultProtocol {
    typealias T = [ RAGuest ]
    
    var repository: RAGuestRepository!
    
    init (repository: RAGuestRepository) {
        self.repository = repository
    }
    
    func result(completionHandlerWithSuccess: (resultObject: T) -> ()) throws {
        completionHandlerWithSuccess(resultObject: self.repository.getAllGuest())
    }
}