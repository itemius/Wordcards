//
//  CardsViewController.swift
//  Wordcards
//
//  Created by itemius on 08.03.2021.
//

import UIKit
import Koloda

class CardsViewController: UIViewController {
    
    @IBOutlet weak var deck: KolodaView!
    var cards: [Card] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        deck.dataSource = self
        deck.delegate = self
        let json = loadJson(fileName: "english_german_demo")
        cards.removeAll()
        
        for word in json {
            let card = Card(quiz: word.key, answer: word.value)
            cards.append(card)
        }
        deck.backgroundColor = .clear
        deck.reloadData()
    }
    // MARK: - Navigation

    func loadJson(fileName: String) -> [String:String] {
       guard
            let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let json = (try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions(rawValue: 0))) as? [String : String]
       else {
            return [:]
       }
       print(json.count)
       return json
    }

}

extension CardsViewController: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        deck.reloadData()
    }

    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
//        UIApplication.shared.open(URL(string:"https://frostrabbit.com/")!, completionHandler: {_ in })
    }
}

extension CardsViewController: KolodaViewDataSource {

    func kolodaNumberOfCards(_ koloda:KolodaView) -> Int {
        return cards.count
    }

    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .fast
    }
        
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
//        let v = UIView()
//        v.backgroundColor = UIColor.lightGray
//        v.layer.cornerRadius = 5
//        return v//UIImageView(image: images[index])
        
        let card = Bundle.main.loadNibNamed("CardView", owner: self, options: nil)![0] as! CardView
//        card.updateValues(quiz: cards[index].quiz, answer: cards[index].answer)
        card.updateWithCard(cards[index])
        card.layer.cornerRadius = 20
        card.clipsToBounds = true
        return card
    }

    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        let overlay = SimpleOverlay()
        overlay.layer.cornerRadius = 20
        overlay.clipsToBounds = true

        return overlay
//        return Bundle.main.loadNibNamed("OverlayView", owner: self, options: nil)[0] as? ExampleOverlayView
    }
}

