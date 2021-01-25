/*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import IGListKit
import UIKit
import QMUIKit
import SwiftEntryKit

extension UIColor {
    static func by(r: Int, g: Int, b: Int, a: CGFloat = 1) -> UIColor {
        let d = CGFloat(255)
        return UIColor(red: CGFloat(r) / d, green: CGFloat(g) / d, blue: CGFloat(b) / d, alpha: a)
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    var ekColor: EKColor {
        return EKColor(self)
    }
    
    static let dimmedLightBackground = UIColor(white: 100.0/255.0, alpha: 0.3)
    static let dimmedDarkBackground = UIColor(white: 50.0/255.0, alpha: 0.3)
    static let dimmedDarkestBackground = UIColor(white: 0, alpha: 0.5)
    
    static let pinky = UIColor(rgb: 0xE91E63)
    static let amber = UIColor(rgb: 0xFFC107)
    static let satCyan = UIColor(rgb: 0x00BCD4)
    static let redish = UIColor(rgb: 0xFF5252)
    static let greenGrass = UIColor(rgb: 0x4CAF50)
    
    static let chatMessageLightMode = UIColor(red: 48, green: 47, blue: 48)
    static let chatMessageDarkMode = UIColor(red: 207, green: 208, blue: 207)
    
    static let textLightMode = UIColor(red: 33, green: 33, blue: 33)
    static let textDarkMode = UIColor(red: 222, green: 222, blue: 222)
    
    static let subTextLightMode = UIColor(red: 117, green: 117, blue: 117)
    static let subTextDarkMode = UIColor(red: 138, green: 138, blue: 138)
    
    static let musicBackgroundDark = UIColor(red: 36, green: 39, blue: 42)
    static let musicRedish = UIColor(red: 219, green: 58, blue: 94)

    static let lightNavigationBarBackground = UIColor(red: 251, green: 251, blue: 253)
    
    static let darkHeaderBackground = UIColor(red: 25, green: 26, blue: 25)
    
    static let darkSegmentedControl = UIColor(red: 55, green: 71, blue: 79)
}

extension EKColor {
    
    static var segmentedControlTint: EKColor {
        return EKColor(.gray)
    }
    
    static var navigationItemColor: EKColor {
        return EKColor(light: .gray,
                       dark: .musicRedish)
    }
    
    static var navigationBackgroundColor: EKColor {
        return EKColor(light: .lightNavigationBarBackground,
                       dark: .black)
    }

    static var headerBackground: EKColor {
        return EKColor(light: Color.BlueGray.c50.with(alpha: 0.95).light,
                       dark: .darkHeaderBackground)
    }
    
    static var headerText: EKColor {
        return EKColor(.white).with(alpha: 0.95)
    }
    
    static var satCyan: EKColor {
        return EKColor(.satCyan)
    }
    
    static var amber: EKColor {
        return EKColor(.amber)
    }
    
    static var pinky: EKColor {
        return EKColor(.pinky)
    }
    
    static var greenGrass: EKColor {
        return EKColor(.greenGrass)
    }
    
    static var redish: EKColor {
        return EKColor(.redish)
    }
    
    static var ratingStar: EKColor {
        return EKColor(light: .amber,
                       dark: .musicRedish)
    }
    
    static var musicBackground: EKColor {
        return EKColor(light: .white,
                       dark: .musicBackgroundDark)
    }
    
    static var musicText: EKColor {
        return EKColor(light: .black,
                       dark: .musicRedish)
    }
    
    static var selectedBackground: EKColor {
        return EKColor(light: UIColor(white: 0.9, alpha: 1),
                       dark: UIColor(white: 0.1, alpha: 1))
    }
    
    static var dimmedDarkBackground: EKColor {
        return EKColor(light: .dimmedDarkBackground,
                       dark: .dimmedDarkestBackground)
    }
    
    static var dimmedLightBackground: EKColor {
        return EKColor(light: .dimmedLightBackground,
                       dark: .dimmedDarkestBackground)
    }
    
    static var chatMessage: EKColor {
        return EKColor(light: .chatMessageLightMode,
                       dark: .chatMessageLightMode)
    }
    
    static var text: EKColor {
        return EKColor(light: .textLightMode,
                       dark: .textDarkMode)
    }
    
    static var subText: EKColor {
        return EKColor(light: .subTextLightMode,
                       dark: .subTextDarkMode)
    }
}

struct Color {
    struct BlueGray {
        static let c50 = EKColor(rgb: 0xeceff1)
        static let c100 = EKColor(rgb: 0xcfd8dc)
        static let c300 = EKColor(rgb: 0x90a4ae)
        static let c400 = EKColor(rgb: 0x78909c)
        static let c700 = EKColor(rgb: 0x455a64)
        static let c800 = EKColor(rgb: 0x37474f)
        static let c900 = EKColor(rgb: 0x263238)
    }
    
    struct Netflix {
        static let light = EKColor(rgb: 0x485563)
        static let dark = EKColor(rgb: 0x29323c)
    }
    
    struct Gray {
        static let a800 = EKColor(rgb: 0x424242)
        static let mid = EKColor(rgb: 0x616161)
        static let light = EKColor(red: 230, green: 230, blue: 230)
    }
    
    struct Purple {
        static let a300 = EKColor(rgb: 0xba68c8)
        static let a400 = EKColor(rgb: 0xab47bc)
        static let a700 = EKColor(rgb: 0xaa00ff)
        static let deep = EKColor(rgb: 0x673ab7)
    }
    
    struct BlueGradient {
        static let light = EKColor(red: 100, green: 172, blue: 196)
        static let dark = EKColor(red: 27, green: 47, blue: 144)
    }
    
    struct Yellow {
        static let a700 = EKColor(rgb: 0xffd600)
    }
    
    struct Teal {
        static let a700 = EKColor(rgb: 0x00bfa5)
        static let a600 = EKColor(rgb: 0x00897b)
    }
    
    struct Orange {
        static let a50 = EKColor(rgb: 0xfff3e0)
    }
    
    struct LightBlue {
        static let a700 = EKColor(rgb: 0x0091ea)
    }
    
    struct LightPink {
        static let first = EKColor(rgb: 0xff9a9e)
        static let last = EKColor(rgb: 0xfad0c4)
    }
}

typealias MainFont = Font.HelveticaNeue

enum Font {
    enum HelveticaNeue: String {
        case ultraLightItalic = "UltraLightItalic"
        case medium = "Medium"
        case mediumItalic = "MediumItalic"
        case ultraLight = "UltraLight"
        case italic = "Italic"
        case light = "Light"
        case thinItalic = "ThinItalic"
        case lightItalic = "LightItalic"
        case bold = "Bold"
        case thin = "Thin"
        case condensedBlack = "CondensedBlack"
        case condensedBold = "CondensedBold"
        case boldItalic = "BoldItalic"
        
        func with(size: CGFloat) -> UIFont {
            return UIFont(name: "HelveticaNeue-\(rawValue)", size: size)!
        }
    }
}




extension CGRect {
    var minEdge: CGFloat {
        return min(width, height)
    }
}

extension UIScreen {
    var minEdge: CGFloat {
        return UIScreen.main.bounds.minEdge
    }
}

final class LabelSectionController: ListSectionController {

    private var object: String?
    
    static var displayMode = EKAttributes.DisplayMode.inferred
    private var displayMode: EKAttributes.DisplayMode {
        return EKAttributes.DisplayMode.inferred
    }

    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 55)
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell: LabelCell = collectionContext?.dequeueReusableCell(for: self, at: index) else {
            fatalError()
        }
        cell.text = object
        return cell
    }

    override func didUpdate(to object: Any) {
        self.object = String(describing: object)
    }
    
    override func didSelectItem(at index: Int) {
        
        var bottomAlertAttributes: EKAttributes {
            var attributes = EKAttributes.bottomFloat
            attributes.hapticFeedbackType = .success
            attributes.displayDuration = .infinity
            attributes.entryBackground = .color(color: .standardBackground)
            attributes.screenBackground = .color(color: .dimmedLightBackground)
            attributes.shadow = .active(
                with: .init(
                    color: .black,
                    opacity: 0.3,
                    radius: 8
                )
            )
            attributes.screenInteraction = .dismiss
            attributes.entryInteraction = .absorbTouches
            attributes.scroll = .enabled(
                swipeable: true,
                pullbackAnimation: .jolt
            )
            attributes.roundCorners = .all(radius: 25)
            attributes.entranceAnimation = .init(
                translate: .init(
                    duration: 0.7,
                    spring: .init(damping: 1, initialVelocity: 0)
                ),
                scale: .init(
                    from: 1.05,
                    to: 1,
                    duration: 0.4,
                    spring: .init(damping: 1, initialVelocity: 0)
                )
            )
            attributes.exitAnimation = .init(
                translate: .init(duration: 0.2)
            )
            attributes.popBehavior = .animated(
                animation: .init(
                    translate: .init(duration: 0.2)
                )
            )
            attributes.positionConstraints.verticalOffset = 10
            attributes.positionConstraints.size = .init(
                width: .offset(value: 20),
                height: .intrinsic
            )
            attributes.positionConstraints.maxSize = .init(
                width: .constant(value: UIScreen.main.minEdge),
                height: .intrinsic
            )
            attributes.statusBar = .dark
            return attributes
        }
        
        var attributes: EKAttributes
        attributes = bottomAlertAttributes
        attributes.displayMode = EKAttributes.DisplayMode.inferred
        attributes.scroll = .edgeCrossingDisabled(swipeable: true)
        attributes.entranceAnimation = .init(
            translate: .init(
                duration: 0.5,
                spring: .init(damping: 1, initialVelocity: 0)
            )
        )
        attributes.entryBackground = .gradient(
            gradient: .init(
                colors: [Color.LightPink.first, Color.LightPink.last],
                startPoint: .zero,
                endPoint: CGPoint(x: 1, y: 1)
            )
        )
        attributes.positionConstraints = .fullWidth
        attributes.positionConstraints.safeArea = .empty(fillSafeArea: true)
        attributes.roundCorners = .top(radius: 20)
        

        let image = UIImage(named: "ic_done_all_light_48pt")!.withRenderingMode(.alwaysTemplate)
        let title = "Awesome!"
        let description = "You are using SwiftEntryKit, and this is a pop up with important content"
        showPopupMessage(attributes: attributes,
                         title: title,
                         titleColor: .white,
                         description: description,
                         descriptionColor: .white,
                         buttonTitleColor: Color.Gray.mid,
                         buttonBackgroundColor: .white,
                         image: image)
        

        
//        let label = UILabel()
//        label.text = "Hello SwiftEntryKit"
//        var attributes = EKAttributes()
//        SwiftEntryKit.display(entry: label, using: attributes)

    }
    
    private func showPopupMessage(attributes: EKAttributes,
                                  title: String,
                                  titleColor: EKColor,
                                  description: String,
                                  descriptionColor: EKColor,
                                  buttonTitleColor: EKColor,
                                  buttonBackgroundColor: EKColor,
                                  image: UIImage? = nil) {
        
        var themeImage: EKPopUpMessage.ThemeImage?
        
        if let image = image {
            themeImage = EKPopUpMessage.ThemeImage(
                image: EKProperty.ImageContent(
                    image: image,
                    displayMode: displayMode,
                    size: CGSize(width: 60, height: 60),
                    tint: titleColor,
                    contentMode: .scaleAspectFit
                )
            )
        }
        let title = EKProperty.LabelContent(
            text: title,
            style: .init(
                font: MainFont.medium.with(size: 24),
                color: titleColor,
                alignment: .center,
                displayMode: displayMode
            ),
            accessibilityIdentifier: "title"
        )
        let description = EKProperty.LabelContent(
            text: description,
            style: .init(
                font: MainFont.light.with(size: 16),
                color: descriptionColor,
                alignment: .center,
                displayMode: displayMode
            ),
            accessibilityIdentifier: "description"
        )
        let button = EKProperty.ButtonContent(
            label: .init(
                text: "Got it!",
                style: .init(
                    font: MainFont.bold.with(size: 16),
                    color: buttonTitleColor,
                    displayMode: displayMode
                )
            ),
            backgroundColor: buttonBackgroundColor,
            highlightedBackgroundColor: buttonTitleColor.with(alpha: 0.05),
            displayMode: displayMode,
            accessibilityIdentifier: "button"
        )
        let message = EKPopUpMessage(
            themeImage: themeImage,
            title: title,
            description: description,
            button: button) {
                SwiftEntryKit.dismiss()
        }
        let contentView = EKPopUpMessageView(with: message)
        SwiftEntryKit.display(entry: contentView, using: attributes)
    }

}
