//
//  SignupController.swift
//  Sun_Exchange
//
//  Created by onedata on 27/06/19.
//  Copyright © 2019 onedata. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SignupController: UIViewController {
    var checkCompany = false
   
    @IBOutlet weak var alreadyhaveacc: NSLayoutConstraint!
    @IBOutlet weak var signinconstraint: NSLayoutConstraint!
    @IBOutlet weak var joinconstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var frameheight: NSLayoutConstraint!
    @IBOutlet weak var companyConstraint: NSLayoutConstraint!
    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmpassword: UITextField!
    
    @IBOutlet weak var company: UITextField!
    @IBOutlet weak var companylabel: UILabel!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var addresslabel: UILabel!
    @IBOutlet weak var phonenumber: UITextField!
    @IBOutlet weak var phnlabel: UILabel!
    @IBOutlet weak var weblabel: UILabel!
    @IBOutlet weak var website: UITextField!
    @IBOutlet weak var fax: UITextField!
    @IBOutlet weak var faxlabel: UIView!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        password.isSecureTextEntry = true
        confirmpassword.isSecureTextEntry = true
        checkCompany = false
        
        scrollview.isScrollEnabled = false;
        joinconstraint.constant = 755
        alreadyhaveacc.constant = 795
        signinconstraint.constant = 792
        
        frameheight.accessibilityFrame.size.height = 1000
////
      company.isHidden = true
       companylabel.isHidden = true

//       addresslabel.isHidden = true
//       address.isHidden = true
//
//        phonenumber.isHidden = true
//        phnlabel.isHidden = true
//
//        website.isHidden = true
//        weblabel.isHidden = true
//
//        fax.isHidden = true
//        faxlabel.isHidden = true

    }
    
    @IBAction func join(_ sender: Any) {
        let firstName = firstname.text! as NSString
        let lastName = lastname.text! as NSString
        let username = self.username.text! as NSString
        let email = self.email.text! as NSString
        let password = self.password.text! as NSString
        let retypedPassword = confirmpassword.text! as NSString
        var isCompany = false
        let companyName = company.text! as NSString
        let mobile = phonenumber.text! as NSString
        let website = self.website.text! as NSString
        let address = self.address.text! as NSString
        let faxNo = self.fax.text! as NSString
       var parameters = [
        
            "firstName" : "\(firstName)" , "lastName" : "\(lastName)"  , "username" : "\(username)"  , "email" : "\(email)"  , "password" : "\(password)"  , "retypedPassword": "\(retypedPassword)"  , "isCompany": "\(isCompany)"  , "companyName": "\(companyName)"  , "contactNo": "\(mobile)"  ,"website" : "\(website)"  ,"address": "\(address)",
                "faxNo" : "\(faxNo)"]
        if checkCompany == true
        {
            isCompany = true
           
        }
        else {
        parameters = [
            
            "firstName" : "\(firstName)" , "lastName" : "\(lastName)"  , "username" : "\(username)"  , "email" : "\(email)"  , "password" : "\(password)"  , "retypedPassword": "\(retypedPassword)"  , "isCompany": "\(isCompany)"  , "companyName": ""  , "contactNo": ""  ,"website" : ""  ,"address": "" ,
                "faxNo" : ""]
        }
        print(parameters)
            

        
     // let json = try? JSONSerialization.jsonObject(with: parameters , options: [JSON])
//
  //let json = try JSONSerialization.jsonObject(with: parameters, options: [])
        
        Alamofire.request("http://192.168.1.192:8080/register", method: .post, parameters: parameters , encoding:  JSONEncoding.default  ).validate() .responseData {
            response in
            
            
         
        
            if response.result.isSuccess{


                print("Success")
                print("Res\(response)")
                
                let otpscreen = self.storyboard?.instantiateInitialViewController()

//                if let JSON = response.result.value as? NSDictionary{
//
//                    print(JSON )
//
//
//                    }
                }


            else
            {
                print(response)
                print(response.result)
                print(response.response?.statusCode)
                
            }

            }


    }

    @IBAction func CheckBoxTapped(_ sender: UIButton) {
        print(sender.state)
       
        
        if sender.isSelected {
              print(sender.state)
            checkCompany = false
            joinconstraint.constant = 755
            alreadyhaveacc.constant = 795
            signinconstraint.constant = 792
            scrollview.isScrollEnabled = false
           company.isHidden = true
         companylabel.isHidden = true
            
          //  ==============================
//
//           addresslabel.isHidden = true
//          address.isHidden = true
//
//            phonenumber.isHidden = true
//            phnlabel.isHidden = true
//
//            website.isHidden = true
//            weblabel.isHidden = true
//
//            fax.isHidden = true
//            faxlabel.isHidden = true

            
            sender.isSelected = false
            print("Already")
        }
        else{
              print(sender.state)
             checkCompany = true
             joinconstraint.constant = 1438
            alreadyhaveacc.constant = 1492
            signinconstraint.constant = 1489
            sender.isSelected = true
            print("Selected")
            scrollview.isScrollEnabled = true
          company.isHidden = false
           companylabel.isHidden = false
            print(self.email.text!)
//            let firstName = firstname.text!
//            let lastName = lastname.text!
//            let username = self.username.text!
//            let email = self.email.text!
//            let password = self.password.text!
//            let retypedPassword = confirmpassword.text!
//            let isCompany = true
//            let companyName = company.text!
//            let mobile = phonenumber.text!
//            let website = self.website.text!
//            let address = self.address.text!
//
//            let parameters = [ firstName , lastname , username , email , password , retypedPassword , isCompany , companyName , mobile ,website ,address ] as [Any]
//
//            addresslabel.isHidden = false
//           address.isHidden = false
//
//            phonenumber.isHidden = false
//            phnlabel.isHidden = false
//
//            website.isHidden = false
//            weblabel.isHidden = false
//
//            fax.isHidden = false
//            faxlabel.isHidden = false

            
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
