//
//  DataService.swift
//  SnopChat
//
//  Created by Frank on 2017/4/15.
//  Copyright © 2017年 Frank. All rights reserved.
//

let FIR_CHILD_USERS = "users"
let FIR_STORAGE_URL = "gs://snopchat-760db.appspot.com/"

import Foundation
import FirebaseDatabase
import FirebaseStorage

class DataService {
    private static let _instance = DataService()
    
    static var instance: DataService {
        return _instance
    }
    
    var mainRef: FIRDatabaseReference {
        return FIRDatabase.database().reference()
    }
    
    var usersRef: FIRDatabaseReference {
        return mainRef.child(FIR_CHILD_USERS)
    }
    
    var mainStorageRef: FIRStorageReference {
        return FIRStorage.storage().reference(forURL: FIR_STORAGE_URL)
    }
    
    var imagesStorageRef: FIRStorageReference {
        return mainStorageRef.child("images")
    }
    
    var videoStorageRef: FIRStorageReference {
        return mainStorageRef.child("videos")
    }
    
    func saveUser(uid: String) {
        let profile: Dictionary<String, Any> = ["firstName": "", "lastName": ""]
        mainRef.child(FIR_CHILD_USERS).child(uid).child("profile").setValue(profile)
    }
    
    func sendMediaPullRequest(senderUID: String, sendingTo: Dictionary<String, User>, mediaURL: URL, textSnippet: String? = nil) {
        
        var uids = [String]()
        for uid in sendingTo.keys {
            uids.append(uid)
        }
        
        let pr: Dictionary<String, Any> = ["mediaURL": mediaURL.absoluteString,
                                           "userID": senderUID,
                                           "openCount": 0,
                                           "recipients": uids]
        mainRef.child("pullRequests").childByAutoId().setValue(pr)
    }
    
    
    
    
    
}
