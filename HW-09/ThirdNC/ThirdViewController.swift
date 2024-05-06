

import UIKit

class ThirdViewController: UIViewController {

    let nextButton = UIButton(type: .system)
    let textField = UITextField()
    let label = UILabel()
    let secondLabel = UILabel()
    let secondTextField = UITextField()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        setupTextField()
        setupLabel()
        setupSecondTextField()
        setupSecondLabel()
        textField.delegate = self
        secondTextField.delegate = self
    }


    func setupButton() {
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.backgroundColor = .blue
        nextButton.layer.cornerRadius = 25

        nextButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nextButton)
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 200),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)

    }
    func setupTextField() {
        // Basic properties
        textField.placeholder = "Enter text here"
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
    func setupSecondTextField() {

        // Basic properties
        secondTextField.placeholder = "Enter more text here"
        secondTextField.borderStyle = .roundedRect
        secondTextField.font = UIFont.systemFont(ofSize: 15)

        // Layout
        secondTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(secondTextField)

        // Add constraints
        NSLayoutConstraint.activate([
            secondTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondTextField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20), // 20 points below the label
            secondTextField.widthAnchor.constraint(equalToConstant: 250),
            secondTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    func setupLabel() {
        label.text = "Label"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0

        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)

        // Add constraints
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            label.widthAnchor.constraint(equalToConstant: 250),
            label.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    func setupSecondLabel() {

        // Basic properties
        secondLabel.text = "Second Label"
        secondLabel.textColor = .black
        secondLabel.font = UIFont.systemFont(ofSize: 16)
        secondLabel.textAlignment = .center
        secondLabel.numberOfLines = 0

        // Layout
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(secondLabel)

        // Add constraints
        NSLayoutConstraint.activate([
            secondLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 80), // 20 points below the second text field
            secondLabel.widthAnchor.constraint(equalToConstant: 250),
            secondLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }



    @IBAction func nextButtonTapped(_ sender: UIButton) {

        if let vc = storyboard?.instantiateViewController(withIdentifier: "ThirdOneViewController") as? ThirdOneViewController {
            self.navigationController?.pushViewController(vc, animated: true)
            self.modalPresentationStyle = .fullScreen
            self.modalTransitionStyle = .flipHorizontal
           // vc.textLabel = "dsd"
            vc.textLabel = self.label.text
            vc.delegate = self
            vc.secondLabelChanged = {[weak self] newlabel in
                guard let self = self else {return}
                self.secondLabel.text = newlabel
            }
            }

        //   vc.text = "dfdfd"


        //        vc.modalPresentationStyle = .fullScreen
        //        vc.modalTransitionStyle = .flipHorizontal
        //        self.present(vc, animated: true,completion: nil)

    }
}
extension ThirdViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Dismiss the keyboard when the user presses "return"
//        textField.resignFirstResponder()
        if textField == self.textField {
            secondTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true

    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        // Optionally handle any logic after text editing finishes
//        label.text = "\(textField.text ?? "")"
//        print("User entered: \(textField.text ?? "")")
        if textField == self.textField { // Check if it's the first text field
                    label.text = textField.text
                } else if textField == secondTextField { // Check if it's the second text field
                    secondLabel.text = textField.text
                }
    }
}
extension ThirdViewController: ThirdFiveViewControllerDelegate {
    func updateLabel(to textLabel: String) {
        label.text = textLabel
        textField.text = textLabel

    }

}
