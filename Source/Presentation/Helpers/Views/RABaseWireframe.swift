//
//  BaseWireframe.swift
//  BasePresentation
//
//  Created by Rafael Luis Neves Amaro on 1/6/16.
//  Copyright © 2016 Rafael Luis Neves Amaro. All rights reserved.
//

import Foundation
import UIKit

public protocol RABaseWireframe {
    typealias T
    typealias P
    
    var storyboardName: String { get }
    var viewControllerIdentifier: String { get }
    var presentedViewController: UIViewController? { get set }
    var presenter: P? { get set }
}

extension RABaseWireframe {

    func viewControllerFromStoryboard() -> T {
        let storyboard = mainStoryboard()
        let viewController = storyboard.instantiateViewControllerWithIdentifier(self.viewControllerIdentifier) as! T
        return viewController
    }
    
    func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: storyboardName, bundle: NSBundle.mainBundle())
        return storyboard
    }
    
    mutating func presentLoginInterfaceFromViewController(viewController: UIViewController, presenter: P) {
        self.presentedViewController = self.viewControllerFromStoryboard() as? UIViewController

        self.presenter = presenter
        viewController.presentViewController(self.presentedViewController!, animated: true, completion: nil)
    }

    static func showRootViewController(viewController: UIViewController, inWindow: UIWindow) {
        let navigationController = navigationControllerFromWindow(inWindow)
        navigationController.viewControllers = [viewController]
    }
    
    static func navigationControllerFromWindow(window: UIWindow) -> UINavigationController {
        let navigationController = window.rootViewController as! UINavigationController
        return navigationController
    }
    
    func popViewController() {
        self.presentedViewController!.navigationController!.popViewControllerAnimated(true)
    }
}