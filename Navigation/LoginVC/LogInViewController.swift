//
//  LogInViewController.swift
//  Navigation
//
//  Created by Andrey Talanchuk on 19.10.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    var loginView = LoginView()
    private var activTextfield: UITextField? = nil
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setView()
        addDelegate()
        addTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerNotifications()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    func setView(){
        view.addSubview(scrollView)
        scrollView.addSubview(loginView)
        loginView.setView()
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
            loginView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            loginView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            loginView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            loginView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)])
    }
        
    func addDelegate(){
        loginView.loginTextField.delegate = self
        loginView.passwordTextField.delegate = self
        loginView.delegate = self
    }
    
    func addTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyBoard(){
        self.view.endEditing(true)
        scrollView.setContentOffset( .zero, animated: true)
    }
    
    private func registerNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification){
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {return}
        let keyboardHeight = keyboardSize.height
        let loginStuckMaxY = loginView.loginStuckView.frame.maxY
        let keyBoardOriginY = view.frame.height - keyboardHeight
        let yOffset = loginStuckMaxY > keyBoardOriginY ? loginStuckMaxY - keyBoardOriginY + 16 : .zero
        scrollView.setContentOffset(CGPoint(x: 0, y: yOffset), animated: true)
    }
    
    @objc private func keyboardWillHide(notification: NSNotification){
        hideKeyBoard()
    }
}

extension LogInViewController: ButtonDelegate{
    func onButtonTap(sender: UIButton) {
        navigationController?.pushViewController(ProfileViewController(), animated: true)
    }
}

extension LogInViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activTextfield = textField
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        activTextfield = nil
        hideKeyBoard()
        return true
    }
}
