//
//  RAListGuestViewProtocol.swift
//  WhoIsTheGuest
//
//  Created by Rafael Luis Neves Amaro on 1/6/16.
//  Copyright © 2016 Rafael Luis Neves Amaro. All rights reserved.
//

import Foundation

protocol RAListGuestViewProtocol : RALoadDataViewProtocol, RAErrorViewProtocol {
    var presenter: RAListGuestPresenterProtocol? { get set }
    
    func receiveGuest(guests: [RAGuestModel])
    
    func reloadGuestList()
}