//
//  User.swift
//  SnopChat
//
//  Created by Frank on 2017/4/15.
//  Copyright © 2017年 Frank. All rights reserved.
//

import UIKit

struct User {
    private var _firstName: String
    private var _uid: String
    
    var uid: String {
        return _uid
    }
    
    var firstName: String {
        return _firstName
    }
    
    init(uid: String, firstName: String) {
        _uid = uid
        _firstName = firstName
    }
}
