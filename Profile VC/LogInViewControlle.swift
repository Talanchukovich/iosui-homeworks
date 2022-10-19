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
        scrollView.isScrollEnabled = false
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
        print(loginView.bottomAnchor)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        scrollView.contentInset.bottom = 0
        NotificationCenter.default.removeObserver(self)
    }
    
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
                                     loginView.heightAnchor.constraint(equalToConstant: 1000)])
    }
    
    

    private func registerNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func keyboardWillShow(notification: NSNotification){
        guard let keyboardFrame = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        scrollView.isScrollEnabled = true
        scrollView.contentOffset = CGPoint(x:0, y: keyboardFrame.cgRectValue.height - (keyboardFrame.cgRectValue.height / 1.5) )
    }

    @objc private func keyboardWillHide(notification: NSNotification){
        scrollView.contentInset.bottom = 0
    }
}
