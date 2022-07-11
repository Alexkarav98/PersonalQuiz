//
//  ResultViewController.swift
//  PersonalQuiz
//
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var resultsOfAnswers: [Answer]!
    private var counterCat = 0
    private var counterDog = 0
    private var counterRabbit = 0
    private var counterTurtle = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        setUpUI()
    }
    
    
//MARK: Private functions
private func setUpUI () {
    for result in resultsOfAnswers {
        switch result.animal {
        case .cat:
            counterCat += 1
        case .dog:
            counterDog += 1
        case .rabbit:
            counterRabbit += 1
        case .turtle:
            counterTurtle += 1
        }
        
        let counterArray: [Animal: Int] = [Animal.cat: counterCat, Animal.dog: counterDog,
                                           Animal.rabbit: counterRabbit, Animal.turtle: counterTurtle]
        let sortResult = counterArray.sorted(by: {$0.value > $1.value})
        
        if sortResult.first?.value != sortResult[1].value {
            let emoji = sortResult.first?.key.rawValue ?? Animal.cat.rawValue
            titleLabel.text = "Вы - \(emoji) !"
            let definition = sortResult.first?.key.definition ?? Animal.cat.definition
            descriptionLabel.text = definition
        } else {
            titleLabel.text = "Вы 🕊!"
            descriptionLabel.text = "Вы хотите быть свободным внутри себя и снаружи!"
        }
    }
}
    
    deinit {
        print("ResultViewController has been deallocated")
    }
}
