//
//  ViewController.swift
//  Projeto Final Henrique Zwicker GADS T2 NOITE
//
//  Created by Henrique on 9/24/16.
//  Copyright © 2016 Henrique.Zwicker. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    var places = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        if let placesPath = NSBundle.mainBundle().pathForResource("Places", ofType: "plist") {
            
            if let dic = NSDictionary(contentsOfFile: placesPath) {
                places = dic["places"] as! NSArray
                
                print(places)
            }
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CellPlace", forIndexPath: indexPath) as! PlaceTableViewCell
        
        let item = places[indexPath.row]
        let nome = item["name"] as! String
        let descricao = item["description"] as! String
        let endereco = item["address"] as! String
        let imagem = item["image"] as! String
        
        cell.lbTitulo.text = nome
        cell.lbDescricao.text = descricao
        cell.lbEndereco.text = endereco
        cell.imageCell.image = UIImage(named: imagem)
        
        
        return cell
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let index = tableView.indexPathForSelectedRow {
            
            let detailVC = segue.destinationViewController as! DetailViewController
            let dictionary = places[index.row] as? NSDictionary
            detailVC.dicPlace = dictionary
        }
        
        
    }
}
