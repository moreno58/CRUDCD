//
//  VCConsultorio.swift
//  ConsultoriosApp
//
//  Created by Jeanette Moreno on 6/13/19.
//  Copyright © 2019 Jeanette. All rights reserved.
//

import UIKit
import CoreData

class VCConsultorio: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var listConsultorio = [Consultorios]()
    
    
    @IBOutlet weak var tvConsultorio: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadConsultorio()
        tvConsultorio.delegate = self
        tvConsultorio.dataSource = self
        
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listConsultorio.count
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TVConsultorio = tableView.dequeueReusableCell(withIdentifier: "CellConsultorio", for:indexPath) as! TVConsultorio
        cell.SetConsul(consul: listConsultorio[indexPath.row])
        cell.buDelete.tag = indexPath.row
        cell.buDelete.addTarget(self, action: #selector(buEliminarPress(_:)), for: .touchUpInside)
        
        cell.buedit.tag = indexPath.row
        cell.buedit.addTarget(self, action: #selector(buEditarPress(_:)), for: .touchUpInside)
        
        return cell
        
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Edit"{
            if let AddOREdit = segue.destination as? ViewController{
                if let myconsul = sender as? Consultorios{
                    AddOREdit.EditConsultorio = myconsul
                    tvConsultorio.reloadData()
                }
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    
    // @IBAction func Agregar(_ sender: Any) {
    //    performSegue(withIdentifier: "Editor", sender: nil)
    // }
    
    
    @objc func buEliminarPress(_ sender:UIButton){
        print("index \(sender.tag)")
        context.delete(listConsultorio[sender.tag])
        loadConsultorio()
    }
    
    @objc func buEditarPress(_ sender:UIButton){
        performSegue(withIdentifier: "Edit", sender: listConsultorio[sender.tag])
        loadConsultorio()
        
    }
    
    func loadConsultorio(){
        let fetchRequest:NSFetchRequest<Consultorios> = Consultorios.fetchRequest()
        do{
            listConsultorio = try context.fetch(fetchRequest)
            tvConsultorio.reloadData()
        }catch{
            print("cannot read from database")
        }
    }
    
    // @IBAction func btnExit(_ sender: Any) {
    //    exit(0)
    // }
    
    
    
    
}

