//
//  RAListGuestPresenter.swift
//  WhoIsTheGuest
//
//  Created by Rafael Luis Neves Amaro on 1/6/16.
//  Copyright © 2016 Rafael Luis Neves Amaro. All rights reserved.
//

import Foundation

class RAListGuestPresenter: RAListGuestPresenterProtocol {
    let wireframe: RAListGuestWireframe
    let view: RAListGuestViewProtocol
    let listInteractor: RAListGuestInteractor
    let removeInteractor: RARemoveGuestInteractor
    
    init(wireframe: RAListGuestWireframe, view: RAListGuestViewProtocol, listInteractor: RAListGuestInteractor, removeInteractor: RARemoveGuestInteractor) {
        self.wireframe = wireframe
        self.view = view
        self.listInteractor = listInteractor
        self.removeInteractor = removeInteractor
    }
    
    func navigateToAddGuest(storyboardName: String, viewControllerIdentifier: String) {
        wireframe.navigateToAdd(storyboardName, viewControllerIdentifier: viewControllerIdentifier)
    }
    
    func removeGuest(guest: RAGuestModel) {
        self.view.showLoading()
        self.removeInteractor.setGuest(RAGuestModelMapper.dataToModel(guest))
        
        do {
            try self.removeInteractor.result { (resultObject) -> () in
                self.view.hideLoading()
                self.view.reloadGuestList()
            }
        } catch {
            self.view.hideLoading()
            self.view.showError("It is not possible to remove guest now")
        }
    }
    
    func getAllGuest() {
        self.view.showLoading()
      
        do {
            try self.listInteractor.result { (resultObject) -> () in
                self.view.hideLoading()
                self.view.receiveGuest(RAListMapper<RAGuestModelMapper>.modelToData(resultObject))
            }
        } catch {
            self.view.hideLoading()
            self.view.showError("It is not possible to load guests now")
        }
    }
}