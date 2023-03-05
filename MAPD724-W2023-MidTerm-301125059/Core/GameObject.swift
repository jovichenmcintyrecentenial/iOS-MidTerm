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


class GameObject : SKSpriteNode,GameObjectProtocol {
    
    //Life cycle
    func reset() {
            
    }
    
    func start() {
        
    }
    
    func update() {
        
    }
    
    func checkBounds() {
        
    }
    
    
    //public instance
    var horizontalSpeed:CGFloat?
    var verticalSpeed:CGFloat?
    var width:CGFloat?
    var height:CGFloat?
    var halfHeight:CGFloat?
    var halfWidth:CGFloat?
    var scale:CGFloat?
    var isColliding:Bool?
    var randomSource:GKARC4RandomSource?
    var randomDist:GKRandomDistribution?
    
    //constructor
    
    init(imageString:String,initalScale:CGFloat){
        
        //init game image
        let texture = SKTexture(imageNamed: imageString)
        let color = UIColor.clear
        super.init(texture: texture, color: color, size: texture.size())
        
        //config
        scale = initalScale
        setScale(scale!)
        width = texture.size().width*scale!
        height = texture.size().height*scale!
        halfHeight = height! * 0.5
        halfWidth = width! * 0.5
        isColliding = false
        name = imageString
        randomSource = GKARC4RandomSource()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


}
