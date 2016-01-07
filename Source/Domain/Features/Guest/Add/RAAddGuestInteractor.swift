//
//  RAAddGuest.swift
//  WhoIsTheGuest
//
//  Created by Rafael Luis Neves Amaro on 1/6/16.
//  Copyright © 2016 Rafael Luis Neves Amaro. All rights reserved.
//

import Foundation

class RAAddGuestInteractor : RAInteractorResultProtocol {
    
    typealias T = RAGuest
    
    var repository: RAGuestRepository!
    var guest: RAGuest?
 
    init (repository: RAGuestRepository) {
        self.repository = repository
    }
    
    func setGuest(guest: RAGuest) {
        self.guest = guest
    }
    
    func result(completionHandlerWithSuccess: (resultObject: T) -> ()) throws {

        if let _ = self.guest {
            
            if self.guest!.name.isEmpty {
                throw RAParameterError.Required("Name")
            } else if self.guest!.email.isEmpty {
                throw RAParameterError.Required("Email")
            }
            
        } else {
            throw RAParameterError.Required("Guest")
        }
        
        if self.guest!.id.isEmpty {
            self.guest!.id = self.randomStringWithLength(arc4random_uniform(100))
        }
        
        completionHandlerWithSuccess(resultObject: self.repository.addGuest(self.guest!))
    }
    
    func randomStringWithLength (lenParam : UInt32) -> String {
        
        let len = Int(lenParam)
        
        let letters: NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        
        let randomString: NSMutableString = NSMutableString(capacity: len)
        
        for var i=0; i < len; i++ {
            let length = UInt32(letters.length)
            let rand = arc4random_uniform(length)
            randomString.appendFormat("%C", letters.characterAtIndex(Int(rand)))
        }
        
        return randomString as String
    }
}