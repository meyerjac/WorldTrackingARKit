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
    
    //three types of rotation = roll: x axis, pitch: y axis , ya: z axis
    
    @IBAction func addBox(_ sender: Any) {
//        let boxNode = SCNNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.00))
//        let doorNode = SCNNode(geometry: SCNPlane(width: 0.03, height: 0.06))
//        let node = SCNNode()
//        node.geometry = SCNPyramid(width: 0.1, height: 0.1, length: 0.1)
//        node.geometry?.firstMaterial?.specular.contents = UIColor.white
//        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
//        boxNode.geometry?.firstMaterial?.specular.contents = UIColor.orange
//        boxNode.geometry?.firstMaterial?.diffuse.contents = UIColor.red
//        doorNode.geometry?.firstMaterial?.specular.contents = UIColor.white
//        doorNode.geometry?.firstMaterial?.diffuse.contents = UIColor.green
//        node.position = SCNVector3(0.2,0.3,-0.2)
//        boxNode.position = SCNVector3(0, -0.05, 0)
//        doorNode.position = SCNVector3(0, -0.07, 0.052)
//        self.sceneView.scene.rootNode.addChildNode(node)
//        node.addChildNode(boxNode)
//        node.addChildNode(doorNode)
        
        let node = SCNNode(geometry: SCNPlane(width: 0.2, height: 0.2))
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        node.position = SCNVector3(0, 0, -0.3)
        node.eulerAngles = SCNVector3(Float(90.degreesToRadians), 0, 0)
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
    
    func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
}

extension Int {
    
    var degreesToRadians: Double { return Double(self) * .pi/180 }
}

