//
//  AuthService.swift
//  SnopChat
//
//  Created by Frank on 2017/4/15.
//  Copyright © 2017年 Frank. All rights reserved.
//

import Foundation
import FirebaseAuth

typealias Completion = (_ errMsg: String?, _ data: Any?) -> Void

class AuthService {
    private static let _instance = AuthService()
    
    static var instance: AuthService {
        return _instance
    }
    
    func login(email: String, password: String, onComplete: Completion?) {
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            if let error = error as NSError? {
                if let errorCode = FIRAuthErrorCode(rawValue: error.code) {
                    if errorCode == .errorCodeUserNotFound {
                        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                            if let error = error as NSError? {
                                self.handleFirebaseError(error: error, onComplete: onComplete)
                            } else {
                                if user?.uid != nil {
                                    DataService.instance.saveUser(uid: user!.uid)
                                    FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                                        if let error = error as NSError? {
                                            self.handleFirebaseError(error: error, onComplete: onComplete)
                                        } else {
                                            onComplete?(nil, user)
                                        }
                                    })
                                }
                            }
                        })
                    }
                } else {
                    // Handle all other errors
                    self.handleFirebaseError(error: error, onComplete: onComplete)
                }
            } else {
                onComplete?(nil, user)
            }
        })
    }
    
    func handleFirebaseError(error: NSError, onComplete: Completion?) {
        print(error.debugDescription)
        if let errorCode = FIRAuthErrorCode(rawValue: error.code) {
            switch errorCode {
            case .errorCodeInvalidEmail:
                onComplete?("Invalid email address", nil)
            case .errorCodeWrongPassword:
                onComplete?("Invalid password", nil)
            case .errorCodeEmailAlreadyInUse, .errorCodeAccountExistsWithDifferentCredential:
                onComplete?("Could not create account. Email already in used", nil)
            default:
                onComplete?("There was a problem authenticating. Try again.", nil)
            }
        }
    }
}
