import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var titleLabel: SKLabelNode!
    var spheres = [Ball]()
    var lastTouchPosition: CGPoint?
    
    let correctBallIndex = 0
    var needUpdateLabels = true
    var userClickedThisTurn = false
    
    var scoreLabel: SKLabelNode!
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
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
    
    func addSpheres() {
        for i in 1...3 {
            let ball = Ball(color: .clear, size: CGSize(width: 100, height: 100))
            ball.position = CGPoint(x: 100, y: 700 - 175 * i)
            ball.setup(text: "Ball\(i)")
            ball.name = "ball\(i)"
            addChild(ball)
            
            spheres.append(ball)
        }
    }
    
    func poppySphere(sphere: Ball) {
        guard let current = sphere.currentText else { return }
        guard let actual = sphere.actualColor else { return }
        
        if !userClickedThisTurn {
            if current == actual {
                // correct
                score += 1
                
                // TODO: Change it to some shrinking animation
                sphere.isHidden = true
            } else {
                // false
                heartsLeft -= 1
            }
            userClickedThisTurn = true
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let location = touch.location(in: self)
        
        for sphere in spheres {
            if sphere.frame.contains(location) {
                poppySphere(sphere: sphere)
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
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
                sphere.updateBall()
            }
            
            if !userClickedThisTurn {
                heartsLeft -= 1
            }
            needUpdateLabels = true
        }
        
        if heartsLeft == 0 {
            // TODO: Game over + start new game?
        }
    }
    
    func getRandomWrongText(_ currentText: String) -> String {
        var str = ""
        repeat {
            str = getRandomColor().1
        } while str == currentText
        return str
    }
}
