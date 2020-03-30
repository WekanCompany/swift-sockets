//
//  ViewController.swift
//  SocketManager
//
//  Created by Santhosh Kumar on 27/02/20.
//  Copyright © 2020 Santhosh Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - IBOutlets

    @IBOutlet weak var lblStatus: UILabel!

    // MARK: - ViewController lifecycle
    
    /** ViewDidLoad */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Socket Manager"
    }
    
    // MARK: - UIButton action
    
    @IBAction func btnAction(_ sender: UIButton) {
        lblStatus.text = "\(SocketIOManager.getSocketStatus())"
        
        let params =  [ "latitude": "13.22",
                        "longitude": "80.554" ] as [String: Any]
        
        let jsonData = try! JSONSerialization.data(withJSONObject: params)
        let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)
        let dict = convertToDictionary(jsonString! as String)
        
         SocketIOManager.emitLocationInfo(dict!) { (response) in
            //do something
            print("response :", response)
        }
    }
    
    @IBAction func listenJobs(_ sender: UIButton) {
        SocketIOManager.listenNearMeJobs { (response) in
            print("response -> \(response)")
        }
    }
        
    // MARK: - Convert to Dict
    
    func convertToDictionary(_ text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}

