//
//  TableViewController.swift
//  lab4
//
//  Created by Eric LaBouve on 1/28/19.
//  Copyright © 2019 Eric LaBouve. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var contacts = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadContacts()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTVCell", for: indexPath) as? CustomTVCell

        let thisContact = contacts[indexPath.row]
        cell?.nameLabel?.text = thisContact.name
        cell?.photoImageView.image = thisContact.image
        cell?.descriptionLabel.text = thisContact.description
        cell?.distanceLabel.text = String(thisContact.distance) + " miles"
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Customize the data passing for the specific show segue
        if segue.identifier == "showSelectedContact" {
            let destVC = segue.destination as? ViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow
            destVC?.contactFromTable = contacts[(selectedIndexPath?.row)!]
        }
    }
    

    func loadContacts() {
        let photo1 = UIImage(named: "sloth1")!
        let photo2 = UIImage(named: "sloth2")!
        let photo3 = UIImage(named: "sloth3")!
        let photo4 = UIImage(named: "sloth4")!
        let photo5 = UIImage(named: "sloth5")!
        let photo6 = UIImage(named: "sloth6")!
        let photo7 = UIImage(named: "sloth7")!
        let photo8 = UIImage(named: "sloth8")!
        
        let contact1 = Contact(name: "Bobert", distance: Int.random(in: 1 ..< 10), description: "Hello! I'm new to the forest. Let's eat leaves together!", image: photo1)
        let contact2 = Contact(name: "Sarah", distance: Int.random(in: 1 ..< 10), description: "Looking for someone who is good at hanging around ;)", image: photo2)
        let contact3 = Contact(name: "Dilbert", distance: Int.random(in: 1 ..< 10), description: "Eat. Sleep. Sleep. Sleep. Repeat.", image: photo3)
        let contact4 = Contact(name: "Hannah", distance: Int.random(in: 1 ..< 10), description: "Looking for a sloth to sweep me off my claws <3", image: photo4)
        
        let contact5 = Contact(name: "Slothiboy", distance: Int.random(in: 1 ..< 10), description: "Who wants to eat ALL DAY LONG?", image: photo5)
        let contact6 = Contact(name: "Larry", distance: Int.random(in: 1 ..< 10), description: "Hit me up if you want to climb trees!", image: photo6)
        let contact7 = Contact(name: "Taylor", distance: Int.random(in: 1 ..< 10), description: "Just moved to this tree and looking for some lazy friends.", image: photo7)
        let contact8 = Contact(name: "Slothigirl", distance: Int.random(in: 1 ..< 10), description: "DM me with your favorite leaf flavor!", image: photo8)
        
        contacts += [contact1, contact2, contact3, contact4, contact5, contact6, contact7, contact8].sorted(by: {(a, b) -> Bool in return a.distance < b.distance})
    }
}
