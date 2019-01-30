//
//  ViewController.swift
//  NiceThings
//
//  Created by Josh Brown on 2/2/18.
//  Copyright © 2018 Roadfire Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let result: Result<Any, Any> = .success("hi")
        
        switch result {
        case .success:
            print("success! 🎉")
        case .failure:
            print("failure...")
        }
    }

}

