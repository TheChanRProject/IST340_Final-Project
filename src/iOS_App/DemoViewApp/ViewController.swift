//
//  ViewController.swift
//  DemoViewApp
//
//  Created by Rishov Chatterjee on 12/11/18.
//  Copyright © 2018 Rishov Chatterjee. All rights reserved.
//

import UIKit
import ArcGIS

class ViewController: UIViewController {

    @IBOutlet var mv: AGSMapView!
    private var graphicsOverlay:AGSGraphicsOverlay!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMap()
        setupLocationDisplay()
    }
    
    private func setupMap() {
        mv.map = AGSMap(basemapType: .lightGrayCanvasVector, latitude: 34.09668, longitude: -117.71978, levelOfDetail: 10)
        let featureService = URL(string: "https://services.arcgis.com/q3Zg9ERurv23iysr/arcgis/rest/services/claremont_mh/FeatureServer/0")!
        let claremontTable = AGSServiceFeatureTable(url: featureService)
        mv.map!.operationalLayers.add(AGSFeatureLayer(featureTable: claremontTable))
    }
    
    
    func setupLocationDisplay() {
        mv.locationDisplay.autoPanMode = AGSLocationDisplayAutoPanMode.compassNavigation
        mv.locationDisplay.start { [weak self] (error:Error?) -> Void in
            if let error = error {
                self?.showAlert(withStatus: error.localizedDescription)
            }
        }
    }
    
    private func showAlert(withStatus: String) {
        let alertController = UIAlertController(title: "Alert", message:
            withStatus, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default,handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
}

