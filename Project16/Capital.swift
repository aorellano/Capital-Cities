//
//  Capital.swift
//  Project16
//
//  Created by Alexis Orellano on 5/17/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import UIKit
import MapKit

class Capital: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    
    //There are three properties with basic initializers that just copies in the data
    //its given we use self here because the parameters being passed in are the same
    //name as our properties.
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String){
        self.title = title
        self.coordinate = coordinate
        self.info = info
    }

}
