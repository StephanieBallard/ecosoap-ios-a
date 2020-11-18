//
//  AdminAllHubsTableViewController.swift
//  labs-ios-starter
//
//  Created by Patrick Millet on 11/10/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

private let reuseIdentifier = "HubCell"

class AdminAllHubsTableViewController: UITableViewController {
    
   
    
    var hubsDict: [String: Hub] {
        return controller.hubs
    }
    var hubs: [Hub] {
        return dictToArray(hubsDict)
    }
  
    
    
    let controller = BackendController.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return hubs.count
    }
    
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HubCell", for: indexPath)
        
        cell.textLabel?.text = hubs[indexPath.row].name
        cell.detailTextLabel?.text = hubs[indexPath.row].id
        
        return cell
    }

//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let selectedRow = hubs[indexPath.row]
//        performSegue(withIdentifier: "HubDetailShowSegue", sender: selectedRow)
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let adminHubDetailView = segue.destination as? AdminHubDetailViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        adminHubDetailView.hub = hubs[indexPath.row]
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    private func dictToArray(_ hubsDict: [String: Hub]) -> [Hub] {
        var uniques = Set<Hub>()
        for (_, hub) in hubsDict {
            uniques.insert(hub)
        }
        let hubs = Array(uniques)
        return hubs
    }
}
