//
//  GameViewController.swift
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

import UIKit
import SpriteKit
import GameplayKit


//class to manage orientation state
class Orientation{
    static var isPortrait = true
    //getter to figure which orientation is currently toggled to based on boolean
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
    
    //present Start scene
    func presentStartScene(){
        scoreLabel.isHidden = true
        liveLabel.isHidden = true
        
        endLabel.isHidden = true
        endButton.isHidden = true
        
        startLabel.isHidden = false
        startButton.isHidden = false
        
        setScene(sceneName: "StartScene")
    }
    
    //present End scene
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
    
    //present Game scene
    func presentGameScene(){
        //toogle oritentation change in
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
    
    //trigger to toggle between portriat and landscape without animation
    private func triggerRotation(){
        DispatchQueue.main.async { [self] in
            
            //toggle isPortriat boolean
            Orientation.toggle()
            
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations: Orientation.isPortrait ? .landscapeRight : .portrait))
            
                // let iOS know that it should not animate when changing orientation
                UIView.performWithoutAnimation {
                   if #available(iOS 16.0, *) {
                       //tell os to update because orientation changed
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

    //when orientation change force it to stick to that orientantion
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return Orientation.current
        } else {
            return .all
        }
    }
}
