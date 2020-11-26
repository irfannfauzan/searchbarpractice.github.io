//
//  DetailViewController.swift
//  TableViewV2
//
//  Created by Irfan Fauzan R on 18/11/20.
//  Copyright © 2020 Irfan Fauzan R. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var stringNama = ""
    var stringKode = ""
    var stringGambar = ""
    
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var txtKode: UILabel!
    @IBOutlet weak var txtNama: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgView.image = UIImage(named: stringGambar)
        txtKode.text = stringKode
        txtNama.text = stringNama
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
