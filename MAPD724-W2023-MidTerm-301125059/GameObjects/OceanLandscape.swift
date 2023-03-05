//
//  Ocean-landscape.swift
//  MAPD724-W2023-MidTerm-301125059
//
//  Created by Jovi on 04/03/2023.
//

import Foundation

class OceanLandScape:GameObject{

    
    init() {
        super.init(imageString: "ocean-h", initalScale: 2)
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
        if(position.y <= -2253){
            reset()
        }
    }
    
    override func reset() {
        position.y = 2253
    }
    
    func move(){
        self.position.y -= verticalSpeed!
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
