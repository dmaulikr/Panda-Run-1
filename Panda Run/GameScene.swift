//
//  GameScene.swift
//  Panda Run
//
//  Created by Mike Choe on 10/19/16.
//  Copyright © 2016 cheezy. All rights reserved.
//

import SpriteKit
import GameplayKit



class GameScene: SKScene {
    
    // properties, not global cuz they're within a class
    var movingGround: MCMovingGround!
    var panda: MCPanda!
    var cloudGenerator: MCCloud!
    
    var isStarted = false
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 159.0/255.0, green: 201.0/255.0, blue: 244.0/255.0, alpha: 1.0)
        
        // Setting custom images
        //let backgroundTexture = SKTexture(imageNamed: "name.jpg")
        //let backgroundImage = SKSpriteNode(texture: backgroundTexture, size: view.frame.size)
        //backgroundImage.position = view.centerAddChild(backgroundImage)
        
        //let ground = SKSpriteNode(color: UIColor.brown, size:CGSize(width: view.frame.size.width, height: 20))
        
        // add ground
        movingGround = MCMovingGround(size: CGSize(width: view.frame.width, height: kMLGroundHeight))
        movingGround.position = CGPoint(x: 0, y: view.frame.size.height/2)
        addChild(movingGround)
        
        // add panda
        panda = MCPanda()
        panda.position = CGPoint(x: 70, y: movingGround.position.y + movingGround.frame.size.height/2 + panda.frame.size.height/2)
        addChild(panda)
        panda.breathe()
        
        // add cloud generator
        cloudGenerator = MCCloud(color: UIColor.clear, size: view.frame.size)
        cloudGenerator.position = view.center
        addChild(cloudGenerator)
        cloudGenerator.populate(num: 7)
        
    }
    
    func start() {
        isStarted = true
        panda.stop()
        panda.startRunning()
        movingGround.start()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //movingGround.start()
        if(!isStarted) {
            start()
        }
        else {
            panda.flip()
        }
    }

    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
