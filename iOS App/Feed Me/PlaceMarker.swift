//
//  PlaceMarker.swift
//  Feed Me
//
//  Created by Michał on 18/05/17.
//  Copyright © 2017 Ron Kliffer. All rights reserved.
//

import UIKit

class PlaceMarker: GMSMarker {
  let place: GooglePlace
  
  init(place: GooglePlace) {
    self.place = place
    super.init()
    
    position = place.coordinate
    icon = UIImage(named: place.placeType+"_pin")
    groundAnchor = CGPoint(x: 0.5, y: 1)
    appearAnimation = GMSMarkerAnimation.Pop
  }
}
