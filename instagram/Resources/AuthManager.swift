//
//  AuthManager.swift
//  instagram
//
//  Created by 박준영 on 2021/08/04.
//
import FirebaseAuth
import Foundation



public class AuthManager{
    static let shared = AuthManager()
    
    // MARK: - Public
    
    public func registerNewUser(username: String , email: String , password: String,completion : @escaping (Bool)-> Void){
        /*
         - Check if your username is available
         - Check if your email is available
         - Create account
         - Insert account to database
         */
        DatabaseManager.shared.canCreateNewUser(with: email, username: username) { canCreate in
            if canCreate {
               /*
                - Create account
                - Insert account to database
               */
                                                           
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    guard error == nil, result != nil else {
                        //Firebase auth could not create account
                        completion(false)
                        return
                    }
                    //Insert into database
                    DatabaseManager.shared.insertNewUser(with: email, username: username) { inserted in
                        if inserted {
                            completion(true)
                            return
                        }
                        else{
                            //failed to insert
                            completion(false)
                            return
                        }
                    }
                }
            }
            else {
                //either usernmae or email does not exist
                completion(false)
            }
        }
        
    }
    public func  loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void){ //??escaping ?? 
        if let email = email {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, email == nil else {
                    completion(false)
                    return
                }
                completion(true)
            }
        }
        else if let username = username {
              
        }
    }
    
}
