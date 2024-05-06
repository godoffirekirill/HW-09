

import UIKit

class SecondViewController: UIViewController {

    let textField = UITextField()
    let backButton = UIButton(type: .system)

    var onComplete: ((String) -> Void)?
    var usernameContainer: UsernameContainer?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
        setupButton()
        textField.delegate = self
        textField.text = Manager.shared.username
        
    }
    


    func setupTextField() {
        // Basic properties
        textField.placeholder = "Enter user name here"
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 15)

        // Layout
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)

        // Add constraints
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            textField.widthAnchor.constraint(equalToConstant: 250),
            textField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    func setupButton() {
        backButton.setTitle("Done", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        backButton.backgroundColor = .blue
        backButton.layer.cornerRadius = 25

        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 200),
            backButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)

    }
    @IBAction func backButtonTapped(_ sender: UIButton) {
    //    delegate?.updateLabel(to: textField.text ?? "")
      //  self.navigationController?.popToRootViewController(animated: true)
      //  self.navigationController?.popViewController(animated: true)
      //  usernameContainer?.username = textField.text ?? ""
       // self.dismiss(animated: true, completion: nil)
        onComplete?(textField.text ?? "")  // Execute the closure with the updated text


        
              dismiss(animated: true, completion: nil)
    }
}
extension SecondViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //  Dismiss the keyboard when the user presses "return"
        textField.resignFirstResponder()

        return true

    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        // Optionally handle any logic after text editing finishes
        textField.text = "\(textField.text ?? "")"
        print("User entered: \(textField.text ?? "")")
        Manager.shared.username = textField.text ?? ""
        

    }
}

