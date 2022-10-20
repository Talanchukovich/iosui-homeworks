//
//  LogInViewControlle.swift
//  Navigation
//
//  Created by Andrey Talanchuk on 19.10.2022.
//

import UIKit

class LogInViewControlle: UIViewController {
    
    var loginView = LoginView()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        //scrollView.isScrollEnabled = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        setLayout()
        loginView.setView()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerNotifications()
    }
//
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        scrollView.contentInset.bottom = 0
//        NotificationCenter.default.removeObserver(self)
//    }
    
    func addView(){
        view.addSubview(scrollView)
        scrollView.addSubview(loginView)
    }
    
    func setLayout(){
        
        NSLayoutConstraint.activate([scrollView.topAnchor.constraint(equalTo: view.topAnchor),
                                     scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
        
        NSLayoutConstraint.activate([loginView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                                     loginView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                                     loginView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                                     loginView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                                     loginView.widthAnchor.constraint(equalTo: view.widthAnchor),
                                     loginView.heightAnchor.constraint(equalTo: view.heightAnchor)
                                    ])
    }
    
    

    private func registerNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func keyboardWillShow(notification: NSNotification){
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
        let keyboardHeight = keyboardSize.height
        let lastOffset = scrollView.contentOffset
        // so increase contentView's height by keyboard height
            UIView.animate(withDuration: 0.3, animations: { [self] in
                //NSLayoutConstraint.activate([loginView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: keyboardHeight)])
        })
        // move if keyboard hide input field
            let distanceToBottom = scrollView.frame.size.height - (loginView.loginStuckView.frame.origin.y) - (loginView.loginStuckView.frame.size.height) - 20
        let collapseSpace = keyboardHeight - distanceToBottom
        if collapseSpace < 0 {
        // no collapse
        return
        }
        // set new offset for scroll view
            print("collapseSpace \(collapseSpace)")
        UIView.animate(withDuration: 0.3, animations: {
        // scroll to the position above keyboard 10 points
            self.scrollView.contentOffset = CGPoint(x: lastOffset.x, y: collapseSpace - 10)
        })
        }
        
        
        
        
//        guard let keyboardFrame = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
//
//        let position = loginView.loginStuckView.convert(loginView.loginButton.bounds, to: view).maxY
//        if position > keyboardFrame.cgRectValue.height {
//            scrollView.isScrollEnabled = true
//            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.cgRectValue.height, right: 0)
//            self.scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.cgRectValue.height, right: 0)
//        }
    }

    @objc private func keyboardWillHide(notification: NSNotification){
        scrollView.contentInset.bottom = 0
    }
}
