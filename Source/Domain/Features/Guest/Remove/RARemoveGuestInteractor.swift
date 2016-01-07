//
//  RARemoveGuestInteractor.swift
//  WhoIsTheGuest
//
//  Created by Rafael Luis Neves Amaro on 1/6/16.
//  Copyright © 2016 Rafael Luis Neves Amaro. All rights reserved.
//

import Foundation

class RARemoveGuestInteractor: RAInteractorResultProtocol {
    typealias T = Bool
    
    var repository: RAGuestRepository!
    var guest: RAGuest?
    
    init (repository: RAGuestRepository) {
        self.repository = repository
    }
    
    func setGuest(guest: RAGuest) {
        self.guest = guest
    }
    
    func result(completionHandlerWithSuccess: (resultObject: T) -> ()) throws {
        completionHandlerWithSuccess(resultObject: self.repository.removeGuest(self.guest!))
    }
}