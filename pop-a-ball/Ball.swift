import UIKit
import SpriteKit

class Ball: SKSpriteNode {
    
    var currentText: String!
    var currentImage: UIImage!
    
    var textLabel: SKLabelNode!
    
    var totalMovementDuration: CGFloat = 0.5
    
    func setup() {
        currentImage = drawBall(size: size)
        texture = SKTexture(image: currentImage)
        
        addTextLabel()
        moveBall()
    }
    
    func drawBall(size: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        let img = renderer.image { ctx in
            
            let rectangle = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            let color: UIColor = getRandomColor()
            
            // Draw the shadow
            let shadowColor = UIColor.black.withAlphaComponent(0.5) // Semi-transparent black for shadow
            ctx.cgContext.setShadow(offset: CGSize(width: 5, height: 5), blur: 10, color: shadowColor.cgColor)

            // Draw the gradient for the ball
            let colors = [color.cgColor, color.withAlphaComponent(0.8).cgColor]
            let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: colors as CFArray, locations: [0, 1])!
            
            ctx.cgContext.addEllipse(in: rectangle)
            ctx.cgContext.clip() // Clip to the ellipse
            
            // Draw the gradient
            let startPoint = CGPoint(x: size.width / 2, y: 0)
            let endPoint = CGPoint(x: size.width / 2, y: size.height)
            ctx.cgContext.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: [])
            
            // Draw highlight for more depth
            ctx.cgContext.setBlendMode(.screen)
            ctx.cgContext.setFillColor(UIColor.white.withAlphaComponent(0.3).cgColor)
            ctx.cgContext.addEllipse(in: rectangle.insetBy(dx: size.width * 0.1, dy: size.height * 0.1)) // Smaller ellipse for highlight
            ctx.cgContext.fillPath()
        }
        
        return img
    }
    
    func addTextLabel() {
        textLabel = SKLabelNode(text: currentText) // Initialize the label with the current text
        textLabel.fontName = "Chalkduster" // Set the font name
        textLabel.fontSize = 20 // Set the font size
        textLabel.color = .black // Set the text color
        textLabel.horizontalAlignmentMode = .center // Center alignment
        textLabel.verticalAlignmentMode = .center // Center alignment
        textLabel.position = CGPoint(x: 0, y: 0) // Center the text in the ball
        textLabel.fontColor = .black
        addChild(textLabel) // Add the label as a child to the ball
    }
    
    func moveBall() {
        let moveAction = SKAction.move(by: CGVector(dx: 100, dy: 0), duration: totalMovementDuration)
        let moveForever = SKAction.repeatForever(moveAction) // Repeat the action forever
        run(moveForever)
    }
    
    func getRandomColor() -> UIColor {
        switch Int.random(in: 0...14) {
        case 0:
            return UIColor(red: 250/255, green: 231/255, blue: 235/255, alpha: 1)
        case 1:
            return UIColor(red: 224/255, green: 212/255, blue: 231/255, alpha: 1)
        case 2:
            return UIColor(red: 219/255, green: 238/255, blue: 247/255, alpha: 1)
        case 3:
            return UIColor(red: 189/255, green: 210/255, blue: 228/255, alpha: 1)
        case 4:
            return UIColor(red: 238/255, green: 206/255, blue: 218/255, alpha: 1)
        case 5:
            return UIColor(red: 204/255, green: 220/255, blue: 235/255, alpha: 1)
        case 6:
            return UIColor(red: 254/255, green: 200/255, blue: 154/255, alpha: 1)
        case 7:
            return UIColor(red: 252/255, green: 213/255, blue: 206/255, alpha: 1)
        case 8:
            return UIColor(red: 244/255, green: 149/255, blue: 149/255, alpha: 1)
        case 9:
            return UIColor(red: 169/255, green: 228/255, blue: 222/255, alpha: 1)
        case 10:
            return UIColor(red: 131/255, green: 184/255, blue: 198/255, alpha: 1)
        case 11:
            return UIColor(red: 243/255, green: 209/255, blue: 124/255, alpha: 1)
        case 12:
            return UIColor(red: 222/255, green: 214/255, blue: 206/255, alpha: 1)
        case 13:
            return UIColor(red: 216/255, green: 226/255, blue: 220/255, alpha: 1)
        default:
            return UIColor(red: 240/255, green: 244/255, blue: 191/255, alpha: 1)
        }
    }
}
