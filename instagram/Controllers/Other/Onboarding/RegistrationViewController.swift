//
//  LegistrationViewController.swift
//  instagram
//
//  Created by 박준영 on 2021/07/16.
//

import UIKit

class RegistrationViewController: UIViewController {

    
    struct Constants {
        static let cornerRadius : CGFloat = 8.0 //cornerRadius 타입을 보면 CGFloat이다.
    }
    private let usernameField : UITextField = {
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
    
    private let emailField : UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Email Adress " //텍스트 string이 정해지지 않은 경우 생기는 각주
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
    private let passwordField  : UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Password... " //텍스트 string이 정해지지 않은 경우 생기는 각주
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
 
    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign up", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(usernameField)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(usernameField)
        view.addSubview(registerButton)
        view.backgroundColor = .systemBackground 
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //targetAction설정인가? register버튼 활성화를 위해 만듬. didTapRegister()메소드와 같이
        registerButton.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
        //delegate / 왜 delegate한거지?
        usernameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        
        usernameField.frame = CGRect(x: 25,y: view.safeAreaInsets.top + 100,width: view.width-50,height: 52.0)
        emailField.frame = CGRect(x: 25,y: usernameField.bottom + 40 ,width: view.width-50,height: 52.0)
        passwordField.frame = CGRect(x: 25,y: emailField.bottom + 40 ,width: view.width-50,height: 52.0)
        registerButton.frame = CGRect(x: 25,y: passwordField.bottom + 40 ,width: view.width-50,height: 52.0)
        

        
    }

    @objc func didTapRegister(){
        //이건뭐지??
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        usernameField.resignFirstResponder()
        //이메일, username, 비번 맞는지?
        guard let email = emailField.text,!email.isEmpty,
              let password = passwordField.text,!password.isEmpty, password.count >= 8,
              let username = usernameField.text,!username.isEmpty else {
            return
        }//88줄과 같이 작성
        
        AuthManager.shared.registerNewUser(username: username, email: email, password: password) { registered in
            <#code#>
        }
    }
    
    
    
}
extension RegistrationViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //터치한 곳이 email 이면, password이면,,
        if textField == emailField {
            emailField.becomeFirstResponder()
        }
        else if textField == passwordField {
            passwordField.becomeFirstResponder()
        }
        else {
            didTapRegister()
        }
        return true
    }
}
