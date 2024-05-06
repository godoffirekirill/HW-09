
import UIKit



class FirstViewController: UIViewController {

    let nextButton = UIButton(type: .system)

     var usernameContainer = UsernameContainer(username: "")
    var onComplete: ((String) -> Void)?


    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        print(usernameContainer.username)
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

        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "SecondViewController")
        as? SecondViewController else {
            return
        }

        viewController.usernameContainer = usernameContainer
        viewController.onComplete = { [weak self] updatedUsername in
                    guard let self = self else { return }
                    self.usernameContainer.username = updatedUsername
                    print(usernameContainer.username)
                }
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)

    }
}

