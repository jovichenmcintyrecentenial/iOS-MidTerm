//
//  OceanLandscape.swift
//  MAPD724-W2023-MidTerm-301125059
//
//  Mid-term exam
//
//  Created by Jovi on 05/03/2023.
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

import GameplayKit
import SpriteKit

//landscape version of ocean game object
class OceanLandscape:GameObject{

    
    init() {
        super.init(imageString: "ocean", initalScale: 2)
        self.zRotation = -.pi / 2

        start()
        reset()
    }
    
    override func start() {
        zPosition = Layer.ocean.rawValue
        horizontalSpeed = 5
    }
    
    override func update() {
        move()
        checkBounds()
    }
    
    override func checkBounds() {
        if(position.x <= -2253){
            reset()
        }
    }
    
    override func reset() {
        position.x = 2253
    }
    
    func move(){
        self.position.x -= horizontalSpeed!
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
