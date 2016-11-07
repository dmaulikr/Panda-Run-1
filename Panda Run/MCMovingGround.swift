//
//  MCMovingGround.swift
//  Panda Run
//
//  Created by Mike Choe on 10/19/16.
//  Copyright © 2016 cheezy. All rights reserved.
//

import Foundation
import SpriteKit

// MCMovingGround is a SKSpriteNode with specialized behavior (a subclass)
class MCMovingGround: SKSpriteNode {
    
    let NUMBER_OF_SEGMENTS = 20
    
    let COLOR_ONE = UIColor(red: 88.0/255.0, green: 148.0/255.0, blue: 87.0/255.0, alpha: 1.0)
    let COLOR_TWO = UIColor(red: 120.0/255.0, green: 195.0/255.0, blue: 110.0/255.0, alpha: 1.0)
    
    // Creating initalizer for ground class
    init(size: CGSize) {
        super.init(texture: nil, color: UIColor.brown, size: CGSize(width: size.width*2, height: size.height))
        
        //Place where the block is positioned on
        anchorPoint = CGPoint(x: 0, y: 0.5)
        
        for i in 0 ..< NUMBER_OF_SEGMENTS {
            
            var segmentColor: UIColor!
            if i % 2 == 0 {
                segmentColor = COLOR_ONE
            } else {
                segmentColor = COLOR_TWO
            }
            
            let segment = SKSpriteNode(color: segmentColor, size: CGSize(width: self.size.width / CGFloat(NUMBER_OF_SEGMENTS), height: self.size.height))
            
            segment.anchorPoint = CGPoint(x: 0.0, y: 0.5)
            
            segment.position = CGPoint(x: CGFloat(i)*segment.size.width, y: 0)
            
            addChild(segment)
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Init(coder:) has not been implemented")
    }
    
    func start() {
        
        let moveLeft = SKAction.moveBy(x: -frame.size.width/2, y: 0, duration: 1.0)
        let resetPosition = SKAction.moveTo(x: 0, duration: 0)
        let moveSequence = SKAction.sequence([moveLeft, resetPosition])
        
        run(SKAction.repeatForever(moveSequence))
        }
}
