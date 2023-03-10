//
//  GameScene.swift
//  MAPD724-W2023-ICE-4B
//
//  Created by Jovi on 08/02/2023.
//
//
//  Mid-term exam
//
//  NAME:
//  Jovi Chen-Mcintyre - 301125059
//
//  DESCRIPTION:
//  Simple game to deliver mail package to islands while dodging clouds
//
//  REVISION HISTORY:
//  https://github.com/jovichenmcintyrecentenial/iOS-MidTerm/commits/main
//
//  DATE LAST MODIFIED:
//  March 5, 2023

import SpriteKit
import GameplayKit
import AVFoundation
import UIKit

let screenSize = UIScreen.main.bounds
var screenWidth:CGFloat?
var screenHeight:CGFloat?

class GameScene: SKScene {
    
    var ocean1:OceanLandscape?
    var ocean2:OceanLandscape?
    var island:Island?
    var clouds:[Cloud] = []

    var plane:Player?
    
    override func sceneDidLoad() {
        
        screenWidth = frame.width
        screenHeight = frame.height

        name = "GAME"
    

        //add ocean
        ocean1 = OceanLandscape()
        ocean2 = OceanLandscape()
        ocean2?.position.x = -627
        addChild(ocean1!)
        addChild(ocean2!)

        //add plan
        plane = Player()
        addChild(plane!)
        
        //add island
        island = Island()
        addChild(island!)
        
        
        //add 2 clouds
        for _ in 0...1 {
            let cloud = Cloud()
            clouds.append(cloud)
            addChild(cloud)
        }
        
        //play engine sound
        let engineSound = SKAudioNode(fileNamed: "engine.mp3")
        addChild(engineSound)
        engineSound.autoplayLooped = true
        engineSound.run(SKAction.changeVolume(by: 0.5, duration: 0))
         //prewarm sounds
        do{
            let sounds:[String] = ["thunder","yay"]
            for sound in sounds{

                let path:String? = Bundle.main.path(forResource: sound, ofType: "mp3")

                if(path != nil){
                    
                    let url:URL = URL(fileURLWithPath: path!)
                    let avPlayer:AVAudioPlayer = try AVAudioPlayer(contentsOf: url)
                    
                    avPlayer.prepareToPlay()
                    avPlayer.setVolume(0.5, fadeDuration: 0)
                }
            }
        }
        catch{

        }


    }
    
    
    func touchDown(atPoint pos : CGPoint) {
       print("Touch Down")
        plane!.touchesMove(point: pos)

    }
    
    func touchMoved(toPoint pos : CGPoint) {
        print("Touch Moved")
        plane!.touchesMove(point: pos)

    }
    
    func touchUp(atPoint pos : CGPoint) {
        print("Touch Up")

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
        
        ocean1?.update()
        ocean2?.update()
        plane?.update()
        island?.update()
        
        CollisionManager.sqauredRadisCheck(scene:self, obj1: plane!, obj2: island!)
        //cloud update and collision detection
        for cloud in clouds {
            cloud.update()
            CollisionManager.sqauredRadisCheck(scene:self, obj1: plane!, obj2: cloud)
        }
        

    }
}


