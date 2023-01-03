import UIKit
import FirebaseAuth
import FirebaseCore


class SignUp: UIViewController {

    @IBOutlet var UserNameBox: UITextField!
    @IBOutlet var PassBox: UITextField!
    @IBOutlet var EmailBox: UITextField!
    @IBOutlet var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
        PassBox.isSecureTextEntry = true

    }


    @IBAction func SignUpClicked(_ sender: Any) {
        
        let email = EmailBox.text ?? "email"
        let password = PassBox.text ?? "pass"
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error as NSError? {
            print(error)
                self.errorLabel.isHidden = false
                self.errorLabel.text = error.localizedDescription
                
          } else {
            print("User signs up successfully")
            let newUserInfo = Auth.auth().currentUser
            let email = newUserInfo?.email
              self.performSegue(withIdentifier: "SignUpToMain", sender:self)
          }
        }
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

