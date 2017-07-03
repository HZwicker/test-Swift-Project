//
//  PlaceTableViewCelll.swift
//  Projeto Final Henrique Zwicker GADS T2 NOITE
//
//  Created by Henrique on 9/24/16.
//  Copyright © 2016 Henrique.Zwicker. All rights reserved.
//

import UIKit
import MapKit

class PlaceTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var lbTitulo: UILabel!
    @IBOutlet weak var lbDescricao: UILabel!
    @IBOutlet weak var lbEndereco: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}