//
//  LoginController.swift
//  Sun_Exchange
//
//  Created by onedata on 27/06/19.
//  Copyright © 2019 onedata. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class LoginController: UIViewController  {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    var username:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        password.isSecureTextEntry = true
    
//        var username_val  = userName.text!;
//        var password_val = password.text;
//        Alamofire.request("https://api.myjson.com/bins/ffrht" , method: .get).responseJSON {
//            response in
//            if response.result.isSuccess{
//
//                print("Success")
//                print(response)
//
//                if let JSON = response.result.value as? NSDictionary{
//                    let msg = JSON["username"] as! String
//
//                    print(msg)
//                    
//                    let psd = JSON["Password"] as! String
//                    print(psd)
//
//
//                }
//            }
//            else
//            {
//                print("Error")
//            }
//
//        }
        
        
        
        // Do any additional setup after loading the view.
    }
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func SignIn(_ sender: Any) {
        
        let user = userName.text! as NSString
        let psd = password.text! as NSString
        
        let logdetails = [
            "username" : "\(user)",
            "password" : "\(psd)"
        
        ]
//        let header = [
//            "Authorisation" : "sunexchange"]
//
        Alamofire.request("http://192.168.1.192:8080/login/pre", method: .post,
                          parameters: logdetails, encoding:  JSONEncoding.default).validate() .responseData {
            response in
            
            
            
            
            if response.result.isSuccess{
                
                
                print("Success")
                print("Res-\(response)")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc =
                    storyboard.instantiateViewController(withIdentifier: "OtpViewController") as! OtpViewController;       vc.username = user as String;         self.navigationController?.pushViewController(vc, animated: true)
                
                
//                if let JSON = response.result.value as? NSDictionary{
//
//                    print(JSON )
//
                
//                }
            }
                
                
            else
            {
                print(response)
                print(response.result)
                print(response.response?.statusCode)
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc =
                    storyboard.instantiateViewController(withIdentifier: "OtpViewController") as! OtpViewController;                self.navigationController?.pushViewController(vc, animated: true)
                
                
            }
            
        }
        

        
        
        
        
    }
}
