//
//  SwiftMapViewController.swift
//  Blood Brother
//
//  Created by Rohan Sinha on 14/07/15.
//  Copyright (c) 2015 Rohan Sinha. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

class SwiftMapViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let camera = GMSCameraPosition.cameraWithLatitude(-33.86,
			longitude: 151.20, zoom: 6)
		let mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
		mapView.myLocationEnabled = true
		self.view = mapView
		
		let marker = GMSMarker()
		marker.position = CLLocationCoordinate2DMake(-33.86, 151.20)
		marker.title = "Sydney"
		marker.snippet = "Australia"
		marker.map = mapView
	}
}
