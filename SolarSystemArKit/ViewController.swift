//
//  ViewController.swift
//  SolarSystemArKit
//
//  Created by Atil Samancioglu on 18.08.2019.
//  Copyright © 2019 Atil Samancioglu. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        //let myBox = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01) -> bir kutu oluşturmak istedik. genişlik uzunluk ve yüksekliğe 100 cm dedik. chamferRadius burada yarıçapı istiyor çünkü sadece dörtgen bir box değil altıgen bir poligon vs de oluşturulabiliyor. 0.01 dedik küp oluşturmak için
        
        //let mySphere = createSphere(radius: 0.1, content: "wall.png", vector: SCNVector3(0, 0.2, -1)) -> box ın içinde neler olucağını söylüyoruz. yarıçapı 0.1
        
        let world = createSphere(radius: 0.1, content: "world.png", vector: SCNVector3(0, 0.2, -1))
        
        let mars = createSphere(radius: 0.2, content: "mars.png", vector: SCNVector3(0.5, 0.2, -1))
        
        let venus = createSphere(radius: 0.15, content: "venus.png", vector: SCNVector3(1, 0.2, -1))
        
        sceneView.scene.rootNode.addChildNode(world) // dünyayı ekliyoruz
        sceneView.scene.rootNode.addChildNode(mars)
        sceneView.scene.rootNode.addChildNode(venus)

        
        sceneView.automaticallyUpdatesLighting = true // bunu yaparsak objeleri 3 boyutlu göstermek daha kolay olur. ışığı kendisi ayarlıyor daha iyi gözüküyor
        
        
    }
    
    func createSphere(radius: CGFloat, content:String, vector:SCNVector3) -> SCNNode{
            
        let mySphere = SCNSphere(radius: radius) // materyali küreye çevir. radius ile yarıçapı veriyoruz
            
            let boxMaterial = SCNMaterial()
            
            boxMaterial.diffuse.contents = UIImage(named: "art.scnassets/\(content)") // diffuse.contents ile içeriğini değiştirebiliyoruz. içeriği bir UIImage olucak dedik
            
            mySphere.materials = [boxMaterial] // bu geometrinin görünümünü ortaya çıkaran bir SCNMaterial dizisi istiyor bizden
            
            let node = SCNNode() // node u oluşturuyoruz
            
            node.position = vector // nerde gösterileceğini söylüyoruz
            
            node.geometry = mySphere // oluşturduğumuz box ı şekil olarak veriyoruz
        
        return node
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
