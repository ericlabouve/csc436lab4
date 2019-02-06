////
////  TableViewController.swift
////  lab4
////
////  Created by Eric LaBouve on 1/28/19.
////  Copyright © 2019 Eric LaBouve. All rights reserved.
////
//
//import UIKit
//import os.log
//
//class TableViewController: UITableViewController {
//
//    var contacts = [Contact]()
//    var photos = [UIImage]()
//    var names = [String]()
//    var descriptions = [String]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        loadContactInfo()
//
//        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
//        self.navigationItem.rightBarButtonItem = addButton
//
//        // Uncomment the following line to preserve selection between presentations
//        // self.clearsSelectionOnViewWillAppear = false
//
//        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//        // self.navigationItem.rightBarButtonItem = self.editButtonItem
//    }
//
//    @objc func insertNewObject(_ sender: AnyObject) {
//        //let custNum = customers.count + 1
//
//        //customers.append(Customer(name: String(custNum), country: String(custNum * 10), rep: String(custNum * 100)))
//        contacts.append(generateRandomContact())
//
//        self.tableView.reloadData()
//
//        //updatePersistentStorage()
//    }
//
//    func generateRandomContact() -> Contact {
//
//        return Contact(name: names[Int.random(in: 0..<names.count)], distance: Int.random(in: 0..<6), description: descriptions[Int.random(in: 0..<descriptions.count)], image: photos[Int.random(in: 0..<photos.count)])
//    }
//
//    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return contacts.count
//    }
//
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTVCell", for: indexPath) as? CustomTVCell
//
//        let thisContact = contacts[indexPath.row]
//        cell?.nameLabel?.text = thisContact.name
//        cell?.photoImageView.image = thisContact.image
//        cell?.descriptionLabel.text = thisContact.description
//        cell?.distanceLabel.text = String(thisContact.distance) + " miles"
//
//        return cell!
//    }
//
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 90
//    }
//
//    /*
//    // Override to support conditional editing of the table view.
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
//    */
//
//    /*
//    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
//    }
//    */
//
//    /*
//    // Override to support rearranging the table view.
//    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//
//    }
//    */
//
//    /*
//    // Override to support conditional rearranging of the table view.
//    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the item to be re-orderable.
//        return true
//    }
//    */
//
//
//    // MARK: - Navigation
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Customize the data passing for the specific show segue
//        switch(segue.identifier ?? "") {
//        case "showSelectedContact":
//            os_log("Editing contact.", log: OSLog.default, type: .debug)
//            let destVC = segue.destination as? EditViewController
//            let selectedIndexPath = tableView.indexPathForSelectedRow
//            destVC?.contactFromTable = contacts[(selectedIndexPath?.row)!]
//         case "AddItem":
//            os_log("Adding a new contact.", log: OSLog.default, type: .debug)
//        default:
//            fatalError("Unexpected Segue Identifier; \(segue.identifier!)")
//        }
//    }
//
//
//    func loadContactInfo() {
//        photos = [UIImage(named: "sloth1")!, UIImage(named: "sloth2")!, UIImage(named: "sloth3")!, UIImage(named: "sloth4")!, UIImage(named: "sloth5")!, UIImage(named: "sloth6")!, UIImage(named: "sloth7")!, UIImage(named: "sloth8")!]
//        names = ["Bobert", "Sarah", "Dilbert", "Hannah", "Slothiboy", "Larry", "Taylor", "Slothigirl"]
//        descriptions = ["Hello! I'm new to the forest. Let's eat leaves together!", "Looking for someone who is good at hanging around ;)", "Eat. Sleep. Sleep. Sleep. Repeat.", "Looking for a sloth to sweep me off my claws <3", "Who wants to eat ALL DAY LONG?", "Hit me up if you want to climb trees!", "Just moved to this tree and looking for some lazy friends.", "DM me with your favorite leaf flavor!"]
//    }
//}
