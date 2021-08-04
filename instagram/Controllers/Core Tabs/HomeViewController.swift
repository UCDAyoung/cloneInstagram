//
//  ViewController.swift
//  instagram
//
//  Created by 박준영 on 2021/07/15.
//
import FirebaseAuth
import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handleNotAuthenticated()
    }
    
    // Check Auth stauts
    private func handleNotAuthenticated(){
        if Auth.auth().currentUser == nil {
            let loginVC = LoginViewController()
            
            loginVC.modalPresentationStyle = .fullScreen //유저가 로그인 모달을 내릴 수 없게
            present(loginVC, animated: false)
        }
        
    }
    

}

