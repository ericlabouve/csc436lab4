//
//  MainViewController.swift
//  lab4
//
//  Created by Eric LaBouve on 2/5/19.
//  Copyright © 2019 Eric LaBouve. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var contacts = [Contact]()
    var photos = [UIImage]()
    var names = [String]()
    var descriptions = [String]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadContactInfo()
        
//        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
//        navigationItem.rightBarButtonItem = addButton
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @objc func insertNewObject(_ sender: AnyObject) {
        // contacts.append(generateRandomContact())
        // self.tableView.reloadData()
        //updatePersistentStorage()
    }
    
    func generateRandomContact() -> Contact {
        return Contact(name: names[Int.random(in: 0..<names.count)], distance: Int.random(in: 0..<6), description: descriptions[Int.random(in: 0..<descriptions.count)], image: photos[Int.random(in: 0..<photos.count)])
    }
    
    
    

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Customize the data passing for the specific show segue
        switch(segue.identifier ?? "") {
//        case "showSelectedContact":
//            let destVC = segue.destination as? EditViewController
//            let selectedIndexPath = tableView.indexPathForSelectedRow
//            destVC?.contactFromTable = contacts[(selectedIndexPath?.row)!]
        case "AddContact":
            print("Adding a new contact...")
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier!)")
        }
    }

    
    
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTVCell", for: indexPath) as? CustomTVCell
        
        let thisContact = contacts[indexPath.row]
        cell?.nameLabel?.text = thisContact.name
        cell?.photoImageView.image = thisContact.image
        cell?.descriptionLabel.text = thisContact.description
        cell?.distanceLabel.text = String(thisContact.distance) + " miles"
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            contacts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
    }
    
    
    
    // MARK: - Actions
    @IBAction func unwindFromAddContactVC(sender: UIStoryboardSegue) {
        resignFirstResponder()
        if let sourceViewController = sender.source as? AddContactViewController, let contact = sourceViewController.contact {
            contacts.append(contact)
            tableView.reloadData()
        }
    }
    
    
    
    func loadContactInfo() {
        photos = [UIImage(named: "sloth1")!, UIImage(named: "sloth2")!, UIImage(named: "sloth3")!, UIImage(named: "sloth4")!, UIImage(named: "sloth5")!, UIImage(named: "sloth6")!, UIImage(named: "sloth7")!, UIImage(named: "sloth8")!]
        names = ["Bobert", "Sarah", "Dilbert", "Hannah", "Slothiboy", "Larry", "Taylor", "Slothigirl"]
        descriptions = ["Hello! I'm new to the forest. Let's eat leaves together!", "Looking for someone who is good at hanging around ;)", "Eat. Sleep. Sleep. Sleep. Repeat.", "Looking for a sloth to sweep me off my claws <3", "Who wants to eat ALL DAY LONG?", "Hit me up if you want to climb trees!", "Just moved to this tree and looking for some lazy friends.", "DM me with your favorite leaf flavor!"]
    }
}
