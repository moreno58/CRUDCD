//
//  TVConsultorio.swift
//  ConsultoriosApp
//
//  Created by Jeanette Moreno on 6/13/19.
//  Copyright © 2019 Jeanette. All rights reserved.
//

import UIKit

class TVConsultorio: UITableViewCell {


    @IBOutlet weak var buDelete: UIButton!
    
    @IBOutlet weak var buedit: UIButton!
    
    
    @IBOutlet weak var lblConsultorio: UILabel!
    @IBOutlet weak var lblDireccion: UILabel!
    @IBOutlet weak var lblTelefono: UILabel!
    @IBOutlet weak var lblFecha: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func SetConsul(consul: Consultorios){
        lblConsultorio.text = consul.consultorio
        lblDireccion.text = consul.direccion
        lblTelefono.text = consul.telefono
        
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "MM/dd/yy h:mm a"
        let now = dateFormat.string(from: consul.data_save as! Date)
        lblFecha.text = now
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}

