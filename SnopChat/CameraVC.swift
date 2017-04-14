//
//  ViewController.swift
//  SnopChat
//
//  Created by Frank on 2017/4/14.
//  Copyright © 2017年 Frank. All rights reserved.
//

import UIKit

class CameraVC: AAPLCameraViewController {

    @IBOutlet weak var previewView: AAPLPreviewView!
    override func viewDidLoad() {
        self._previewView = previewView 
        super.viewDidLoad()
        
    }
}

