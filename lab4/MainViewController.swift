//
//  MainViewController.swift
//  lab4
//
//  Created by Eric LaBouve on 2/5/19.
//  Copyright © 2019 Eric LaBouve. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Maintain this list for the TableView
    var contacts = [Contact]()
    // Reference to our tableView since we are its datasource and delegate
    @IBOutlet weak var tableView: UITableView!
    // These two items are used for persistent storage
    // This form of storage allows us to save complex data structures
    static let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("savedContacts")
    // Allows for storing key-value pairs persistently across launches
    var ourDefaults = UserDefaults.standard
    // Used for a timestamp in a popup dialog window to let the user know when the last save time was
    var dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        // init with persisted data, if any
        if let lastUpdate = ourDefaults.object(forKey: "lastUpdate") as? Date {
            // Create and show the dialog with the stored date from the UserDefaults
            let updateString = dateFormatter.string(from: lastUpdate)
            print(">"+updateString)
            let dialogString = "Data was last updated:\n\(updateString)"
            let dialog = UIAlertController(title: "Data Restored", message: dialogString, preferredStyle: .alert)
            let action = UIAlertAction(title: "Go Away", style: .cancel, handler: nil)
            dialog.addAction(action)
            present(dialog, animated: true, completion: nil)
            // Load saved contact as a JSON, decode it, then store it in 'contacts'
            do {
                let data = try Data(contentsOf: MainViewController.archiveURL)
                let decoder = JSONDecoder()
                let tempArr = try decoder.decode([Contact].self, from: data)
                contacts = tempArr
            } catch {
                print(error)
            }
        }
    }
    
    // Save 'contacts' and the time. Use then whenever there is a change to the 'contacts' list.
    func updatePersistentStorage() {
        // persist data
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(contacts)
            try jsonData.write(to: MainViewController.archiveURL)
            // timestamp last update
            ourDefaults.set(Date(), forKey: "lastUpdate")
        } catch {
            print(error)
        }
    }
    

    // MARK: - Navigation
    
    // Here we pass any data to other viewcontrollers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Switch on the segue's ID
        switch(segue.identifier ?? "") {
        case "EditContact":
            print("Editing an existing contact")
            // There are two segues to cross (look at the storyboard)
            let navC = segue.destination as? UINavigationController
            let destVC = navC?.topViewController as? EditContactViewController
            // Get the selected contact
            let selectedIndexPath = tableView.indexPathForSelectedRow
            let currentContact = contacts[(selectedIndexPath?.row)!]
            // Initialize contact variable in EditContactViewController
            destVC?.contact = currentContact
        // Do nothing here (just for demonstration purposes)
        case "AddContact":
            print("Adding a new contact")
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier!)")
        }
    }

    
    
    
    // MARK: - Table view data source
    
    // Section is jargon for column
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // The number of rows is the length of your contacts list
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    // Set up the contents of a cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Always include this line to make scrolling smooth
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTVCell", for: indexPath) as? CustomTVCell
        let thisContact = contacts[indexPath.row]
        cell?.nameLabel?.text = thisContact.name
        cell?.photoImageView.image = UIImage(named: thisContact.UIImageName)
        cell?.descriptionLabel.text = thisContact.description
        cell?.distanceLabel.text = String(thisContact.distance) + " miles"
        return cell!
    }
    
    // Set the height of each of the rows
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    // Enable row editing in order to enable 'Slide to Delete'
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // This is what should happen when we slide a row
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            contacts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
            updatePersistentStorage()
        }
    }
    
    
    
    // MARK: - Actions
    
    // This is called once we have clicked 'Save' in AddContactViewController
    @IBAction func unwindFromAddContactVC(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? AddContactViewController, let contact = sourceViewController.contact {
            contacts.append(contact)
            tableView.reloadData()
            updatePersistentStorage()
        }
    }
    
    // This is called once we have clicked 'Save' in EditContactViewController
    @IBAction func unwindFromEditContactVC(sender: UIStoryboardSegue) {
        tableView.reloadData()
        updatePersistentStorage()
    }
    
}
