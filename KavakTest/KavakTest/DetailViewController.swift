//
//  DetailViewController.swift
//  KavakTest
//
//  Created by Adrian Pascual Dominguez Gomez on 7/9/19.
//  Copyright © 2019 Adrian Pascual Dominguez Gomez. All rights reserved.
//

import UIKit
enum secciones: Int {
    case name
    case age
    case weight
    case height
    case hair_color
    case professions
    case friends
}
class DetailViewController: UIViewController {
    
    var gnome: Gnome = Gnome()
    
    @IBOutlet weak var profileTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do_l setup after loading the view.
        
        profileTableView?.dataSource = self
        profileTableView?.delegate = self
        profileTableView?.estimatedRowHeight = 100
        profileTableView?.rowHeight = UITableView.automaticDimension
        profileTableView?.register(GnomeTableViewCell.nib, forCellReuseIdentifier: GnomeTableViewCell.identifier)
        profileTableView?.register(GnomeGenericCell.nib, forCellReuseIdentifier: GnomeGenericCell.identifier)
    }
    
    static var viewIdentifier: String {
        return String(describing: self)
    }
    
}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return itemType[section].rowCount
        switch section {
        case secciones.professions.rawValue:
            return gnome.professions?.count ?? 0
        case secciones.friends.rawValue:
            return gnome.friends?.count ?? 0
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case secciones.name.rawValue:
            return "Profile"
        case secciones.age.rawValue:
            return "Age"
        case secciones.weight.rawValue:
            return "Weight"
        case secciones.height.rawValue:
            return "Height"
        case secciones.hair_color.rawValue:
            return "Hair Color"
        case secciones.professions.rawValue:
            return "Professions"
        case secciones.friends.rawValue:
            return "Friends"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Si es la primer seccion se crea la celda GnomeTableViewCell que es la que contiene la imagen
        if indexPath.section == 0{
            if let gnomeCell = tableView.dequeueReusableCell(withIdentifier: GnomeTableViewCell.identifier, for: indexPath) as? GnomeTableViewCell{
                gnomeCell.lblName.text = gnome.name!
                
                if let imageURL = URL(string: gnome.thumbnail!) {
                    DispatchQueue.global().async {
                        let data = try? Data(contentsOf: imageURL)
                        if let data = data {
                            let image = UIImage(data: data)
                            DispatchQueue.main.async {
                                gnomeCell.profilePicture.image = image
                            }
                        }
                    }
                }
                
                return gnomeCell
            }
        }
        //Para las demàs secciones se crean las celdas genèricas
        if let genericCell = tableView.dequeueReusableCell(withIdentifier: GnomeGenericCell.identifier, for: indexPath) as? GnomeGenericCell{
        switch indexPath.section {
        case 1://Edad
            genericCell.genericLbl.text = "\(gnome.age!) Years"
            return genericCell
        case 2://Peso
            genericCell.genericLbl.text = "\(gnome.weight!)"
            return genericCell
        case 3://Altura
            genericCell.genericLbl.text = "\(gnome.height!)"
            return genericCell
        case 4://Color de Cabello
            genericCell.genericLbl.text = "\(gnome.hair_color!)"
            return genericCell
        case 5://Profesiones
            genericCell.genericLbl.text = gnome.professions?[indexPath.row]
            return genericCell
        case 6://Amigos
            genericCell.genericLbl.text = gnome.friends?[indexPath.row]
            return genericCell
        default:
            return UITableViewCell()
            }
            
        }
        
        
        return UITableViewCell()
    }
    
}
