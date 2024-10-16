import UIKit
import SpriteKit

class Sphere: SKSpriteNode {
    
    var actualColor: String!
    var currentImage: UIImage!
    
    var textLabel: SKLabelNode!
    var shadowLabel: SKLabelNode!
    var currentText: String! {
        didSet {
            textLabel.text = currentText
            shadowLabel.text = currentText
        }
    }
    
    var totalMovementDuration: CGFloat = 0.4
    let MOVEMENT_TIME_DECREASE = 0.015
    
    func setup(text: String) {
        addTextLabel()
        currentText = text
        currentImage = draw(size: size)
        texture = SKTexture(image: currentImage)
        
        moveSphere()
    }
    
    // Function to create the radial gradient texture
    func draw(size: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        let img = renderer.image { ctx in
    
            let rectangle = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            ctx.cgContext.addEllipse(in: rectangle)
            ctx.cgContext.clip()
            
            let context = ctx.cgContext
            let colorSpace = CGColorSpaceCreateDeviceRGB()
            let gradient = getRandomColor()
            actualColor = gradient.1
            currentText = gradient.1
            
            let locations: [CGFloat] = [0.0, 0.4, 1.0]
            let gradientColor = CGGradient(colorsSpace: colorSpace, colors: gradient.0 as CFArray, locations: locations)!
            

            let center = CGPoint(x: size.width * 0.75, y: size.height * 0.25)
            let radius = min(size.width, size.height)
            
            // Draw the radial gradient
            context.drawRadialGradient(gradientColor,
                                        startCenter: center, startRadius: 0,
                                        endCenter: center, endRadius: radius,
                                        options: .drawsBeforeStartLocation)
            
        }
            
        // Convert the UIImage to SKTexture
        return img
    }
    
    func addTextLabel() {
        textLabel = SKLabelNode(text: currentText)
        textLabel.fontName = "Chalkduster"
        textLabel.fontSize = 16
        textLabel.horizontalAlignmentMode = .center
        textLabel.verticalAlignmentMode = .center
        textLabel.position = CGPoint(x: 0, y: 0)
        textLabel.fontColor = .black
        textLabel.zPosition = 1
        textLabel.numberOfLines = 2
        textLabel.preferredMaxLayoutWidth = self.size.width * 0.75
        
        shadowLabel = SKLabelNode(text: currentText)
        shadowLabel.fontName = "Chalkduster"
        shadowLabel.fontSize = 17
        shadowLabel.horizontalAlignmentMode = .center
        shadowLabel.verticalAlignmentMode = .center
        shadowLabel.position = CGPoint(x: 2, y: 2)
        shadowLabel.fontColor = .white
        shadowLabel.zPosition = 2
        shadowLabel.numberOfLines = 2
        shadowLabel.preferredMaxLayoutWidth = self.size.width * 0.75
        
        addChild(textLabel)
        addChild(shadowLabel)
    }
    
    func moveSphere() {
        let moveAction = SKAction.move(by: CGVector(dx: 100, dy: 0), duration: totalMovementDuration)
        let moveForever = SKAction.repeatForever(moveAction)
        run(moveForever)
    }
    
    func getNewSphereDesign() {
        currentImage = draw(size: self.size)
        texture = SKTexture(image: currentImage)
    }
    
    func updateTextWith(text: String) {
        currentText = text
    }
    
    func updateSphere() {
        self.isHidden = false
        self.getNewSphereDesign()
        
        if self.totalMovementDuration > 0.15 {
            self.totalMovementDuration -= MOVEMENT_TIME_DECREASE
            self.removeAllActions()
            let moveAction = SKAction.move(by: CGVector(dx: 100, dy: 0), duration: totalMovementDuration)
            let moveForever = SKAction.repeatForever(moveAction)
            run(moveForever)
        }
    }
    
    func animateSphereTapped() {
        let fadeOut = SKAction.fadeOut(withDuration: 0.3)
        run(fadeOut)
    }
}
