//
//  ThirdFiveViewController.swift
//  HW-09
//
//  Created by Кирилл Курочкин on 29.04.2024.
//

import UIKit

protocol ThirdFiveViewControllerDelegate: AnyObject {
    func updateLabel(to textLabel: String)
}

class ThirdFiveViewController: UIViewController {

    let nextButton = UIButton(type: .system)
    var label = UILabel()
    var textLabel: String?
    let textField = UITextField()
    let secondLabel = UILabel()
    let secondTextField = UITextField()

    weak var delegate:ThirdFiveViewControllerDelegate?

    var secondLabelChanged: (String) -> Void = { _ in }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        setupTextField()
        setupLabel()
        setupSecondTextField()
        setupSecondLabel()
        label.text = textLabel
        textField.delegate = self
        secondTextField.delegate = self
        textField.text = textLabel
    }


    func setupButton() {
        nextButton.setTitle("Back", for: .normal)
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
        delegate?.updateLabel(to: textField.text ?? "")
        self.navigationController?.popToRootViewController(animated: true)
    }
}
extension ThirdFiveViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Dismiss the keyboard when the user presses "return"
//        textField.resignFirstResponder()
//        secondTextField.resignFirstResponder()
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
//        secondLabel.text = "\(secondTextField.text ?? "")"
//        print("User entered: \(textField.text ?? "")")
        if textField == self.textField { // Check if it's the first text field
                    label.text = textField.text
                } else if textField == secondTextField { // Check if it's the second text field
                    secondLabelChanged(secondTextField.text ?? "")
                    secondLabel.text = textField.text
                }
    }

}
