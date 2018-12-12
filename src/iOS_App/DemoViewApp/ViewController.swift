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
    }
    
    private func setupMap() {
        mv.map = AGSMap(basemapType: .lightGrayCanvasVector, latitude: 34.09042, longitude: -118.71511, levelOfDetail: 10)
        let featureService = URL(string: "https://services.arcgis.com/q3Zg9ERurv23iysr/arcgis/rest/services/claremont_mh/FeatureServer/0")!
        let claremontTable = AGSServiceFeatureTable(url: featureService)
        mv.map!.operationalLayers.add(AGSFeatureLayer(featureTable: claremontTable))
    }
    
    
}

