//
//  ReflectionInputViewController.swift
//  GetSuccess
//
//  Created by Arie May Wibowo on 14/03/20.
//  Copyright © 2020 Arie May Wibowo. All rights reserved.
//

import UIKit

protocol ReflectionInputViewControllerDelegate {
    func didCreateReflection(controller: ReflectionInputViewController, reflections: Refleksi)
}

class ReflectionInputViewController: UIViewController {
    
    var delegate : ReflectionInputViewControllerDelegate?
    
    @IBOutlet weak var titleInput: UITextField!
    @IBOutlet weak var doneForm: UITextView!
    @IBOutlet weak var learnForm: UITextView!
    @IBOutlet weak var planForm: UITextView!
    @IBOutlet weak var regretForm: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    
    var date: String! = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doneForm?.layer.borderWidth = 0.3
        doneForm.text = ""
        learnForm?.layer.borderWidth = 0.3
        learnForm.text = ""
        planForm?.layer.borderWidth = 0.3
        planForm.text = ""
        regretForm?.layer.borderWidth = 0.3
        regretForm.text = ""
        
        getDate()
    }
    
    @IBAction func cancelCreateNew(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveReflection(_ sender: UIButton) {
        let data = Refleksi(
            titleRefleksi: ((self.titleInput.text != "") ? self.titleInput.text : "Untitled"),
            doneRefleksi: ((self.doneForm.text != "") ? self.doneForm.text : "N/A"),
            learnRefleksi: ((self.learnForm.text != "") ? self.learnForm.text : "N/A"),
            planRefleksi: ((self.planForm.text != "") ? self.planForm.text : "N/A"),
            regretRefleksi: ((self.regretForm.text != "") ? self.regretForm.text : "N/A"),
            dateRefleksi: self.date!
        )
        self.delegate?.didCreateReflection(controller: self, reflections: data)
    }
    
    func getDate() -> Void {
        let dateFormatter = DateFormatter()

        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        let now = Date()
        let strDate = dateFormatter.string(from: now)
        print(strDate)
        date = strDate
    }

}
