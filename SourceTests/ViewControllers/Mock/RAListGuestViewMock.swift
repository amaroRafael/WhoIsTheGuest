//
//  RAListGuestViewMock.swift
//  WhoIsTheGuest
//
//  Created by Rafael Luis Neves Amaro on 1/8/16.
//  Copyright © 2016 Rafael Luis Neves Amaro. All rights reserved.
//

import Foundation
@testable import WhoIsTheGuest

class RAListGuestViewMock: RAListGuestViewProtocol {
    
    var presenter: RAListGuestPresenterProtocol?
    var isShowLoading: Bool = false
    var isHideLoading: Bool = false
    var completion: ((isShowLoading: Bool, isHideLoading: Bool, isReceiveGuest: Bool, isShowError: Bool) -> ())? = nil
    
    func showLoading() {
        self.isShowLoading = true;
    }
    
    func showError(message: String) {
        self.completion!(isShowLoading: self.isShowLoading, isHideLoading: self.isHideLoading, isReceiveGuest: false, isShowError: true)
    }
    
    func hideLoading() {
        self.isHideLoading = true
    }
    
    func reloadGuestList() {
        
    }
    
    func receiveGuest(guests: [RAGuestModel]) {
        self.completion!(isShowLoading: self.isShowLoading, isHideLoading: self.isHideLoading, isReceiveGuest: true, isShowError: false)
    }
    
    func callLoad(completion: (isShowLoading: Bool, isHideLoading: Bool, isReceiveGuest: Bool, isShowError: Bool) -> ()) {
        self.completion = completion
        self.isShowLoading = false
        self.isHideLoading = false
        
        self.presenter!.getAllGuest()
    }
}
