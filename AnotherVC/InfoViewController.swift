//
//  InfoViewController.swift
//  Navigation
//
//  Created by Андрей Таланчук on 19.10.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    let allerButton: UIButton = {
        let allerButton = UIButton()
        allerButton.setTitle("Allert", for: .normal)
        allerButton.tintColor = .white
        allerButton.backgroundColor = .red
        allerButton.layer.borderColor = UIColor.blue.cgColor
        allerButton.layer.borderWidth = 5
        allerButton.layer.cornerRadius = 25
        allerButton.translatesAutoresizingMaskIntoConstraints = false
        return allerButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(allerButton)
        setLayout()
        setAlertButton()
    }
    
    func setLayout(){
        NSLayoutConstraint.activate([allerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     allerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                     allerButton.heightAnchor.constraint(equalToConstant: 50),
                                     allerButton.widthAnchor.constraint(equalToConstant: 200)])
    }
    
    func setAlertButton(){
        allerButton.addTarget(self, action: #selector(allerButtonAction), for: .touchUpInside)
    }
    
    @objc func allerButtonAction(){
        let alertController = UIAlertController(title: "Внимание", message: "Выберете действие", preferredStyle: .actionSheet)
        let alert1 = UIAlertAction(title: "Печать Alert 1", style: .default){_ in
            print("Alert 1")
        }
        let alert2 = UIAlertAction(title: "Печать Alert 2", style: .default){_ in
            print("Alert 2")
        }
        let cancelAlert = UIAlertAction(title: "Отмена", style: .cancel){_ in
            alertController.dismiss(animated: true)
        }
        alertController.addAction(alert1)
        alertController.addAction(alert2)
        alertController.addAction(cancelAlert)
        self.present(alertController, animated: true)
    }
}
