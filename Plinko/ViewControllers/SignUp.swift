import UIKit
import FirebaseAuth
import FirebaseCore


class SignUp: UIViewController {

    @IBOutlet var UserNameBox: UITextField!
    @IBOutlet var PassBox: UITextField!
    @IBOutlet var EmailBox: UITextField!
    @IBOutlet var errorLabel: UILabel!
    @IBOutlet var loadingDot: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
        PassBox.isSecureTextEntry = true
        loadingDot.layer.cornerRadius = 4
        loadingDot.isHidden = true

    }


    @IBAction func SignUpClicked(_ sender: Any) {
        loadingDot.isHidden = false
        loadingDot.startAnimating()
        let username = UserNameBox.text ?? "user"
        let email = EmailBox.text ?? "email"
        let password = PassBox.text ?? "pass"
        if usernameIsGood(username: username) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error as NSError? {
            print(error)
                self.errorLabel.isHidden = false
                self.errorLabel.text = error.localizedDescription
                self.loadingDot.isHidden = true
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
              
              //create user
              //push user to firestore
              
              var user = User()
              user.username = username
              user.email = email
              user.totalPoints = 0
              user.totalPlays = 0
              user.allPlayTimes = []
              user.allPlayScores = []
              user.lastPlayTime = nil
              user.lastPlayScore = 0
              
              
              
              
              
              self.performSegue(withIdentifier: "SignUpToMain", sender:self)
          }
            
        }
        }
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func usernameIsGood(username : String) -> Bool {
        if containsEmojis(string: username) { return false}
        return true
    }
    
    func containsEmojis(string: String) -> Bool {
        let forbiddenScalars = CharacterSet.symbols
        for scalar in string.unicodeScalars {
            if forbiddenScalars.contains(scalar) {
                return true
            }
        }
        return false
    }
}

