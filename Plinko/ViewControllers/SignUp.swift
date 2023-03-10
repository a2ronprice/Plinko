import UIKit
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

var user = User()
let db = Firestore.firestore()


class SignUp: UIViewController {

    @IBOutlet var UserNameBox: UITextField!
    @IBOutlet var PassBox: UITextField!
    @IBOutlet var EmailBox: UITextField!
    @IBOutlet var errorLabel: UILabel!
    @IBOutlet var loadingDot: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.numberOfLines = 0
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
        if dataIsClean(username: username) {
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
                            user.username = username
                            user.email = email
                            user.totalPoints = 0
                            user.totalPlays = 0
                            user.allPlayTimes = []
                            user.allPlayScores = []
                            user.lastPlayTime = nil
                            user.lastPlayScore = 0
                            db.collection("users").document(user.email).setData([
                                "username": user.username,
                                "total-points": user.totalPoints,
                                "total-plays": user.totalPlays,
                                "last-play-time": user.lastPlayTime,
                                "last-play-score": user.lastPlayScore,
                                "all-play-times": user.allPlayTimes,
                                "all-play-scores": user.allPlayScores
                                
                            ]) { err in
                                if let err = err {
                                    print("Error writing document: \(err)")
                                } else {
                                    print("Document successfully written!")
                                }
                            }
                            
                            self.performSegue(withIdentifier: "SignUpToMain", sender:self)
                        }
                    }
                }
                
            }
        } else {
            errorLabel.isHidden = false
            errorLabel.text = "Invalid Username \n Remove Special Characters"
            loadingDot.isHidden = true
            print("Bad Username")
            
        }
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func dataIsClean(username: String) -> Bool {
        if username == "" {return false} // if username is empty - error
        let allowedScalars = CharacterSet.alphanumerics
        for scalar in username.unicodeScalars {
            if allowedScalars.contains(scalar) != true {
                return false // block non-alphanumerics from use in username
            }
        }
        return true
    }
}


