import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var titleLabel: SKLabelNode!
    
    var balls = [Ball]()
    
    override func didMove(to view: SKView) {
        createWorld()
    }
    
    func createWorld() {
        addBackground()
        addTitleLabel()
        addBalls()
    }
    
    func addTitleLabel() {
        titleLabel = SKLabelNode(fontNamed: "Chalkduster")
        titleLabel.text = "Pop-A-Ball"
        titleLabel.horizontalAlignmentMode = .center
        titleLabel.position = CGPoint(x: 512, y: 672) // Adjust this if needed
        titleLabel.zPosition = 3
        titleLabel.fontColor = .white
        titleLabel.fontSize = 40 // Increase font size for 
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
    
    func addBalls() {
        for i in 1...3 {
            let ball = Ball(color: .clear, size: CGSize(width: 120, height: 120))
            ball.position = CGPoint(x: 100, y: 700 - 150 * i)
            ball.setup(text: "Ball\(i)")
            addChild(ball)
            
            balls.append(Ball())
        }
    }
}
