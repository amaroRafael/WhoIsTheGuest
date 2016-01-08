//
//  RAAddGuestViewController.swift
//  WhoIsTheGuest
//
//  Created by Rafael Luis Neves Amaro on 1/6/16.
//  Copyright © 2016 Rafael Luis Neves Amaro. All rights reserved.
//

import UIKit

class RAAddGuestViewController: UIViewController, RAAddGuestViewProtocol, UITextFieldDelegate {

    var presenter: RAAddGuestPresenterProtocol?
    
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPhone: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Save, target: self, action: "saveClick:")
        self.activityIndicator!.center = self.view.center
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.textFieldName.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField.placeholder!.lowercaseString == "name" {
            self.textFieldEmail.becomeFirstResponder()
        } else if textField.placeholder!.lowercaseString == "email" {
            self.textFieldPhone.becomeFirstResponder()
        } else {
            saveClick(self)
        }
        
        return true;
    }

    @IBAction func saveClick(sender: AnyObject) {
        let guest: RAGuestModel = RAGuestModel()
        if let _ = self.textFieldName.text {
            guest.name = self.textFieldName.text!
        } else {
            self.showError("Name is required")
            return
        }

        if let _ = self.textFieldEmail.text {
            guest.email = self.textFieldEmail.text!
        } else {
            self.showError("Email is required")
            return
        }

        if let _ = self.textFieldPhone.text {
            guest.phone = self.textFieldPhone.text!
        }
        
        self.presenter!.save(guest)
    }
    
    func showLoading() {
        self.activityIndicator.startAnimating()
    }
    
    func hideLoading() {
        self.activityIndicator.stopAnimating()
    }
    
    func showError(message: String) {
        let alertController = UIAlertController(title: "Message", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }

}

