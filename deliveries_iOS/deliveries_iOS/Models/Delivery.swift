//
//  Delivery.swift
//  deliveries_iOS
//
//  Created by XCodeClub on 2017-05-23.
//  Copyright © 2017 Ben Liong. All rights reserved.
//

import UIKit
import MapKit
import ObjectMapper

//{
//    "description": "Deliver documents to Andrio",
//    "imageUrl": "http://placekitten.com.s3.amazonaws.com/homepage-samples/200/287.jpg",
//    "location": {
//        "lat": 22.336093,
//        "lng": 114.155288,
//        "address": "Cheung Sha Wan"
//    }
//}

class Location:Mappable {
    var latitude:CLLocationDegrees?
    var longitude:CLLocationDegrees?
    var address:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        latitude    <- map["lat"]
        longitude   <- map["lng"]
        address    <- map["address"]
    }
}

class Delivery: Mappable {
    var details:String?
    var _imageURLString:String?
    var imageURL:URL? {
        get {
            guard let imageURLString = _imageURLString else {
                return nil
            }
            return URL(string: imageURLString)
        }
        set {
            _imageURLString = newValue?.absoluteString
        }
    }
    var location:Location?
    
    var coordinate:CLLocationCoordinate2D? {
        get {
            guard let latitude = location?.latitude, let longitude = location?.longitude else {
                return nil
            }
            return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
    }
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        details                 <- map["description"]
        _imageURLString         <- map["imageUrl"]
        location                <- map["location"]
    }
}
