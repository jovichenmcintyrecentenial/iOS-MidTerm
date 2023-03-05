//
//  GameViewController.swift
//  MAPD724-W2023-MidTerm-301125059
//
//  Created by Jovi on 04/03/2023.
//

import UIKit
import SpriteKit
import GameplayKit

class Orientation{
    static var isPortrait = true
    static var current: UIInterfaceOrientationMask {
        return isPortrait ? .portrait : .landscape
    }
    
    static func toggle(){
        isPortrait = !isPortrait
    }
}

class GameViewController: UIViewController {
    
    var currentScene:GKScene?
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var liveLabel: UILabel!
    
    @IBOutlet weak var endLabel: UILabel!
    @IBOutlet weak var startLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var endButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentStartScene()
        //init
        CollisionManager.gameViewController = self;



    }
    
    func updateLivesLabel(){
        liveLabel.text = "Live: \(ScoreManager.lives)"
    }
    
    func updateScoreLabel(){
        scoreLabel.text = "Score: \(ScoreManager.score)"

    }
    


    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func setScene(sceneName:String) {
        
        currentScene = GKScene(fileNamed: sceneName)
        
        if let scene = currentScene!.rootNode as! SKScene? {
            
            scene.scaleMode = .aspectFill
            
            if let view = self.view as! SKView? {
                view.presentScene(scene)
                view.ignoresSiblingOrder = true
            }
        }
        
    }
    
    func presentStartScene(){
        scoreLabel.isHidden = true
        liveLabel.isHidden = true
        
        endLabel.isHidden = true
        endButton.isHidden = true
        
        startLabel.isHidden = false
        startButton.isHidden = false
        
        setScene(sceneName: "StartScene")
    }
    
    func presentEndScene(){
        triggerRotation()

        scoreLabel.isHidden = true
        liveLabel.isHidden = true
        
        endLabel.isHidden = false
        endButton.isHidden = false
        
        
        startLabel.isHidden = true
        startButton.isHidden = true
        
        setScene(sceneName: "EndScene")
        
    }
    
    func presentGameScene(){
        triggerRotation()

        endLabel.isHidden = true
        endButton.isHidden = true
        
        scoreLabel.isHidden = false
        liveLabel.isHidden = false
        
        startLabel.isHidden = true
        startButton.isHidden = true
        
        setScene(sceneName: "GameScene")
        
        ScoreManager.score = 0
        ScoreManager.lives = 5
        updateLivesLabel()
        updateScoreLabel()
    }

    @IBAction func startButtonPressEvent(_ sender: Any) {
        presentGameScene()
    }
    
    private func triggerRotation(){
        DispatchQueue.main.async { [self] in
            Orientation.toggle()
                let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations: Orientation.isPortrait ? .landscapeRight : .portrait))
                UIView.performWithoutAnimation {
                   if #available(iOS 16.0, *) {
                       self.setNeedsUpdateOfSupportedInterfaceOrientations()
                   }
                }
            }
    }
    
    @IBAction func endButtonPressEvent(_ sender: Any) {
        presentGameScene()
    }
    
    override public var shouldAutorotate: Bool {
      return false
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return Orientation.current
        } else {
            return .all
        }
    }
}
