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
        
        let username = UserNameBox.text ?? "user"
        let email = EmailBox.text ?? "email"
        let password = PassBox.text ?? "pass"
        if usernameIsGood(username: username) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error as NSError? {
            print(error)
                self.errorLabel.isHidden = false
                self.errorLabel.text = error.localizedDescription
                
          } else {
            print("User signs up successfully")
              let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
              print("Username:", username)
              changeRequest?.displayName = username
              changeRequest?.commitChanges { error in
                  if let error = error {
                      print(error.localizedDescription)
                  } else {
                      print("Success changing display name to: ", username)
                  }
              }
              self.performSegue(withIdentifier: "SignUpToMain", sender:self)
          }
            
        }
        }
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func usernameIsGood(username : String) -> Bool {
        print("Good Username")
        return true
    }
}

