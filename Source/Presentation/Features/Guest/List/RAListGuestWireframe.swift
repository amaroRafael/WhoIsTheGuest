//
//  RAListGuestWireframe.swift
//  WhoIsTheGuest
//
//  Created by Rafael Luis Neves Amaro on 1/6/16.
//  Copyright © 2016 Rafael Luis Neves Amaro. All rights reserved.
//

import Foundation
import UIKit

class RAListGuestWireframe: RABaseWireframe {
    
    typealias T = RAListGuestViewProtocol
    typealias P = RAListGuestPresenterProtocol
    
    var storyboardName: String
    var viewControllerIdentifier: String
    var presentedViewController: UIViewController?
    var presenter: P?
    
    init(storyboardName: String, viewControllerIdentifier: String) {
        self.storyboardName = storyboardName
        self.viewControllerIdentifier = viewControllerIdentifier
    }
    
    class func presentInterfaceFromWindow(window: UIWindow, storyboardName: String, viewControllerIdentifier: String) {
        let wireframe = RAListGuestWireframe(storyboardName: storyboardName, viewControllerIdentifier: viewControllerIdentifier)
        
        wireframe.presentedViewController = wireframe.viewControllerFromStoryboard() as? UIViewController
        
        wireframe.presenter = RAListGuestPresenter(wireframe: wireframe,
            view: wireframe.presentedViewController as! RAListGuestViewProtocol,
            listInteractor: RAListGuestInteractor(repository: RAGuestDataRepository()),
            removeInteractor: RARemoveGuestInteractor(repository: RAGuestDataRepository())
        )
        
        var viewController = wireframe.presentedViewController as! RAListGuestViewProtocol
        
        viewController.presenter = wireframe.presenter!
        
        showRootViewController(wireframe.presentedViewController!, inWindow: window)
    }
    
    func navigateToAdd(storyboardName: String, viewControllerIdentifier: String) {
        let wireframe: RAAddGuestWireframe = RAAddGuestWireframe(storyboardName: storyboardName, viewControllerIdentifier: viewControllerIdentifier)
        wireframe.presentInterfaceFromViewController(self.presentedViewController!)
    }

}