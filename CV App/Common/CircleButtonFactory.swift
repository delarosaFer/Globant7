
import UIKit

final class CircleButtonFactory {
    private init() {}
    
    static func createCircleButton() -> UIButton {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        button.backgroundColor = .red
        
        return button
    }
}
