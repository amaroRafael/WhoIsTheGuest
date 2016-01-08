//
//  RAListGuestPresenterMock.swift
//  WhoIsTheGuest
//
//  Created by Rafael Luis Neves Amaro on 1/8/16.
//  Copyright © 2016 Rafael Luis Neves Amaro. All rights reserved.
//

import Foundation
@testable import WhoIsTheGuest
@testable import WhoIsTheGuestTests

class RAListGuestPresenterMock: RAListGuestPresenter {
    
    init(view: RAListGuestViewProtocol) {
        super.init(wireframe: RAListGuestWireframeMock(), view: view, listInteractor: RAListGuestInteractor(repository: RAGuestDataRepositoryMock()), removeInteractor: RARemoveGuestInteractor(repository: RAGuestDataRepositoryMock()))
    }
    
}