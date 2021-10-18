//
//  MainViewController.swift
//  EightBall
//
//  Created by Yurii on 18.10.2021.
//

import UIKit

class MainViewController: UIViewController {

    var defaultAnswer = Answer(question: "", answer: "", type: "")
    let answerController = AnswerController()
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answerLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchAnswer()
    }
    

    @IBAction func unwindToMainViewController(segue: UIStoryboardSegue){
        
        guard segue.identifier == "saveUnwind",
        let sourceViewController = segue.source as? SettingsViewController,
        let defaultAnswer = sourceViewController.defaultAnswer else {
            return
        }
        
        self.defaultAnswer = defaultAnswer
    }

    func updateUI(with error: Error){
        answerLabel.text = defaultAnswer.answer
    }
    
    func updateUI(with magic: Magic){
        answerLabel.text = magic.magic.answer
    }
    
    func fetchAnswer(){
        answerController.fetchAnswer { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let magic):
                    self.updateUI(with: magic)
                case .failure(let error):
                    self.updateUI(with: error)
                }
            }
        }
    }
    
}
