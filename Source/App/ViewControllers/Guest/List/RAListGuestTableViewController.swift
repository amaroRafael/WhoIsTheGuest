//
//  RAListGuestTableViewController.swift
//  WhoIsTheGuest
//
//  Created by Rafael Luis Neves Amaro on 1/6/16.
//  Copyright © 2016 Rafael Luis Neves Amaro. All rights reserved.
//

import UIKit
import Foundation

class RAListGuestTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, RAListGuestViewProtocol {

    var presenter: RAListGuestPresenterProtocol?
    var guests: [RAGuestModel] = [RAGuestModel]()
    var guestSelected: RAGuestModel?
    
    @IBOutlet weak var tableViewGuest: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.activityIndicator!.center = self.view.center
    }
    
    override func viewDidAppear(animated: Bool) {
        self.guestSelected = nil
        self.presenter!.getAllGuest()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addGuestClick(sender: AnyObject) {
        self.presenter!.navigateToAddGuest(RAGlobalConstants.Storyboard.Main, viewControllerIdentifier: RAGlobalConstants.Storyboard.View.Guest.Add)
    }
    
    @IBAction func removeGuetsClick(sender: AnyObject) {
        if let _ = self.guestSelected {
            self.presenter!.removeGuest(self.guestSelected!)
        }
    }
    
    func showLoading() {
        self.activityIndicator.startAnimating()
    }
    
    func hideLoading() {
        self.activityIndicator.stopAnimating()
    }
    
    func showError(message: String) {
        let alertController = UIAlertController(title: "Message", message: message, preferredStyle: .Alert)
        
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .Default, handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.guests.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("UITableViewCell")
        
        if cell == nil {
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "UITableViewCell")
        }
        
        let guest: RAGuestModel = self.guests[indexPath.row]
        
        cell!.accessoryType = UITableViewCellAccessoryType.None

        cell!.textLabel!.text = guest.name
        var detailText = "Email: \(guest.email)"
        
        if guest.phone != nil && !guest.phone!.isEmpty {
            detailText = "\(detailText) - Phone: \(guest.phone!)"
        }
        
        cell!.detailTextLabel!.text = detailText
        
        if let _ = self.guestSelected {
            if self.guestSelected!.id == guest.id {
                cell!.accessoryType = UITableViewCellAccessoryType.Checkmark
            }
        }
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var guest: RAGuestModel? = self.guests[indexPath.row]

        if let _ = self.guestSelected {
            if self.guestSelected!.id == guest!.id {
                guest = nil
            }
        }

        self.guestSelected = guest
        self.tableViewGuest.reloadData()
    }
    
    func receiveGuest(guests: [RAGuestModel]) {
        self.guests = guests
        tableViewGuest.reloadData()
    }
    
    func reloadGuestList() {
        self.presenter!.getAllGuest()
    }
}
