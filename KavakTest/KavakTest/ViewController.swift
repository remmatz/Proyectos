//
//  ViewController.swift
//  KavakTest
//
//  Created by Adrian Pascual Dominguez Gomez on 7/8/19.
//  Copyright © 2019 Adrian Pascual Dominguez Gomez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    
    final let url = URL(string: "https://raw.githubusercontent.com/rrafols/mobile_test/master/data.json")
    private var gnomes = [Gnome]()
    private var currentGnomes = [Gnome]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        downloadJson()
        searchBar.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(GnomeTableViewCell.nib, forCellReuseIdentifier: GnomeTableViewCell.identifier)
    }
    
    func downloadJson(){
        guard let downloadUrl = url else { return }
        URLSession.shared.dataTask(with: downloadUrl) { data, urlResponse, error in
            guard let data = data, error == nil, urlResponse != nil else {
                print("Error al descargar")
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let downloadedGnomes = try decoder.decode(Brastlewark.self, from: data)
                self.gnomes = downloadedGnomes.Brastlewark
                
                self.currentGnomes = self.gnomes
                
                DispatchQueue.main.async
                {
                    self.tableView.reloadData()
                }
                
            }catch{
                print("Error despues de la descarga")
            }
            
        }.resume()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            currentGnomes = gnomes
            tableView.reloadData()
            return
        }
        
        currentGnomes = gnomes.filter({ gnome -> Bool in gnome.name!.lowercased().contains(searchText.lowercased())})
        tableView.reloadData()
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentGnomes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = currentGnomes[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: GnomeTableViewCell.identifier, for: indexPath) as? GnomeTableViewCell {
            cell.lblName.text = item.name
            
            if let imageURL = URL(string: item.thumbnail!) {
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: imageURL)
                    if let data = data {
                        let image = UIImage(data: data)
                        DispatchQueue.main.async {
                            cell.profilePicture.image = image
                        }
                    }
                }
            }
            
           return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = storyboard?.instantiateViewController(withIdentifier: DetailViewController.viewIdentifier) as? DetailViewController
        
        detailViewController?.gnome = currentGnomes[indexPath.row]
        self.navigationController?.pushViewController(detailViewController!, animated: true)
        
    }
}
