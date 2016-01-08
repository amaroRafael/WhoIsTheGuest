//
//  RAListGuestWireframe.swift
//  WhoIsTheGuest
//
//  Created by Rafael Luis Neves Amaro on 1/6/16.
//  Copyright © 2016 Rafael Luis Neves Amaro. All rights reserved.
//

import Foundation
import UIKit

class RAAddGuestWireframe: RABaseWireframe {
    
    typealias T = RAAddGuestViewProtocol
    typealias P = RAAddGuestPresenterProtocol
    
    var storyboardName: String
    var viewControllerIdentifier: String
    var presentedViewController: UIViewController?
    var presenter: P?
    
    init(storyboardName: String, viewControllerIdentifier: String) {
        self.storyboardName = storyboardName
        self.viewControllerIdentifier = viewControllerIdentifier
    }
    
    func presentInterfaceFromViewController(viewController: UIViewController) {
        self.presentedViewController = self.viewControllerFromStoryboard() as? UIViewController
        
        self.presenter = RAAddGuestPresenter(wireframe: self, view: self.presentedViewController as! RAAddGuestViewProtocol, interactor: RAAddGuestInteractor(repository: RAGuestDataRepository()))
        
        var loginViewController = self.presentedViewController as! RAAddGuestViewProtocol
        
        loginViewController.presenter = self.presenter!
        
        viewController.navigationController!.pushViewController(self.presentedViewController!, animated: true)
    }
}