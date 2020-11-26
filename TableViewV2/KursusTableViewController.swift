//
//  KursusTableViewController.swift
//  TableViewV2
//
//  Created by Irfan Fauzan R on 18/11/20.
//  Copyright © 2020 Irfan Fauzan R. All rights reserved.
//

import UIKit
/*struct Banner {
    var nama : String
    var kode : String
    var gambar : String

}*/

class KursusTableViewController: UITableViewController,UISearchResultsUpdating {
   
    let banner = [
        (nama: "PHP", kode: "001", gambar: "1"),
        (nama: "SwiftUI", kode: "002", gambar: "2"),
        (nama: "ASP", kode: "003", gambar: "3"),
        (nama: "C#", kode: "004", gambar: "4"),
        (nama: "NodeJS", kode: "005", gambar: "5"),
        (nama: "Phyton", kode: "006", gambar: "6"),
        (nama: "Java", kode: "007", gambar: "7"),
        (nama: "Android Studio", kode: "008", gambar: "8"),
        (nama: "Golang", kode: "009", gambar: "9"),
        ]
    
    //buat bikin searchbar
    let searchController = UISearchController(searchResultsController: nil)
    
    //buat filter data
    var searchResults : [(nama:String, kode:String, gambar:String)] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        searchController.searchResultsUpdater = self
        self.definesPresentationContext = true
        
        //search di atas header
        self.tableView.tableHeaderView = searchController.searchBar
        
        //offset kalo seaarch dibuka
        self.tableView.contentOffset = CGPoint(x: 0, y: searchController.searchBar.frame.height)
    }
    
    func filterContent(for searchText:String){
        searchResults = banner.filter({(nama:String, kode:String, gambar:String)->Bool in
            let match = nama.range(of:searchText, options: .caseInsensitive)
            return match != nil
        })
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text{
            filterContent(for: searchText)
            searchController.obscuresBackgroundDuringPresentation = false
            tableView.reloadData()
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return searchController .isActive ? searchResults.count : banner.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let banners = searchController.isActive ? searchResults[indexPath.row] : banner[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "LogoCell", for: indexPath)
        cell.textLabel?.text = banners.nama
        cell.detailTextLabel?.text = banners.kode
        cell.imageView?.image = UIImage(named: banners.gambar)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let banners = searchController.isActive ? searchResults[indexPath.row] : banner[indexPath.row]
        let VCku = storyboard?.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
        VCku.stringGambar = banners.gambar
        VCku.stringNama = banners.nama
        VCku.stringKode = banners.kode
        
        navigationController?.pushViewController(VCku, animated:true)
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
