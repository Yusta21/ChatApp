


import UIKit
import Firebase
import SVProgressHUD

class LogInViewController: UIViewController {

    //Textfields pre-linked with IBOutlets
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   
    @IBAction func logInPressed(_ sender: AnyObject) {

        
        SVProgressHUD.show()
        
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            
            if error != nil {
                print(error!)
                self.showAlert1()
                SVProgressHUD.dismiss()

                
            } else {
                print("Log in successful!")
                
                SVProgressHUD.dismiss()
                
                self.performSegue(withIdentifier: "goToChat", sender: self)
                
            }
            
        }
        
        
    }
    
    func showAlert1(){ // (sender: CustomButton)                      "\(sender.player)"
        let Alert = UIAlertController(title: "Unexpected error", message: "Invalid email or password", preferredStyle: .alert)
        Alert.addAction(UIAlertAction(title: "Back", style: .cancel,handler: { [self]action in
           
            self.navigationController?.popToRootViewController(animated: true)

        }))
        present(Alert, animated: true)
    }

    
}  
