//
//  ObjectsProvider.swift
//  Feed Me
//
//  Created by Michał on 26/05/17.
//  Copyright © 2017 Ron Kliffer. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class ObjectResponse {

static func initialObjects(completion:(ClusteringResponse) -> ()) {
    Alamofire.request(.GET, "http://localhost:5000/coords")
      .responseJSON { response in
        
        if let json = response.result.value {
          
          let clusteringResponse = ClusteringResponse(representation: JSON(json))
          completion(clusteringResponse)
          
        }
    }
}

}


class ClusteringResponse {
    
  let objects: [String: [String]]?
  
    
    init(representation: JSON) {
      

      objects = representation["coords"].dictionaryObject as? [String: [String]]
      print("\(objects)")
      
    }
    
}

