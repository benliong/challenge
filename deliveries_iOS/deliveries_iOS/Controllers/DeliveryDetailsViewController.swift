//
//  DeliveryDetailsViewController.swift
//  deliveries_iOS
//
//  Created by XCodeClub on 2017-05-24.
//  Copyright © 2017 Ben Liong. All rights reserved.
//

import UIKit
import GoogleMaps
import SnapKit

class DeliveryDetailsViewController: UIViewController {
    var delivery:Delivery?
    var mapView:GMSMapView?
    var marker = GMSMarker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view.addSubview(mapView)
        mapView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        self.mapView = mapView
        reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    convenience init(delivery:Delivery) {
        self.init()
        self.delivery = delivery
    }
    
    func reloadData() {
        marker.map = nil
        guard let coordinate = delivery?.coordinate else {
            return
        }
        
        marker.position = coordinate
        marker.title = delivery?.details
        marker.snippet = delivery?.location?.address
        marker.map = mapView
        mapView?.camera = GMSCameraPosition.camera(withLatitude: coordinate.latitude, longitude: coordinate.longitude, zoom: 15.0)

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
