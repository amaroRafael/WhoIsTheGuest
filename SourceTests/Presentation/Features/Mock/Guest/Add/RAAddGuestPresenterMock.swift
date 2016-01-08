//
//  RAAddGuestPresenterMock.swift
//  WhoIsTheGuest
//
//  Created by Rafael Luis Neves Amaro on 1/8/16.
//  Copyright © 2016 Rafael Luis Neves Amaro. All rights reserved.
//

import Foundation
@testable import WhoIsTheGuest
@testable import WhoIsTheGuestTests

class RAAddGuestPresenterMock: RAAddGuestPresenter {
    
    init(view: RAAddGuestViewProtocol) {
        super.init(wireframe: RAAddGuestWireframeMock(), view: view, interactor: RAAddGuestInteractor(repository: RAGuestDataRepositoryMock()))
    }
    
}