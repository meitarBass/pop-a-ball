import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var titleLabel: SKLabelNode!
    var spheres = [Ball]()
    var lastTouchPosition: CGPoint?
    
    let correctBallIndex = 0
    var needUpdateLabels = true
    
    var scoreLabel: SKLabelNode!
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    override func didMove(to view: SKView) {
        createWorld()
    }
    
    func createWorld() {
        addBackground()
        addTitleLabel()
        addSpheres()
        addScoreLabel()
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
    
    func addScoreLabel() {
        scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        scoreLabel.text = "Poppy Sphere"
        scoreLabel.position = CGPoint(x: 160, y: 72)
        scoreLabel.zPosition = 3
        addChild(scoreLabel)
    }
    
    func addSpheres() {
        for i in 1...3 {
            let ball = Ball(color: .clear, size: CGSize(width: 120, height: 120))
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
        
        if current == actual {
            // correct
        } else {
            // false
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let location = touch.location(in: self)
        
        for sphere in spheres {
            print("\(String(describing: sphere.name))")
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
        }
        
        if spheres[0].position.x > 1300 {
            needUpdateLabels = true
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
