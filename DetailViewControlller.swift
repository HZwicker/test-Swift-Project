//
//  DetailViewControlller.swift
//  Projeto Final GADS T2
//
//  Created by Henrique on 9/23/16.
//  Copyright © 2016 Henrique.Zwicker. All rights reserved.
//
import UIKit
import MapKit
import CoreLocation

class DetailViewController: UIViewController , CLLocationManagerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var lblEndereco: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    var dicPlace:NSDictionary?
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
        if dicPlace != nil {
            imageView.image = UIImage(named: dicPlace!["image"] as! String)
            lblName.text = dicPlace!["name"] as? String
            lblEndereco.text = dicPlace!["address"] as? String
            
            ActionGeocoder()
            
        }
        
    }
    
    func ActionGeocoder() {
        
        let geoCoder = CLGeocoder ()
        geoCoder.geocodeAddressString(lblEndereco.text!) { (placemarks, error) -> Void in
            if let placemark:CLPlacemark = placemarks?[0]{
                let location = placemark.location
                
                if let coords:CLLocationCoordinate2D = location?.coordinate {
                    print("Latitude = \(coords.latitude) , Longitude = \(coords.longitude)")
                    
                    let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
                    let region = MKCoordinateRegion(center: coords, span: span)
                    self.mapView.setRegion(region, animated: false)
                    
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = coords
                    annotation.title = self.dicPlace!["name"] as? String
                    annotation.subtitle = self.dicPlace!["address"] as? String
                    self.mapView.addAnnotation(annotation)
                }
            }
            else{
                print("Geocode falhou. Deu error")
            }
        }
    }
}
    