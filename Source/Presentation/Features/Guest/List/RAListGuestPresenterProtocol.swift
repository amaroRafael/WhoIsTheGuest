//
//  RAListGuestPresenterProtocol.swift
//  WhoIsTheGuest
//
//  Created by Rafael Luis Neves Amaro on 1/6/16.
//  Copyright © 2016 Rafael Luis Neves Amaro. All rights reserved.
//

import Foundation

protocol RAListGuestPresenterProtocol {
    
    func navigateToAddGuest(storyboardName: String, viewControllerIdentifier: String)
 
    func removeGuest(guest: RAGuestModel)
    
    func getAllGuest()
}