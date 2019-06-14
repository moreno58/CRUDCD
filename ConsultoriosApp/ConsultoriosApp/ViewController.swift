//
//  ViewController.swift
//  ConsultoriosApp
//
//  Created by Jeanette Moreno on 6/13/19.
//  Copyright © 2019 Jeanette. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak var textConsultorio: UITextField!
    @IBOutlet weak var textDireccion: UITextField!
    @IBOutlet weak var textTelefono: UITextField!
    
    
    var EditConsultorio:Consultorios?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let consul = EditConsultorio {
            textConsultorio.text = consul.consultorio
            textDireccion.text = consul.direccion
            textTelefono.text = consul.telefono
            
            
            
        }
        
    }
    

    @IBAction func btnSave(_ sender: Any) {
        var newConsul:Consultorios?
        
        if let consul = EditConsultorio {
            newConsul = consul
        }else{
            newConsul = Consultorios(context: context)
        }
        
        newConsul?.consultorio = textConsultorio.text
        newConsul?.direccion = textDireccion.text
        newConsul?.telefono = textTelefono.text
        newConsul?.data_save = NSDate() as Date
        do{
            ad.saveContext()
            textConsultorio.text = ""
            textDireccion.text = ""
            textTelefono.text = ""
        }catch{
            print("Cannot save")
        }
    }

    }

//exit(0)
//dismiss(animated: true, completion: nil)
