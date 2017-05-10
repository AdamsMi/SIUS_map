//
//  ViewController.swift
//  Mapa
//
//  Created by Michał on 28/04/17.
//  Copyright © 2017 spinney. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController {

    @IBOutlet weak var myMapView: MKMapView!
    
    let regionRadius: CLLocationDistance = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialLocation = CLLocation(latitude: 50.06143, longitude: 19.9365800)
        
        centerMapOnLocation(location: initialLocation)
        let firstUser = UserAnnotation(name: "Tomeczek", coordinate: CLLocationCoordinate2D(latitude: 50.06143, longitude: 19.9365802))
        
        myMapView.addAnnotation(firstUser)
    }

    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
    myMapView.setRegion(coordinateRegion, animated: true)
        
        
        
    }
    
    
    @IBAction func performRandomWalk(_ sender: AnyObject){
        print("\n performing random walk \n")
        random_walk()
    }
    
    func random_walk(){
        
        for case let ann as UserAnnotation in myMapView.annotations {
            let rand_int1 = (Double(arc4random_uniform(10)) - 5) * 0.0005
            let rand_int2 = (Double(arc4random_uniform(10)) - 5) * 0.0005
  
            
            UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                
            
            //self.myMapView.removeAnnotation(ann)
            
            let curr_lat = ann.coordinate.latitude + rand_int1
            let curr_long = ann.coordinate.longitude + rand_int2
            
            
            
                //DispatchQueue.main.async {
                ann.coordinate = CLLocationCoordinate2D(latitude: curr_lat, longitude: curr_long)
                
             //   self.myMapView.addAnnotation(ann)

            //}
                
                
            }, completion: nil)
            
            
            
            
            print(ann.coordinate.longitude)
            print(ann.coordinate.latitude)
        
        }
        
        
       
        
        
        
        
    }
    

}

