//
//  CardView.swift
//  Wordcards
//
//  Created by itemius on 08.03.2021.
//

import UIKit

class CardView: UIView {

    weak var card: Card!
    var isFace: Bool = true
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var cardButton: UIButton!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
    }
        
    private func nibSetup() {
//        answerLabel.isHidden = true
//        answerButton.isHidden = false
    }
    
    public func updateWithCard(_ card: Card) {
        self.card = card
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        wordLabel.text = card.quiz
        isFace = true
    }
    
    @objc public func flip() {
        let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
        isFace = !isFace
//        view.layer.cornerRadius = 20
//        view.clipsToBounds = true
        UIView.transition(with: view, duration: 1.0, options: transitionOptions, animations: {
//            self.firstView.isHidden = true
            self.wordLabel.text = self.isFace ? self.card.quiz : self.card.answer
        })

//        UIView.transition(with: secondView, duration: 1.0, options: transitionOptions, animations: {
//            self.secondView.isHidden = false
//        })
    }
    
//    public func updateValues(quiz: String, answer: String) {
//        answerLabel.isHidden = true
//        answerButton.isHidden = false
//
//        quizLabel.text = quiz
//        answerLabel.text = answer
//
//    }
    
    @IBAction func cardTap(_ sender: UIButton) {
        flip()
    }
    
}
