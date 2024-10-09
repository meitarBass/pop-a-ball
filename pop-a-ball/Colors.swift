import UIKit


let gradient1: ([CGColor], String) = ([ UIColor(red: CGFloat(0x50) / 255.0, green: CGFloat(0xF5) / 255.0, blue: CGFloat(0xFF) / 255.0, alpha: 1.0).cgColor,
                         UIColor(red: CGFloat(0x00) / 255.0, green: CGFloat(0xAC) / 255.0, blue: CGFloat(0xB7) / 255.0, alpha: 1.0).cgColor,
                         UIColor(red: CGFloat(0x00) / 255.0, green: CGFloat(0x47) / 255.0, blue: CGFloat(0x4B) / 255.0, alpha: 1.0).cgColor
                    ], "White Blue")

let gradient2: ([CGColor], String) = ([ UIColor(red: CGFloat(0xFF) / 255.0, green: CGFloat(0x50) / 255.0, blue: CGFloat(0x50) / 255.0, alpha: 1.0).cgColor,
                         UIColor(red: CGFloat(0xB7) / 255.0, green: CGFloat(0x00) / 255.0, blue: CGFloat(0x00) / 255.0, alpha: 1.0).cgColor,
                         UIColor(red: CGFloat(0x4B) / 255.0, green: CGFloat(0x00) / 255.0, blue: CGFloat(0x00) / 255.0, alpha: 1.0).cgColor
                    ], "Red")


let gradient3: ([CGColor], String) = ([ UIColor(red: CGFloat(0xFF) / 255.0, green: CGFloat(0x50) / 255.0, blue: CGFloat(0x9C) / 255.0, alpha: 1.0).cgColor,
                         UIColor(red: CGFloat(0xB7) / 255.0, green: CGFloat(0x00) / 255.0, blue: CGFloat(0x42) / 255.0, alpha: 1.0).cgColor,
                         UIColor(red: CGFloat(0x4B) / 255.0, green: CGFloat(0x00) / 255.0, blue: CGFloat(0x1A) / 255.0, alpha: 1.0).cgColor
                    ], "oink")


let gradient4: ([CGColor], String)  = ([ UIColor(red: CGFloat(0xFF) / 255.0, green: CGFloat(0xED) / 255.0, blue: CGFloat(0x50) / 255.0, alpha: 1.0).cgColor,
                         UIColor(red: CGFloat(0xB7) / 255.0, green: CGFloat(0x9C) / 255.0, blue: CGFloat(0x00) / 255.0, alpha: 1.0).cgColor,
                         UIColor(red: CGFloat(0x4B) / 255.0, green: CGFloat(0x42) / 255.0, blue: CGFloat(0x00) / 255.0, alpha: 1.0).cgColor
                    ], "Yellow")

let gradient5: ([CGColor], String) = ([ UIColor(red: CGFloat(0x62) / 255.0, green: CGFloat(0xFF) / 255.0, blue: CGFloat(0x50) / 255.0, alpha: 1.0).cgColor,
                         UIColor(red: CGFloat(0x24) / 255.0, green: CGFloat(0xB7) / 255.0, blue: CGFloat(0x00) / 255.0, alpha: 1.0).cgColor,
                         UIColor(red: CGFloat(0x16) / 255.0, green: CGFloat(0x4B) / 255.0, blue: CGFloat(0x00) / 255.0, alpha: 1.0).cgColor
                    ], "Green")


let gradient6: ([CGColor], String) = ([ UIColor(red: CGFloat(0xB1) / 255.0, green: CGFloat(0x50) / 255.0, blue: CGFloat(0xFF) / 255.0, alpha: 1.0).cgColor,
                         UIColor(red: CGFloat(0x7D) / 255.0, green: CGFloat(0x00) / 255.0, blue: CGFloat(0xB7) / 255.0, alpha: 1.0).cgColor,
                         UIColor(red: CGFloat(0x3D) / 255.0, green: CGFloat(0x00) / 255.0, blue: CGFloat(0x4B) / 255.0, alpha: 1.0).cgColor
                    ], "Purple")


let gradient7: ([CGColor], String) = ([ UIColor(red: CGFloat(0xFF) / 255.0, green: CGFloat(0xAE) / 255.0, blue: CGFloat(0x50) / 255.0, alpha: 1.0).cgColor,
                         UIColor(red: CGFloat(0xB7) / 255.0, green: CGFloat(0x57) / 255.0, blue: CGFloat(0x00) / 255.0, alpha: 1.0).cgColor,
                         UIColor(red: CGFloat(0x4B) / 255.0, green: CGFloat(0x2C) / 255.0, blue: CGFloat(0x00) / 255.0, alpha: 1.0).cgColor
                    ], "Orange")

let gradient8: ([CGColor], String) = ([ UIColor(red: CGFloat(0x50) / 255.0, green: CGFloat(0xFF) / 255.0, blue: CGFloat(0xBC) / 255.0, alpha: 1.0).cgColor,
                         UIColor(red: CGFloat(0x00) / 255.0, green: CGFloat(0xB7) / 255.0, blue: CGFloat(0x55) / 255.0, alpha: 1.0).cgColor,
                         UIColor(red: CGFloat(0x00) / 255.0, green: CGFloat(0x4B) / 255.0, blue: CGFloat(0x24) / 255.0, alpha: 1.0).cgColor
                    ], "Dark Green")


let gradient9: ([CGColor], String) = ([ UIColor(red: CGFloat(0x50) / 255.0, green: CGFloat(0x6B) / 255.0, blue: CGFloat(0xFF) / 255.0, alpha: 1.0).cgColor,
                         UIColor(red: CGFloat(0x00) / 255.0, green: CGFloat(0x1E) / 255.0, blue: CGFloat(0xB7) / 255.0, alpha: 1.0).cgColor,
                         UIColor(red: CGFloat(0x00) / 255.0, green: CGFloat(0x00) / 255.0, blue: CGFloat(0x4B) / 255.0, alpha: 1.0).cgColor
                    ], "Blue")





func getRandomColor() -> ([CGColor], String) {
    let num = Int.random(in: 1...9)
    switch num {
    case 1:
        return gradient1
    case 2:
        return gradient2
    case 3:
        return gradient3
    case 4:
        return gradient4
    case 5:
        return gradient5
    case 6:
        return gradient6
    case 7:
        return gradient7
    case 8:
        return gradient8
    default:
        return gradient9
    }
}
