//
//  MotivCatViewController.swift
//  GetSuccess
//
//  Created by Arie May Wibowo on 11/03/20.
//  Copyright © 2020 Arie May Wibowo. All rights reserved.
//

import UIKit


class MotivCatViewController: UIViewController {
    
    @IBOutlet weak var quotesBanner: UIImageView!
    @IBOutlet weak var SucStorButton: UIButton!
    @IBOutlet weak var dailyReflectionButton: UIButton!
    @IBOutlet weak var scheduleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SucStorButton.imageView?.layer.cornerRadius = 10
        SucStorButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        SucStorButton.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        SucStorButton.layer.shadowOpacity = 1.0

        dailyReflectionButton.imageView?.layer.cornerRadius = 10
        dailyReflectionButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        dailyReflectionButton.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        dailyReflectionButton.layer.shadowOpacity = 1.0

        scheduleButton.imageView?.layer.cornerRadius = 10
        scheduleButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        scheduleButton.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        scheduleButton.layer.shadowOpacity = 1.0
        
        quotesBanner.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        quotesBanner.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        quotesBanner.layer.shadowOpacity = 1.0
    }
    
    @IBAction func toStoryList(_ sender: UIButton) {
        performSegue(withIdentifier: "toStoryList", sender: self)
    }
    
    @IBAction func toReflectionList(_ sender: UIButton) {
        performSegue(withIdentifier: "toReflectionList", sender: self)
    }
    
    @IBAction func goToSchedulerPage(_ sender: UIButton) {
        performSegue(withIdentifier: "scheduler", sender: self)
    }
    
}
