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


class Player:GameObject{

    
    init() {
        super.init(imageString: "plane", initalScale: 2)
        self.zRotation = -.pi / 2

        start()
        reset()
    }
    
    override func start() {
        zPosition = Layer.plane.rawValue
    }
    
    override func update() {
        checkBounds()
    }
    
    override func checkBounds() {

        
        if(position.y <= -320){
            position.y = -320
        }
        
        if(position.y >= 320){
            position.y = 320
        }
         
        
    }
    
    override func reset() {
        position.x = -640
    }
    
    func touchesMove(point:CGPoint) {
        position.y = point.y
        
    }
    

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
