import UIKit

class SignUpVC: UIViewController {

    @IBOutlet weak var submitbtn: UIButton!
    @IBOutlet weak var t3: UITextField!
    @IBOutlet weak var t2: UITextField! // Password field
    @IBOutlet weak var t1: UITextField! // Email field
   // var completion : (([String : String]) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Load saved value
    /*      t1.text = UserDefaults.standard.string(forKey: "user_email") ?? ""
        t2.text = UserDefaults.standard.string(forKey: "user_password") ?? ""*/
        self.navigationItem.hidesBackButton = true

        // UI setup for text fields and button
        let fields = [t1, t2, t3]
        for field in fields {
            field?.layer.cornerRadius = 15.0
            field?.layer.masksToBounds = true
            field?.layer.borderColor = UIColor.gray.cgColor
            field?.layer.borderWidth = 1.0
            if let placeholder = field?.placeholder {
                field?.attributedPlaceholder = NSAttributedString(
                    string: placeholder,
                    attributes: [.foregroundColor: UIColor.lightGray]
                )
            }
        }
        submitbtn.layer.cornerRadius = 25.0
    }

    // MARK: - Validation functions

    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }

    func isValidPassword(_ password: String) -> Bool {
        return password.count >= 6
    }

    func showAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK I Understand", style: .default))
        present(alert, animated: true)
    }

    // MARK: - Actions

    @IBAction func signin(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func createpf(_ sender: Any) {
      /*  let vc = self.storyboard?.instantiateViewController(identifier: "CreateProfileVC") as! CreateProfileVC
        self.navigationController?.pushViewController(vc, animated: true) */
    }

    @IBAction func SignUp(_ sender: UIButton) {
        let email = t1.text ?? ""
        let password = t2.text ?? ""
        let confirmPassword = t3.text ?? ""
        
        // Validation
        if !isValidEmail(email) {
            showAlert("Invalid Email", "Please enter a valid email address.")
            return
        }
        if !isValidPassword(password) {
            showAlert("Invalid Password", "Password must be at least 6 characters.")
            return
        }
        if password != confirmPassword {
            showAlert("Password is not Same as Entered Password ", "Password and Confirm Should be Same ")
        }
        
        // Retrieve existing accounts or create empty array if none
        var accounts = UserDefaults.standard.array(forKey: "user_accounts") as? [[String: String]] ?? []
        print(accounts)
        // Check if email already registered
        if accounts.contains(where: { $0["email"] == email }) {
            showAlert("Account Exists", "An account with this email already exists.")
            return
        }
        accounts.append(["email": email, "password": password])
        UserDefaults.standard.set(accounts, forKey: "user_accounts")
        UserDefaults.standard.set(email, forKey: "current_user_email")

        // Append new account
      /*  let newAccount : [String:String] = ["email": email, "password": password]
        accounts.append(newAccount)
        
        // Save updated accounts array
        UserDefaults.standard.set(accounts, forKey: "user_accounts")*/
       
        // Clear fields for next entry
        t1.text = ""
        t2.text = ""
        t3.text = ""
        // Save to UserDefaults
        // Navigate to CreateProfileVC for this user
        let vc = storyboard?.instantiateViewController(identifier: "CreateProfileVC") as! CreateProfileVC
        // Save current user email before navigating to profile creation
      //  UserDefaults.standard.set(email, forKey: "current_user_email")

        navigationController?.pushViewController(vc, animated: true)
        
        /* let data: [String:String] = [
         "field1": email,
         "field2": password,
         "field3" : confirmPassword
         ]*/
        //   completion?(data)
        //  self.navigationController?.popViewController(animated: true)
        
    }
}

