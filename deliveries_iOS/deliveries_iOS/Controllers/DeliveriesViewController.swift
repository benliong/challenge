//
//  DeliveriesViewController.swift
//  deliveries_iOS
//
//  Created by XCodeClub on 2017-05-23.
//  Copyright © 2017 Ben Liong. All rights reserved.
//

import UIKit
import ESPullToRefresh

class DeliveriesViewController: UITableViewController {

    var deliveries = [Delivery]()
    private var _offset = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(DeliveryTableViewCell.self, forCellReuseIdentifier: "DeliveryTableViewCell")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
        tableView.es_addPullToRefresh {
            self.deliveries.removeAll()
            self._offset = 0
            self.fetchDeliveries()
        }
        fetchDeliveries()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return deliveries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DeliveryTableViewCell", for: indexPath) as? DeliveryTableViewCell else {
            return UITableViewCell()
        }
        
        cell.delivery = deliveries[indexPath.row]
        cell.reloadData()

        return cell
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func fetchDeliveries() {
        ApiManager.shared.getDeliveries(atOffset: _offset) { (deliveries, nextOffset, error) in
            guard let deliveries = deliveries as? [Delivery], error == nil else {
                self.tableView.reloadData()
                self.tableView.es_stopPullToRefresh()
                return
            }
            if let nextOffset = nextOffset {
                self._offset = nextOffset
            }
            self.deliveries.append(contentsOf: deliveries)
            self.tableView.reloadData()
            self.tableView.es_stopPullToRefresh()
        }
    }
}
