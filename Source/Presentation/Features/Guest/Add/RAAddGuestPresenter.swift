//
//  RAListGuestPresenter.swift
//  WhoIsTheGuest
//
//  Created by Rafael Luis Neves Amaro on 1/6/16.
//  Copyright © 2016 Rafael Luis Neves Amaro. All rights reserved.
//

import Foundation

class RAAddGuestPresenter: RAAddGuestPresenterProtocol {
    let wireframe: RAAddGuestWireframe
    let view: RAAddGuestViewProtocol
    let interactor: RAAddGuestInteractor
    
    init(wireframe: RAAddGuestWireframe, view: RAAddGuestViewProtocol, interactor: RAAddGuestInteractor) {
        self.wireframe = wireframe
        self.view = view
        self.interactor = interactor
    }
    
    func popViewController() {
        self.wireframe.popViewController()
    }
    
    func save(guest: RAGuestModel) {
        self.view.showLoading()
        self.interactor.setGuest(RAGuestModelMapper.dataToModel(guest))
        
        do {
            try self.interactor.result({ (resultObject) -> () in
                self.wireframe.popViewController()
            })
        } catch RAParameterError.Required(let propertyName) {
            self.showError("\(propertyName) is required")
        } catch {
            self.showError("Error when try add a new guest")
        }
    }
    
    func showError(message: String) {
        self.view.hideLoading()
        self.view.showError(message)
    }
}