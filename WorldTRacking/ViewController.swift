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
        self.sceneView.autoenablesDefaultLighting = true
    }
    
    @IBAction func addBox(_ sender: Any) {
        let boxNode = SCNNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.00))
        let doorNode = SCNNode(geometry: SCNPlane(width: 0.03, height: 0.06))
        let node = SCNNode()
//        let path = UIBezierPath()
//        node.geometry = SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0.03)
//        node.geometry = SCNCapsule(capRadius: 0.1, height: 0.3)
//        node.geometry = SCNCone(topRadius: 0.0, bottomRadius: 0.3, height: 0.5)
//        node.geometry = SCNSphere(radius: 0.2)
//        node.geometry = SCNPlane(width: 1.0, height: 1.0)
//        path.move(to: CGPoint(x: 0.0, y: 0.0))
//        path.addLine(to: CGPoint(x:0.0, y: 0.1))
//        path.addLine(to: CGPoint(x:0.2, y: 0.2))
//        path.addLine(to: CGPoint(x: 0.4, y: 0.1))
//        path.addLine(to: CGPoint(x: 0.4, y: 0.0))
//        let shape = SCNShape(path: path, extrusionDepth: 0.2)
//        node.geometry = shape
        node.geometry = SCNPyramid(width: 0.1, height: 0.1, length: 0.1)
        node.geometry?.firstMaterial?.specular.contents = UIColor.white
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        
        boxNode.geometry?.firstMaterial?.specular.contents = UIColor.orange
        boxNode.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        
        doorNode.geometry?.firstMaterial?.specular.contents = UIColor.white
        doorNode.geometry?.firstMaterial?.diffuse.contents = UIColor.green
       
//        let x = randomNumbers(firstNum: -0.3, secondNum: 0.3)
//        let y = randomNumbers(firstNum: -0.3, secondNum: 0.3)
//        let z = randomNumbers(firstNum: -0.3, secondNum: 0.3)
        node.position = SCNVector3(0.2,0.3,-0.2)
        boxNode.position = SCNVector3(0, -0.05, 0)
        doorNode.position = SCNVector3(0, -0.07, 0.052)
        self.sceneView.scene.rootNode.addChildNode(node)
        node.addChildNode(boxNode)
        node.addChildNode(doorNode)
//        self.sceneView.scene.rootNode.addChildNode(cylinderNode)
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
    
    func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
}

