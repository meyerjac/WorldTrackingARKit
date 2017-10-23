//
//  ViewController.swift
//  WorldTRacking
//
//  Created by jackson Meyer on 10/21/17.
//  Copyright © 2017 jackson Meyer. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        
        self.sceneView.session.run(configuration)
    }
    @IBAction func addBox(_ sender: Any) {
        let node = SCNNode()
        node.geometry = SCNBox(width: 0.3, height: 0.3, length: 0.3, chamferRadius: 0.03)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.black
        node.position = SCNVector3(0.6,0.6,0.0)
        self.sceneView.scene.rootNode.addChildNode(node)
    }
    @IBAction func reset(_ sender: Any) {
        self.resetSession()
    }
    
    
    func resetSession() {
        self.sceneView.session.pause()
        self.sceneView.scene.rootNode.enumerateChildNodes{(node, _) in
            node.removeFromParentNode()
        }
        self.sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
}

