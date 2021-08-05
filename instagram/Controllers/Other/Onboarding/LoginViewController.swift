//
//  LoginViewController.swift
//  instagram
//
//  Created by 박준영 on 2021/07/16.
//
import SafariServices
import UIKit

class LoginViewController: UIViewController {

    struct Constants {
        static let cornerRadius : CGFloat = 8.0 //cornerRadius 타입을 보면 CGFloat이다.
    }
    private let usernameEmailField : UITextField = {
        let field = UITextField()
        field.placeholder = "Username or Email .." //텍스트 string이 정해지지 않은 경우 생기는 각주
        field.returnKeyType = .next //보이는 Return 키
        field.leftViewMode = .always //textField의 왼쪽에 뷰를 always항상 존재하게해서? padding효과를 주는 것
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0 ))
        field.autocapitalizationType = .none  //자동으로 처음문자가 대문자로 설정이되는걸 .none 값으로 설정 -> 소문자
        field.autocorrectionType = .no //자동 글자 수정 .no
        field.layer.masksToBounds = true // textview.clipsToBouds 와 동일하다.텍스트뷰 테두리기준으로 내용,서브뷰들이 짤리는지
        field.layer.cornerRadius = Constants.cornerRadius //일부러 수정하기 편하게 하기 위해 따로 구조체로 구현함.
        field.backgroundColor = .secondarySystemBackground //어떤 색?
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor //??
        return field
    }()
    
    private let passwordField : UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Password ..." //텍스트 string이 정해지지 않은 경우 생기는 각주
        field.returnKeyType = .continue //보이는 Return 키
        field.leftViewMode = .always //textField의 왼쪽에 뷰를 always항상 존재하게해서? padding효과를 주는 것
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0 ))
        field.autocapitalizationType = .none  //자동으로 처음문자가 대문자로 설정이되는걸 .none 값으로 설정 -> 소문자
        field.autocorrectionType = .no //자동 글자 수정 .no
        field.layer.masksToBounds = true // textview.clipsToBouds 와 동일하다.텍스트뷰 테두리기준으로 내용,서브뷰들이 짤리는지
        field.layer.cornerRadius = Constants.cornerRadius //일부러 수정하기 편하게 하기 위해 따로 구조체로 구현함.
        field.backgroundColor = .secondarySystemBackground //어떤 색?
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor //??
        return field
        
    }()
    private let loginButton : UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
        
        
    }()
    private let termsButton : UIButton = {
        let button = UIButton()
        button.setTitle("Terms of Serviced", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    private let privacyButton : UIButton = {
        let button = UIButton()
        button.setTitle("Privacy Policy", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
        
        return UIButton()
    }()
    
    
    private let createAccountButton : UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("New User? Create a Account.", for: .normal)
        
        return button
    }()
    
    private let headerView : UIView = {
        let header = UIView()                                                   //UIView생성
        header.clipsToBounds = true
        let backgroundImageView = UIImageView(image: UIImage(named: "Gradient"))//UIImageView 생성 ( UiImageview안에는 UIImage) 
        header.addSubview(backgroundImageView)//흠..!!
        
        
        return header
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        
        loginButton.addTarget(self,
                              action: #selector(didTapLoginButton),
                              for: .touchUpInside)
        createAccountButton.addTarget(self,
                              action: #selector(didTapCreateAccountButton),
                              for: .touchUpInside)
        
        termsButton.addTarget(self,
                              action: #selector(didTapTermsButton),
                              for: .touchUpInside)
        privacyButton.addTarget(self,
                              action: #selector(didTapPrivacyButton),
                              for: .touchUpInside)
        usernameEmailField.delegate = self
        passwordField.delegate = self
        
        view.backgroundColor = .systemBackground // view는 UIViewController의 프로퍼티임
        // assign Frames
    }
    override func viewDidLayoutSubviews() {
        headerView.frame = CGRect(
            x: 0,
            y: 0.0,             //safeAreaInsets.top -> 0.0 으로 변경
            width: view.width,
            height: view.height/3.0
        )                       //이런 형태로 보기 좋게 작성
        usernameEmailField.frame = CGRect(
            x: 25,
            y: headerView.bottom + 40,
            width: view.width-50,
            height: 52.0
        )
        passwordField.frame = CGRect(
            x: 25,
            y: usernameEmailField.bottom + 10,
            width: view.width - 50,
            height: 52.0
        )
        loginButton.frame = CGRect(
            x: 25,
            y: passwordField.bottom + 10,
            width: view.width - 50,
            height: 52.0
        )
        createAccountButton.frame = CGRect(
            x: 25,
            y: loginButton.bottom + 10,
            width: view.width - 50,
            height: 52.0
        )
        termsButton.frame = CGRect(
            x: 10,
            y: view.height - view.safeAreaInsets.bottom-100,
            width: view.width-20,
            height: 50
        )
        privacyButton.frame = CGRect(
            x: 10,
            y: view.height - view.safeAreaInsets.bottom-50,
            width: view.width-20,
            height: 50
        )
        configureHeaderView()
     }
    private func configureHeaderView(){
        guard headerView.subviews.count == 1 else {
            return
        }
        guard var backgroundView = headerView.subviews.first else {
            return
        }//headerview의 subview들 중 첫번째면 ? return
        backgroundView.frame = headerView.bounds
        
        let imageView = UIImageView(image: UIImage(named: "text"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(
            x: 0,
            y: view.safeAreaInsets.top,
            width: headerView.width,
            height: headerView.height - view.safeAreaInsets.top
        )
        
    }
    
    
    private func addSubviews(){
        view.addSubview(usernameEmailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(createAccountButton)
        view.addSubview(headerView)
    }
    
    @objc private func didTapLoginButton() {
        passwordField.resignFirstResponder()
        usernameEmailField.resignFirstResponder()
        
        guard let usernameEmail = usernameEmailField.text,!usernameEmail.isEmpty,let passWord = passwordField.text,!passWord.isEmpty,passWord.count >= 8 else{
            return
        }
        //login functionalitly
    }
    @objc private func didTapTermsButton() {
        guard let url = URL(string: "https://help.instagram.com/581066165581870") else {
            return
        }                                           //1. url 확인
        let vc = SFSafariViewController(url: url)   //2. vc 객체 생성
        present(vc,animated: true)                  //3. present로 띄우기
    }
    @objc private func didTapPrivacyButton() {
        guard let url = URL(string:"https://help.instagram.com/519522125107875") else {
            return
        }
        let vc = SFSafariViewController(url:url)
        present(vc,animated: true)
    }
    @objc private func didTapCreateAccountButton() {
        let vc = RegistrationViewController()
        present(vc,animated: true)
    }
    
    
}

extension LoginViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameEmailField{
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField {
            didTapLoginButton()
        }
        return true
    }
}//user가 button 누르면 이벤트에 반응하기위해서 delegate를 이용해 이벤트를 처리하려고한다. 그래서 delegate를 선언하려하는데, 이렇게 extension을 이용해서 delegate를 채택하는 것을 얻어가자!
