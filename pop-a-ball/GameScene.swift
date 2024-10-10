import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var titleLabel: SKLabelNode!
    var spheres = [Sphere]()
    var lastTouchPosition: CGPoint?
    
    let correctSphereIndex = 0
    var needUpdateLabels = true
    var userClickedThisTurn = false
    
    var scoreLabel: SKLabelNode!
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    var gameOverLabel: SKLabelNode!
    var playAgainButton: CustomButton!
    var isGameOver = false
    
    var heartsLabel: SKLabelNode!
    var heartsLeft = 3 {
        didSet {
            if heartsLeft == 3 {
                heartsLabel.text = "❤️❤️❤️"
            } else if heartsLeft == 2 {
                heartsLabel.text = "❤️❤️💔"
            } else if heartsLeft == 1 {
                heartsLabel.text = "❤️💔💔"
            } else {
                heartsLabel.text = "💔💔💔"
            }
        }
    }
    
    override func didMove(to view: SKView) {
        createWorld()
    }
    
    func createWorld() {
        addBackground()
        addTitleLabel()
        addSpheres()
        addLabels()
        addGameOverAssets()
    }
    
    func addTitleLabel() {
        titleLabel = SKLabelNode(fontNamed: "Chalkduster")
        titleLabel.text = "Poppy Sphere"
        titleLabel.horizontalAlignmentMode = .center
        titleLabel.position = CGPoint(x: 512, y: 672)
        titleLabel.zPosition = 3
        titleLabel.fontColor = .black
        titleLabel.fontSize = 40
        addChild(titleLabel)
    }
    
    func addBackground() {
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 526, y: 394)
        background.blendMode = .replace
        background.zPosition = -1
        background.name = "background"
        
        addChild(background)
    }
    
    func addLabels() {
        scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        scoreLabel.text = "Score: 0"
        scoreLabel.position = CGPoint(x: 136, y: 64)
        scoreLabel.zPosition = 3
        addChild(scoreLabel)
        
        heartsLabel = SKLabelNode(fontNamed: "Chalkduster")
        heartsLabel.text = ""
        heartsLabel.position = CGPoint(x: 940, y: 64)
        heartsLabel.zPosition = 3
        addChild(heartsLabel)
        
        heartsLeft = 3
    }
    
    func addGameOverAssets() {
        gameOverLabel = SKLabelNode(fontNamed: "Chalkduster")
        gameOverLabel.text = "Game Over"
        gameOverLabel.fontSize = 100
        gameOverLabel.position = CGPoint(x: 512, y: 384)
        gameOverLabel.zPosition = 4
        addChild(gameOverLabel)
                
        
        let buttonSize = CGSize(width: 200, height: 50)
        playAgainButton = CustomButton(size: buttonSize, cornerRadius: 10, fillColor: .clear, strokeColor: .black, fontSize: 24, fontColor: .white)
        playAgainButton.name = "playAgainbutton"
        playAgainButton.position = CGPoint(x: 512, y: 320)
        addChild(playAgainButton)
        
        gameOverLabel.isHidden = true
        playAgainButton.isHidden = true
    }
    
    func addSpheres() {
        for i in 1...3 {
            let sphere = Sphere(color: .clear, size: CGSize(width: 110, height: 110))
            sphere.position = CGPoint(x: 100, y: 700 - 175 * i)
            sphere.setup(text: "Sphere\(i)")
            sphere.name = "sphere\(i)"
            addChild(sphere)
            
            spheres.append(sphere)
        }
    }
    
    func poppySphere(sphere: Sphere) {
        guard let current = sphere.currentText else { return }
        guard let actual = sphere.actualColor else { return }
        
        if !userClickedThisTurn {
            if current == actual {
                score += 1
            } else {
                heartsLeft -= 1
            }
            sphere.animateSphereTapped()
            userClickedThisTurn = true
        }
    }

    func showGameOverAssets() {
        gameOverLabel.isHidden = false
        playAgainButton.isHidden = false
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let location = touch.location(in: self)
        
        for sphere in spheres {
            if sphere.frame.contains(location) {
                poppySphere(sphere: sphere)
            }
        }
        
        guard let name = atPoint(location).name else { return }
        if  (name == "buttonLabel" || name == "playAgainbutton") && playAgainButton.isHidden == false {
            resetGameButtonTapped()
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if !isGameOver {
            if needUpdateLabels {
                spheres.shuffle()
                spheres[1].updateTextWith(text: getRandomWrongText(spheres[1].currentText))
                spheres[2].updateTextWith(text: getRandomWrongText(spheres[2].currentText))
                needUpdateLabels = false
                userClickedThisTurn = false
            }
            
            if spheres[0].position.x > 1300 {
                for sphere in spheres {
                    sphere.position.x = -100
                    sphere.updateSphere()
                    sphere.alpha = 1
                }
                
                if !userClickedThisTurn {
                    heartsLeft -= 1
                }
                needUpdateLabels = true
            }
            
            if heartsLeft == 0 {
                showGameOverAssets()
                isGameOver = true
                for sphere in spheres {
                    sphere.removeAllActions()
                    sphere.removeFromParent()
                }
            }
        }
    }
    
    func getRandomWrongText(_ currentText: String) -> String {
        var str = ""
        repeat {
            str = getRandomColor().1
        } while str == currentText
        return str
    }
    
    func resetGameButtonTapped() {
        score = 0
        heartsLeft = 3
        gameOverLabel.isHidden = true
        playAgainButton.isHidden = true
        userClickedThisTurn = false
        isGameOver = false
        needUpdateLabels = false
        
        for sphere in spheres {
            sphere.totalMovementDuration = 0.4
            self.addChild(sphere)
            sphere.moveSphere()
            sphere.position.x = -100
            sphere.alpha = 1
        }
    }
}
