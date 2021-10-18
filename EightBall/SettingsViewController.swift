//
//  SettingsViewController.swift
//  EightBall
//
//  Created by Yurii on 18.10.2021.
//

import UIKit

class SettingsViewController: UIViewController {

    var defaultAnswer: Answer?
    @IBOutlet weak var defaultAnswerTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateSaveButtonState()
    }
    
    @IBAction func defaultAnswerEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    
    func updateSaveButtonState(){
        let defaultAnswerText = defaultAnswerTextField.text ?? ""
        saveButton.isEnabled = !defaultAnswerText.isEmpty
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "saveUnwind" else {
            return
        }
        
        let defaultAnswerText = defaultAnswerTextField.text ?? ""
        defaultAnswer = Answer(question: "", answer: defaultAnswerText, type: "")
    }

}
