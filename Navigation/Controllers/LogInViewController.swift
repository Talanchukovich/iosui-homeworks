//
//  LogInViewController.swift
//  Navigation
//
//  Created by Andrey Talanchuk on 19.10.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    private var activTextfield: UITextField?
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var loginPasswordTextFieldsStuckView: UIStackView = {
        let stuck = UIStackView()
        stuck.axis = .vertical
        stuck.spacing = 16
        stuck.layer.borderColor = UIColor.black.cgColor
        stuck.layer.borderWidth = 0.5
        stuck.layer.cornerRadius = 10
        stuck.backgroundColor = .systemGray6
        stuck.translatesAutoresizingMaskIntoConstraints = false
        return stuck
    }()
    
    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = .black
        textField.autocapitalizationType = .none
        textField.placeholder = "Email or phone"
        textField.backgroundColor = .systemGray6
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = .black
        textField.autocapitalizationType = .none
        textField.placeholder = "Password"
        textField.backgroundColor = .systemGray6
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var mideLineTextFieldStuckView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        let image = UIImage(named: "blue-pixel")
        button.setBackgroundImage(image?.alpha(1), for: .normal)
        button.setBackgroundImage(image?.alpha(0.8), for: .selected)
        button.setBackgroundImage(image?.alpha(0.8), for: .highlighted)
        button.setBackgroundImage(image?.alpha(0.8), for: .disabled)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(pushProfileVC), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var loginViews = [logoImageView, loginPasswordTextFieldsStuckView, loginTextField, passwordTextField, mideLineTextFieldStuckView, loginButton]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        addDelegate()
        addTapGesture()
        scrollView.contentSize.width = view.bounds.width
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
        scrollView.addSubview(contentView)
        loginViews.forEach({scrollView.addSubview($0)})
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            
            loginPasswordTextFieldsStuckView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginPasswordTextFieldsStuckView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginPasswordTextFieldsStuckView.heightAnchor.constraint(equalToConstant: 100),
            loginPasswordTextFieldsStuckView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            
            mideLineTextFieldStuckView.centerYAnchor.constraint(equalTo: loginPasswordTextFieldsStuckView.centerYAnchor),
            mideLineTextFieldStuckView.trailingAnchor.constraint(equalTo: loginPasswordTextFieldsStuckView.trailingAnchor),
            mideLineTextFieldStuckView.leadingAnchor.constraint(equalTo: loginPasswordTextFieldsStuckView.leadingAnchor),
            mideLineTextFieldStuckView.heightAnchor.constraint(equalToConstant: 0.5),
            
            loginTextField.leadingAnchor.constraint(equalTo: loginPasswordTextFieldsStuckView.leadingAnchor, constant: 10),
            loginTextField.trailingAnchor.constraint(equalTo: loginPasswordTextFieldsStuckView.trailingAnchor, constant: -10),
            loginTextField.centerYAnchor.constraint(equalTo: loginPasswordTextFieldsStuckView.centerYAnchor, constant: -25),
            
            passwordTextField.leadingAnchor.constraint(equalTo: loginPasswordTextFieldsStuckView.leadingAnchor, constant: 10),
            passwordTextField.trailingAnchor.constraint(equalTo: loginPasswordTextFieldsStuckView.trailingAnchor, constant: -10),
            passwordTextField.centerYAnchor.constraint(equalTo: loginPasswordTextFieldsStuckView.centerYAnchor, constant: 25),
            
            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginButton.topAnchor.constraint(equalTo: loginPasswordTextFieldsStuckView.bottomAnchor, constant: 16),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func addDelegate(){
        loginTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func addTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func pushProfileVC() {
        let profileViewController = ProfileViewController()
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    @objc private func hideKeyBoard(){
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
        let loginStuckMaxY = loginButton.frame.maxY
        let keyBoardOriginY = view.frame.height - keyboardHeight
        let yOffset = loginStuckMaxY > keyBoardOriginY ? loginStuckMaxY - keyBoardOriginY + 16 : .zero
        scrollView.setContentOffset(CGPoint(x: 0, y: yOffset), animated: true)
    }
    
    @objc private func keyboardWillHide(notification: NSNotification){
        hideKeyBoard()
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if activTextfield == loginTextField {
            return string.first == " " ? false : true
        }
        return true
    }
}

extension UIImage {
    
    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
