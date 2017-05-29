//
//  UserAnnotation.swift
//  Feed Me
//
//  Created by Michał on 26/05/17.
//  Copyright © 2017 Ron Kliffer. All rights reserved.
//

import MapKit
import Foundation


class UserAnnotation: MKPointAnnotation{
  
  let name: String
  var currentCoordinate: CLLocationCoordinate2D
  var lastCoordinate: CLLocationCoordinate2D?
  
  
  init(name:String, coordinate: CLLocationCoordinate2D){
    self.name = name
    self.currentCoordinate = coordinate
    super.init()
    self.coordinate = coordinate
    
  }
  
}
