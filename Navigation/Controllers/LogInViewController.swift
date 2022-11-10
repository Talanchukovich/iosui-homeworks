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
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
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
        return stuck
    }()
    
    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = .black
        textField.autocapitalizationType = .none
        textField.placeholder = "Email or phone"
        textField.backgroundColor = .systemGray6
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
        return textField
    }()
    
    private lazy var mideLineTextFieldStuckView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
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
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
        
        contentView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top)
            make.leading.equalTo(scrollView.snp.leading)
            make.trailing.equalTo(scrollView.snp.trailing)
            make.bottom.equalTo(scrollView.snp.bottom)
            make.width.equalTo(UIScreen.main.bounds.width)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalTo(contentView.snp.centerX)
            make.top.equalTo(contentView.snp.top).inset(120)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        
        loginPasswordTextFieldsStuckView.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).inset(-120)
            make.leading.equalTo(contentView.snp.leading).inset(16)
            make.trailing.equalTo(contentView.snp.trailing).inset(16)
            make.height.equalTo(100)
        }
        
        mideLineTextFieldStuckView.snp.makeConstraints { make in
            make.centerY.equalTo(loginPasswordTextFieldsStuckView.snp.centerY)
            make.leading.equalTo(loginPasswordTextFieldsStuckView.snp.leading)
            make.trailing.equalTo(loginPasswordTextFieldsStuckView.snp.trailing)
            make.height.equalTo(0.5)
        }
        
        loginTextField.snp.makeConstraints { make in
            make.centerY.equalTo(loginPasswordTextFieldsStuckView.snp.centerY).offset(25)
            make.leading.equalTo(loginPasswordTextFieldsStuckView.snp.leading).inset(10)
            make.trailing.equalTo(loginPasswordTextFieldsStuckView.snp.trailing).inset(10)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.centerY.equalTo(loginPasswordTextFieldsStuckView.snp.centerY).offset(-25)
            make.leading.equalTo(loginPasswordTextFieldsStuckView.snp.leading).inset(10)
            make.trailing.equalTo(loginPasswordTextFieldsStuckView.snp.trailing).inset(10)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(loginPasswordTextFieldsStuckView.snp.bottom).inset(-16)
            make.leading.equalTo(contentView.snp.leading).inset(16)
            make.trailing.equalTo(contentView.snp.trailing).inset(16)
            make.height.equalTo(50)
        }
    }
    
    func addDelegate(){
        loginTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func addTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard))
        view.addGestureRecognizer(tapGesture)
    }
    
    let wrongLoginAlert: UIAlertController = {
        let alert = UIAlertController(title: "Не правильный логин", message: "Вы ввели не правильный логин", preferredStyle: .alert)
        let action = UIAlertAction(title: "Закрыть", style: .cancel)
        alert.addAction(action)
        return alert
    }()
    
    @objc private func pushProfileVC() {
        #if DEBUG
        let service = TestUserService()
        #else
        let service = CurrentUserService()
        #endif
        guard let user = service.checkLogin(login: activTextfield?.text ?? "") else {return
            self.present(wrongLoginAlert, animated: true)
        }
        let profileViewController = ProfileViewController(user: user)
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
