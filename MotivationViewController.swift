//
//  MotivationViewController.swift
//  GetSuccess
//
//  Created by Arie May Wibowo on 19/03/20.
//  Copyright © 2020 Arie May Wibowo. All rights reserved.
//

import UIKit

class MotivationViewController: UIViewController {

    @IBOutlet weak var titleMotivation: UILabel!
    @IBOutlet weak var imageMotivation: UIImageView!
    @IBOutlet weak var favoriteImageButton: UIButton!
    
    var imageMotivations: [[Any]] = [[#imageLiteral(resourceName: "elon1"), "Motivation 1"], [#imageLiteral(resourceName: "new2"), "Motivation 2"], [#imageLiteral(resourceName: "motiv3"), "Motivation 3"], [#imageLiteral(resourceName: "motiv2"), "Motivation 4"], [#imageLiteral(resourceName: "motiv4"), "Motivation 5"], [#imageLiteral(resourceName: "motiv1"), "Motivation 6"]]
    var favorites: [String] = []
    var currentTitle: String = ""
    var currentIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for data in imageMotivations {
            if favorites != [] {
                currentIndex += 1
                if data[1] as! String == favorites[1] {
                    imageMotivation.image = data[0] as? UIImage
                    titleMotivation.text = data[1] as? String
                    currentTitle = data[1] as! String
                }
            } else {
                imageMotivation.image = imageMotivations[Int.random(in: 0...(imageMotivations.count - 1))][0] as? UIImage
                titleMotivation.text = imageMotivations[Int.random(in: 0...(imageMotivations.count - 1))][1] as? String
                currentTitle = imageMotivations[Int.random(in: 0...(imageMotivations.count - 1))][1] as! String
                currentIndex = Int.random(in: 0...(imageMotivations.count - 1))
            }
        }
        getStoreData()
    }
    
    @IBAction func previousImage(_ sender: UIButton) {
        decreament()
    }
    
    @IBAction func nextImage(_ sender: UIButton) {
        increament()
    }
    
    @IBAction func favoriteButton(_ sender: UIButton) {
        if checkFavoriteStatus(titleMotivation.text!) {
            print(currentTitle)
            favoriteImageButton.tintColor = UIColor.black
            favorites.remove(at: currentIndex)
        } else {
            favoriteImageButton.tintColor = UIColor.red
            favorites.append(currentTitle)
        }
        storeData(favorites)
    }
    
    func checkFavoriteStatus(_ favText: String) -> Bool {
        var result: Bool = false
        for item in favorites {
            if favText == item {
                result = true
            } else {
                result = false
            }
        }
        return result
    }
  
    func increament() -> Void {
        if currentIndex < imageMotivations.count - 1 {
            currentIndex += 1
            if checkFavoriteStatus(imageMotivations[currentIndex][1] as! String) {
                favoriteImageButton.tintColor = UIColor.red
            } else {
                favoriteImageButton.tintColor = UIColor.black
            }
        } else {
            currentIndex = 0
            if checkFavoriteStatus(imageMotivations[currentIndex][1] as! String) {
                favoriteImageButton.tintColor = UIColor.red
            } else {
                favoriteImageButton.tintColor = UIColor.black
            }
        }
        print(currentIndex)
        imageMotivation.image = imageMotivations[currentIndex][0] as? UIImage
        titleMotivation.text = imageMotivations[currentIndex][1] as? String
    }
    
    func decreament() -> Void {
        if currentIndex > 0 {
            currentIndex -= 1
            print(currentIndex)
            if checkFavoriteStatus(imageMotivations[currentIndex][1] as! String) {
                favoriteImageButton.tintColor = UIColor.red
            } else {
                favoriteImageButton.tintColor = UIColor.black
            }
        } else {
            currentIndex = imageMotivations.count - 1
            print(currentIndex)
            if checkFavoriteStatus(imageMotivations[currentIndex][1] as! String) {
                favoriteImageButton.tintColor = UIColor.red
            } else {
                favoriteImageButton.tintColor = UIColor.black
            }
        }
        print(currentIndex)
        imageMotivation.image = imageMotivations[currentIndex][0] as? UIImage
        titleMotivation.text = imageMotivations[currentIndex][1] as? String
    }
    
    func storeData(_ title: [String]) -> Void {
        let favoriteTitle = try! JSONEncoder().encode(title)
        UserDefaults.standard.set(favoriteTitle, forKey: "favorite")
    }
    
    func getStoreData() {
        let favorite = UserDefaults.standard.array(forKey: "favorite")
        print(favorite ?? "No Favorite Yet")
//        favorites = favorite ?? []
    }
}
