//
//  DatabaseManager.swift
//  instagram
//
//  Created by 박준영 on 2021/08/04.
//
import FirebaseDatabase     //추가함
import Foundation


public class DatabaseManager{
    static let shared = DatabaseManager()
    private let database = Database.database().reference()
    /// Check if username and email is available
    /// - Parameters
    ///
    public func canCreateNewUser(with email : String, username : String, completion : (Bool) -> Void) {
        
    }
    /// Inserts new  user data to database
    /// - Parameters
    ///        - email :  String respresnting email
    ///        - username : String respresenting username
    public func insertNewUser(with email : String, username : String, completion : @escaping (Bool)-> Void) {
        database.child(email).setValue(["username" : username]){
            error, _ in
            if error == nil {
                //succeeded
                completion(true)
                return
            }  
            else {
                completion(false)
                return
            }
        }
    }
}
