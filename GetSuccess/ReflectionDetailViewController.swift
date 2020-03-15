//
//  ReflectionDetailViewController.swift
//  GetSuccess
//
//  Created by Arie May Wibowo on 16/03/20.
//  Copyright © 2020 Arie May Wibowo. All rights reserved.
//

import UIKit

class ReflectionDetailViewController: UIViewController {

    @IBOutlet weak var titleReflection: UILabel!
    @IBOutlet weak var doneReflection: UITextView!
    @IBOutlet weak var learnReflection: UITextView!
    @IBOutlet weak var planReflection: UITextView!
    @IBOutlet weak var regretReflection: UITextView!
    @IBOutlet weak var doneHeadline: UILabel!
    @IBOutlet weak var learnHeadline: UILabel!
    @IBOutlet weak var planHeadline: UILabel!
    @IBOutlet weak var regretHeadline: UILabel!
    
    var dataReflection: Refleksi?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        adjustUITextViewHeight(doneReflection)
//        adjustUITextViewHeight(learnReflection)
//        adjustUITextViewHeight(planReflection)
//        adjustUITextViewHeight(regretReflection)
//
//        hideHeadlineIfNil(doneHeadline, doneReflection)
//        hideHeadlineIfNil(learnHeadline, learnReflection)
//        hideHeadlineIfNil(planHeadline, planReflection)
//        hideHeadlineIfNil(regretHeadline, regretReflection)
//
        titleReflection.text = dataReflection?.titleRefleksi
        doneReflection.text = dataReflection?.doneRefleksi
        learnReflection.text = dataReflection?.learnRefleksi
        planReflection.text = dataReflection?.planRefleksi
        regretReflection.text = dataReflection?.regretRefleksi
    }
    
    @IBAction func backToList(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
//    func adjustUITextViewHeight(_ arg : UITextView)
//    {
//        arg.translatesAutoresizingMaskIntoConstraints = true
//        arg.frame.size.height = arg.contentSize.height
//        arg.isScrollEnabled = false
//    }
//
//    func hideHeadlineIfNil(_ headline: UILabel,_ label: UITextView) {
//        if label.text != nil {
//            headline.text = ""
//        }
//    }

}
