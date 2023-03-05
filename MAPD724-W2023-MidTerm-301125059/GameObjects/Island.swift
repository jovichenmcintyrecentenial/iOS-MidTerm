import GameplayKit
import SpriteKit


class Island:GameObject{

    
    init() {
        super.init(imageString: "island", initalScale: 2)
        self.zRotation = -.pi / 2

        start()
        reset()
    }
    
    override func start() {
        zPosition = Layer.island.rawValue
        horizontalSpeed = 5
    }
    
    override func checkBounds() {
        if(position.x <= -876){
            reset()

        }
    }
    
    override func update() {
        move()
        checkBounds()
    }
    
    func move(){
        self.position.x -= horizontalSpeed!
    }
    

    override func reset() {
        position.x = 876
        let randX:Int = (randomSource?.nextInt(upperBound: 626))!-313
        position.y = CGFloat(randX)
        isColliding = false
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
