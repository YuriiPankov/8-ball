    //
//  SettingsViewController.swift
//  EightBall
//
//  Created by Yurii on 18.10.2021.
//

import UIKit

class SettingsViewController: UIViewController {

    //Default answers array
    var defaultAnswers: [Answer]?
    
    @IBOutlet weak var defaultAnswerTextField0: UITextField!
    @IBOutlet weak var defaultAnswerTextField1: UITextField!
    @IBOutlet weak var defaultAnswerTextField2: UITextField!
    @IBOutlet weak var defaultAnswerTextField3: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateSaveButtonState()
    }
    
    @IBAction func defaultAnswerEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    // Save button is enabled if one or more text field contains default answer.
    func updateSaveButtonState(){
        let defaultAnswerText0 = defaultAnswerTextField0.text ?? ""
        let defaultAnswerText1 = defaultAnswerTextField1.text ?? ""
        let defaultAnswerText2 = defaultAnswerTextField2.text ?? ""
        let defaultAnswerText3 = defaultAnswerTextField3.text ?? ""
        saveButton.isEnabled = !defaultAnswerText0.isEmpty || !defaultAnswerText1.isEmpty || !defaultAnswerText2.isEmpty || !defaultAnswerText3.isEmpty
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "saveUnwind" else {
            return
        }
        
        let defaultAnswerText0 = defaultAnswerTextField0.text ?? ""
        let defaultAnswerText1 = defaultAnswerTextField1.text ?? ""
        let defaultAnswerText2 = defaultAnswerTextField2.text ?? ""
        let defaultAnswerText3 = defaultAnswerTextField3.text ?? ""
        defaultAnswers = [Answer(question: "", answer: defaultAnswerText0, type: ""), Answer(question: "", answer: defaultAnswerText1, type: ""), Answer(question: "", answer: defaultAnswerText2, type: ""), Answer(question: "", answer: defaultAnswerText3, type: "")]
    }

}
