//
//  ThirdThreeViewController.swift
//  HW-09
//
//  Created by Кирилл Курочкин on 29.04.2024.
//

import UIKit

class ThirdThreeViewController: UIViewController {

    let nextButton = UIButton(type: .system)
    var textLabel: String?
    weak var delegate: ThirdFiveViewControllerDelegate?

    var secondLabelChanged: (String) -> Void = { _ in }


    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        print(textLabel ?? "")

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
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ThirdFourViewController")
                as? ThirdFourViewController else {
                    return
                }
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .flipHorizontal
        vc.textLabel = self.textLabel
        vc.delegate = delegate
        vc.secondLabelChanged = secondLabelChanged

        self.navigationController?.pushViewController(vc, animated: true)
    }

}
