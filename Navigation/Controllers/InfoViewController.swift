//
//  InfoViewController.swift
//  Navigation
//
//  Created by Андрей Таланчук on 19.10.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    private let allerButton: UIButton = {
        let allerButton = UIButton()
        allerButton.setTitle("Allert", for: .normal)
        allerButton.tintColor = .white
        allerButton.backgroundColor = .red
        allerButton.layer.borderColor = UIColor.blue.cgColor
        allerButton.layer.borderWidth = 5
        allerButton.layer.cornerRadius = 25
        return allerButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    private func setLayout(){
        
        allerButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }
    
    private func setAlertButton(){
        allerButton.addTarget(self, action: #selector(allerButtonAction), for: .touchUpInside)
    }
    
    @objc private func allerButtonAction(){
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
    
    private func setView(){
        view.backgroundColor = .lightGray
        view.addSubview(allerButton)
        setAlertButton()
        setLayout()
    }
}
