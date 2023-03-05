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


class Ocean:GameObject{

    
    init() {
        super.init(imageString: "ocean", initalScale: 2)
        
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
