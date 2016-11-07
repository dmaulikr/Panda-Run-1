//
//  MCCloud.swift
//  Panda Run
//
//  Created by Mike Choe on 10/20/16.
//  Copyright © 2016 cheezy. All rights reserved.
//

import Foundation

import SpriteKit

class MCCloud: SKSpriteNode {
    
    let CLOUD_WIDTH: CGFloat = 125.0
    let CLOUD_HEIGHT: CGFloat = 55.0
    
    
    func populate(num: Int) {
        for i in 0 ..< num {
            let cloud = MCCloudMain(size: CGSize(width: CLOUD_WIDTH, height: CLOUD_HEIGHT))
            let x = CGFloat(arc4random_uniform(UInt32(size.width))) - size.width/2
            let y = CGFloat(arc4random_uniform(UInt32(size.height))) - size.height/2
            
            cloud.position = CGPoint(x: x, y: y)
            addChild(cloud)
        }
    }
}
