//
//  OceanLandscape.swift
//  MAPD724-W2023-MidTerm-301125059
//
//  Created by Jovi on 04/03/2023.
//

import GameplayKit
import SpriteKit


class OceanLandscape:GameObject{

    
    init() {
        super.init(imageString: "ocean", initalScale: 2)
        self.zRotation = -.pi / 2

        start()
        reset()
    }
    
    override func start() {
        zPosition = Layer.ocean.rawValue
        verticalSpeed = 5
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
        self.position.x -= verticalSpeed!
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
