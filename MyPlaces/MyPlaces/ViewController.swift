//
//  ViewController.swift
//  MyPlaces
//
//  Created by Brunya on 28.01.2021.
//

import UIKit

class ViewController: UITableViewController {
   
   
    
    let places = Place.getPlaces()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
 
    override func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        cell.nameLable.text = places[indexPath.row].restaurantImage
        cell.locationLable.text = places[indexPath.row].location
        cell.typeLable.text = places[indexPath.row].type
        cell.imageOfPlace.image = UIImage(named: places[indexPath.row].restaurantImage!)
        cell.imageOfPlace.layer.cornerRadius = cell.imageOfPlace.frame.size.height / 2
        cell.imageOfPlace.clipsToBounds = true
        
         return cell
    }

    
    @IBAction func cancelAction( segue: UIStoryboardSegue)  {}
    
}
