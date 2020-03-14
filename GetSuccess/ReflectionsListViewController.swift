//
//  ReflectionsListViewController.swift
//  GetSuccess
//
//  Created by Arie May Wibowo on 14/03/20.
//  Copyright © 2020 Arie May Wibowo. All rights reserved.
//

import UIKit


class ReflectionsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ReflectionInputViewControllerDelegate {

    @IBOutlet weak var tableview: UITableView!

    var reflectionsArray = [Refleksi]()
    var indexChoosen:Int! = 0
    let alertForDelete = UIAlertController(title: "Delete Diary Confirmation", message: "Are you really sure about that?", preferredStyle: .actionSheet)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case DataRefleksi.create.rawValue:
                let vc = segue.destination as! ReflectionInputViewController
                vc.delegate = self
//            case "readReflection":
//                if let indexPath = self.tableview.indexPathForSelectedRow {
//                    let controller = segue.destination as! DetailDiaryViewController
//                    controller.data = self.reflectionsArray[indexPath.row]
//            }
        case .none:
            break
        case .some(_):
            break
        }
    }
    
    func didCreateReflection(controller: ReflectionInputViewController, reflections: Refleksi) {
        apply(reflections)
        controller.navigationController?.popViewController(animated: true)
    }
    
    func apply(_ refleksi: Refleksi) {
        reflectionsArray.insert(refleksi, at: 0)
        storeData(reflectionsArray)
    }
    
    func storeData(_ refleksi: [Refleksi]) -> Void {
        let refleksiData = try! JSONEncoder().encode(refleksi)
        UserDefaults.standard.set(refleksiData, forKey: "refleksi")
        tableview.reloadData()
    }
    
    @IBAction func createNewReflection(_ sender: UIButton) {
        performSegue(withIdentifier: DataRefleksi.create.rawValue
            , sender: self)
    }
    
    @IBAction func closeModal(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    // TABLEVIEW
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reflectionsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reflectionsListCell", for: indexPath)
        cell.textLabel?.text = reflectionsArray[indexPath.item].titleRefleksi
        cell.detailTextLabel?.text = reflectionsArray[indexPath.item].dateRefleksi
        return cell
    }
    
}
