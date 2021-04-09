//
//  SimpleOverlay.swift
//  Wordcards
//
//  Created by itemius on 02.04.2021.
//

import UIKit
import Koloda

class SimpleOverlay: OverlayView {
    
    @IBOutlet lazy var overlayLabel: UILabel! = {
        [unowned self] in

        var frame = self.bounds
        frame.origin.y -= 40
        var label = UILabel(frame: frame)
        label.textAlignment = .center
        self.addSubview(label)

        return label
        }()

    override var overlayState: SwipeResultDirection? {
        didSet {
            switch overlayState {
            case .left? :
                self.backgroundColor = .red
                overlayLabel.text = "I didn't know"
            case .right? :
                self.backgroundColor = .green
                overlayLabel.text = "I knew"
            default:
                self.backgroundColor = .clear
            }
        }
    }

}
