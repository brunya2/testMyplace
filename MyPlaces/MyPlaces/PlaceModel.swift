//
//  PlaceModel.swift
//  MyPlaces
//
//  Created by Brunya on 02.02.2021.
//

import UIKit

struct Place {
    var name: String
    var location: String?
    var type: String?
    var image: UIImage?
    var restaurantImage: String?
    
    static let storeNames = [ "Alina", "Vkus Vill", "Perekrestok", "Pyaterochka", "Krasno-Beloe"]
    
    
    
   static func getPlaces() -> [Place] {
        var places = [Place]()
        for place in storeNames{
            places.append(Place (name: place, location: "Moscow", type: "Store", image: nil, restaurantImage: place))
            
        }
        return places
    }
}
