//
//  ViewController.swift
//  Project16
//
//  Created by Alexis Orellano on 5/17/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Creates capitals witj coordinates and info about them
        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home to the 2012 Summer Olympics.")
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousand years ago.")
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the City of Light.")
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it.")
        let washington = Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself.")
        
        
        //adds the annotations on the map
        mapView.addAnnotations([london, oslo, paris, rome, washington])
        
        let ac = UIAlertController(title: "How would you like to view the map?", message: nil, preferredStyle: .alert)
        
        let map = UIAlertAction(title: "MapView", style: .cancel)
        let satellite = UIAlertAction(title: "Satellite", style: .default, handler: { _ in
            self.mapView.mapType = .satellite
        })
        let hybrid = UIAlertAction(title: "Hybrid", style: .default, handler: { _ in
            self.mapView.mapType = .hybrid
        })
        
        ac.addAction(map)
        ac.addAction(satellite)
        ac.addAction(hybrid)
        
        present(ac, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is Capital else { return nil }

        let identifier = "Capital"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        
        if annotationView == nil{
            //if the annotation is not a capital it will show a pin
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            //when pin is tapped a callout will be shwon
            annotationView?.canShowCallout = true
            annotationView?.pinTintColor = .purple
            //a button will be showed on the call out
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
        } else {
            annotationView?.annotation = annotation
        }
        
        return annotationView
    }
    
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        //if the detail button is pressed the annotation view will be typecasted as a capital
        guard let capital = view.annotation as? Capital else { return }
        //the name and info of the capital will be saved into constants
        let placeName = capital.title
        let placeInfo = capital.info
        
        //presented on the alert controller
        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
}

