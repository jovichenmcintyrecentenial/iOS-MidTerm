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


class Cloud:GameObject{

    
    init() {
        super.init(imageString: "cloud", initalScale: 1)
        self.zRotation = -.pi / 2
        start()
        reset()
    }
    
    override func start() {
        zPosition = Layer.cloud.rawValue
        verticalSpeed = 5
        horizontalSpeed = 5
    }
    
    override func checkBounds() {
        if(position.x <= -932){
            reset()
        }
    }
    
    override func update() {
        move()
        checkBounds()
    }
    
    func move(){
        self.position.x -= verticalSpeed!
        self.position.y -= horizontalSpeed!
    }

    override func reset() {
        
        //random vertical speed -5 to 5
        verticalSpeed = CGFloat((randomSource?.nextUniform())! * 5.0 + 5.0)

        //random horizontal speed -2 to 2
        horizontalSpeed = CGFloat((randomSource?.nextUniform())! * 4.0 - 2.0)

        //set alpha
        alpha = 0.5
        
        //get random x position
        let randX:Int = (randomSource?.nextInt(upperBound: 524))!-262
        position.y = CGFloat(randX)

        //get random y position
        let randY:Int = (randomSource?.nextInt(upperBound: 30))!+902
        position.x = CGFloat(randY)

        isColliding = false
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
