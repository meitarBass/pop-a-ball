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
        titleLabel.zPosition = 2
        titleLabel.fontColor = .orange
        titleLabel.fontSize = 40 // Increase font size for visibility
        addChild(titleLabel)
    }
    
    func addBackground() {
        backgroundColor = .darkGray
    }
    
    func addBalls() {
        for i in 1...3 {
            let ball = Ball(color: .clear, size: CGSize(width: 120, height: 120))
            ball.currentText = "Ball\(i)"
            ball.position = CGPoint(x: 100, y: 700 - 150 * i)
            ball.setup()
            addChild(ball)
            
            balls.append(Ball())
        }
    }
}
