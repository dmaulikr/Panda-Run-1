//
//  MCCloudMain.swift
//  Panda Run
//
//  Created by Mike Choe on 10/20/16.
//  Copyright © 2016 cheezy. All rights reserved.
//

import Foundation
import SpriteKit

//Shape Node can be used to create specific shape
class MCCloudMain: SKShapeNode {
    
    init(size: CGSize) {
        super.init()
        let path = CGPath(ellipseIn: CGRect(x: 0, y: 0, width: size.width, height: size.height), transform: nil)
        self.path = path
        fillColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Init(coder) has not been implemetned")
    }
}
