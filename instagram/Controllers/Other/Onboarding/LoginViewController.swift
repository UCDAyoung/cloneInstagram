//
//  LoginViewController.swift
//  instagram
//
//  Created by 박준영 on 2021/07/16.
//

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
        return field
    }()
    
    private let passwordField : UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Password ..." //텍스트 string이 정해지지 않은 경우 생기는 각주
        field.returnKeyType = .next //보이는 Return 키
        field.leftViewMode = .always //textField의 왼쪽에 뷰를 always항상 존재하게해서? padding효과를 주는 것
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0 ))
        field.autocapitalizationType = .none  //자동으로 처음문자가 대문자로 설정이되는걸 .none 값으로 설정 -> 소문자
        field.autocorrectionType = .no //자동 글자 수정 .no
        field.layer.masksToBounds = true // textview.clipsToBouds 와 동일하다.텍스트뷰 테두리기준으로 내용,서브뷰들이 짤리는지
        field.layer.cornerRadius = Constants.cornerRadius //일부러 수정하기 편하게 하기 위해 따로 구조체로 구현함.
        return field
        
    }()
    private let termsButton : UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
        
        
    }()
    private let privacyButton : UIButton = {
        return UIButton()
    }()
    private let loginButton : UIButton = {
        return UIButton()
    }()
    private let createAccountButton : UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("New User? Create a Account.", for: .normal)
        
        return button
    }()
    
    private let headerView : UIView = {
        let header = UIView()
        header.clipsToBounds = true
        header.backgroundColor = .red
        return header
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        view.backgroundColor = .systemBackground // view는 UIViewController의 프로퍼티임
        // assign Frames
    }
    override func viewDidLayoutSubviews() {
        headerView.frame = CGRect(
            x: 0,
            y: view.safeAreaInsets.top,
            width: view.width,
            height: view.height/3.0)                //이런 형태로 보기 좋게 작성
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
    
    @objc private func didTapLoginButton() {}
    @objc private func didTapTermsButton() {}
    @objc private func didTapPrivacyButton() {}
    @objc private func didTapCreateAccountButton() {}
    
    
}
