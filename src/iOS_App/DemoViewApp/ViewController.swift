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
        createGraphics() 
    }
    
    private func setupMap() {
        mv.map = AGSMap(basemapType: .lightGrayCanvasVector, latitude: 34.09042, longitude: -118.71511, levelOfDetail: 10)
    }
    
    private func createGraphicsOverlay() {
        graphicsOverlay = AGSGraphicsOverlay()
        self.mv.graphicsOverlays.add(graphicsOverlay)
    }
    
    private func createPointGraphics() {
        let point = AGSPoint(x: -118.69333917997633, y: 34.032793670122885, spatialReference: AGSSpatialReference.wgs84())
        let pointSymbol = AGSSimpleMarkerSymbol(style: .circle, color: .orange, size: 10.0)
        pointSymbol.outline = AGSSimpleLineSymbol(style: .solid, color: .blue, width: 2.0)
        let pointGraphic = AGSGraphic(geometry: point, symbol: pointSymbol, attributes: nil)
        graphicsOverlay.graphics.add(pointGraphic)
    }
    
    private func createPolylineGraphics() {
        let polyline = AGSPolyline(points: [
            AGSPoint(x: -118.67999016098526, y: 34.035828839974684, spatialReference: AGSSpatialReference.wgs84()),
            AGSPoint(x: -118.65702911071331, y: 34.07649252525452, spatialReference: AGSSpatialReference.wgs84())
            ])
        let polylineSymbol = AGSSimpleLineSymbol(style: .solid, color: .blue, width: 3.0)
        let polylineGraphic = AGSGraphic(geometry: polyline, symbol: polylineSymbol, attributes: nil)
        graphicsOverlay.graphics.add(polylineGraphic)
    }
    
    private func createPolygonGraphics() {
        let polygon = AGSPolygon(points: [
            AGSPoint(x: -118.70372100524446, y: 34.03519536420519, spatialReference: .wgs84()),
            AGSPoint(x: -118.71766916267414, y: 34.03505116445459, spatialReference: .wgs84()),
            AGSPoint(x: -118.71923322580597, y: 34.04919407570509, spatialReference: .wgs84()),
            AGSPoint(x: -118.71631129436038, y: 34.04915962906471, spatialReference: .wgs84()),
            AGSPoint(x: -118.71526020370266, y: 34.059921300916244, spatialReference: .wgs84()),
            AGSPoint(x: -118.71153226844807, y: 34.06035488360282, spatialReference: .wgs84()),
            AGSPoint(x: -118.70803735010169, y: 34.05014385296186, spatialReference: .wgs84()),
            AGSPoint(x: -118.69877903513455, y: 34.045182336992816, spatialReference: .wgs84()),
            AGSPoint(x: -118.6979656552508, y: 34.040267760924316, spatialReference: .wgs84()),
            AGSPoint(x: -118.70259112469694, y: 34.038800278306674, spatialReference: .wgs84()),
            AGSPoint(x: -118.70372100524446, y: 34.03519536420519, spatialReference: .wgs84())
            ])
        let polygonOutlineSymbol = AGSSimpleLineSymbol(style: .solid, color: .blue, width: 2.0)
        let polygonSymbol = AGSSimpleFillSymbol(style: .solid, color: .orange, outline: polygonOutlineSymbol)
        let polygonGraphic = AGSGraphic(geometry: polygon, symbol: polygonSymbol, attributes: nil)
        graphicsOverlay.graphics.add(polygonGraphic)
    }
    
    private func createGraphics() {
        createGraphicsOverlay()
        createPointGraphics()
        createPolylineGraphics()
        createPolygonGraphics()
    }


}

