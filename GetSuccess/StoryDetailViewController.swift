//
//  StoryDetailViewController.swift
//  GetSuccess
//
//  Created by Arie May Wibowo on 13/03/20.
//  Copyright © 2020 Arie May Wibowo. All rights reserved.
//

import UIKit

class StoryDetailViewController: UIViewController {
    
    
    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var headline: UILabel!
    @IBOutlet weak var personContent: UITextView!
    
    var name: String = ""
    var image: UIImage?
    var content: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personName.text = name
        headline.text = "Who is \(name)"
        personImage.image = image
        personContent.text = content
        
        personImage.layer.borderWidth=1.0
        personImage.layer.masksToBounds = false
        personImage.layer.borderColor = UIColor.white.cgColor
        personImage.layer.cornerRadius = personImage.frame.size.height/2
        personImage.clipsToBounds = true

        // Do any additional setup after loading the view.
    }
    

}
