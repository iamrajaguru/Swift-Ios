//
//  OtpViewController.swift
//  Sun_Exchange
//
//  Created by onedata on 02/07/19.
//  Copyright © 2019 onedata. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class OtpViewController: UIViewController {
    var username = ""
  

    @IBOutlet weak var otp: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }
    

    @IBAction func submit(_ sender: Any) {
            let otptoken = otp.text! as NSString
        print(username)
        
            let jsonobj = [
                "username" : "\(username)",
                "otpToken" : "\(otptoken)"
               
                
            ]
            //        let header = [
            //            "Authorisation" : "sunexchange"]
            //
            Alamofire.request("http://192.168.1.192:8080/login/token", method: .post,
                              parameters: jsonobj, encoding:  JSONEncoding.default).validate() .responseJSON {(response: DataResponse<Any>)
                                 in
                                if let headers = response.response?.allHeaderFields {
                                     print(headers)
//                                    if let  header = headers as? [String : Any]{
//                                        print(header)
                                        let Token = headers["Authorisation"] as! String
                                   
                                    print(Token)
//                                    }
                                }
                               
                                
                                if let json = response.data{
                                    do{
                                        let data = try JSON (data: json)
                                        print(data)
                                          print("======================================")
                                        
                                        
                                       
                                 
                                        
                                    }
                                    catch{
                                        print("JSON Error")
                                    }
                                }
                                
                                
                                
                                
                                if response.result.isSuccess{
                                    
                                    
                                    
                                    
                                    print("Success")
                                      print("======================================")
                                    print("Res-\(response)")
                                     print("======================================")
                                     print(response.result)
//                                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                                    let vc =
//                                        storyboard.instantiateViewController(withIdentifier: "OtpViewController") as! OtpViewController;                self.navigationController?.pushViewController(vc, animated: true)
                                    
                                    
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
//
                                    
                                }
                                
            }
            
            
            
            
            
            
        
        
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
