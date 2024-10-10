import SpriteKit

class CustomButton: SKShapeNode {
    
    
    init(size: CGSize, cornerRadius: CGFloat, fillColor: UIColor, strokeColor: UIColor, fontSize: CGFloat, fontColor: UIColor) {
        super.init()
        
        let rectPath = CGPath(roundedRect: CGRect(origin: CGPoint(x: -size.width / 2, y: -size.height / 2), size: size),
                                                  cornerWidth: cornerRadius,
                                                  cornerHeight: cornerRadius,
                                                  transform: nil)
        
        self.path = rectPath
        self.fillColor = fillColor
        self.strokeColor = strokeColor
        self.zPosition = 10
        
        let buttonLabel = SKLabelNode(text: "play again")
        buttonLabel.fontName = "MarkerFelt-Wide"
        buttonLabel.fontSize = fontSize
        buttonLabel.fontColor = fontColor
        buttonLabel.position = CGPoint(x: 0, y: -5)
        buttonLabel.zPosition = 9
        buttonLabel.name = "buttonLabel"
        self.addChild(buttonLabel)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
