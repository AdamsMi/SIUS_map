//
//  ObjectsViewController.swift
//  Feed Me
//
//  Created by Michał on 26/05/17.
//  Copyright © 2017 Ron Kliffer. All rights reserved.
//

import UIKit
import MapKit

class ObjectsViewController: UIViewController {

  @IBOutlet weak var myMapView: MKMapView!
  let regionRadius: CLLocationDistance = 1000

  
  func centerMapOnLocation(location: CLLocation) {
    let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                              regionRadius * 2.0, regionRadius * 2.0)
    myMapView.setRegion(coordinateRegion, animated: true)
    
    
  }
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      
      let initialLocation = CLLocation(latitude: 50.06143, longitude: 19.9365800)
      var ct = 0
      ObjectResponse.initialObjects() {(response) -> () in
        print("\(response.objects!)")
        
        
        for (id, coords) in response.objects! {
          let oneObject = UserAnnotation(name: id, coordinate: CLLocationCoordinate2D(latitude: Double(coords[0])!, longitude: Double(coords[1])!))
          self.myMapView.addAnnotation(oneObject)

          
          if(ct == 0){
            ct+=1;
            
            self.centerMapOnLocation(CLLocation(latitude: Double(coords[0])!, longitude: Double(coords[1])!))

          }
        }
        
        
        
        
      }


      
    }
  @IBAction func refreshAction(sender: AnyObject){
//    UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
//      }, completion: nil)
    ObjectResponse.initialObjects() {(response) -> () in


      
      for (id, coords) in response.objects! {
        for case let ann as UserAnnotation in self.myMapView.annotations {
          if(ann.name == id){
            UIView.animateWithDuration(0.5, animations: {
                    ann.coordinate = CLLocationCoordinate2D(latitude: Double(coords[0])!, longitude: Double(coords[1])!)
            })
          }
          
        }
        
      
      }
    }


    
    
  }

}
