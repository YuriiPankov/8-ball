//
//  MainViewController.swift
//  EightBall
//
//  Created by Yurii on 18.10.2021.
//

import UIKit

class MainViewController: UIViewController {

    var defaultAnswers = [Answer]()
    let answerController = AnswerController()
 
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerLabel.text = "Call-to-shake!"
    }
    

    //This method is used to receive array of default answers from Settings screen
    @IBAction func unwindToMainViewController(segue: UIStoryboardSegue){
        
        guard segue.identifier == "saveUnwind",
        let sourceViewController = segue.source as? SettingsViewController,
        let defaultAnswers = sourceViewController.defaultAnswers else {
            return
        }
        
        self.defaultAnswers.append(contentsOf: defaultAnswers)
    }

    //Motion detection method
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            DispatchQueue.main.async {
                self.spinner.startAnimating()
            }
            fetchAnswer()
        }
    }
    
    //Method to fetch answer from 8-ball API and process the result
    func fetchAnswer(){
        answerController.fetchAnswer { (result) in
            DispatchQueue.main.async {
                self.spinner.stopAnimating()
                switch result {
                case .success(let magic):
                    self.updateUI(with: magic)
                case .failure(let error):
                    self.updateUI(with: error)
                }
            }
        }
    }
    
    func updateUI(with error: Error){
        answerLabel.text = answerController.fetchDefaultAnswer(from: defaultAnswers).answer
    }
    
    func updateUI(with magic: Magic){
        answerLabel.text = magic.magic.answer
    }
}
