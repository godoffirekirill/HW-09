//
//  ViewController.swift
//  HW-09
//
//  Created by Кирилл Курочкин on 27.04.2024.
//

import UIKit

class UsernameContainer {
    var username: String

    init(username: String) {
        self.username = username
    }
}


class ViewController: UIViewController {

    var label = UILabel()
     var usernameContainer = UsernameContainer(username: "")


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tabbar()
        setupLabel()

    }

    func setupLabel() {
       label.text = "Hello \(usernameContainer.username)"
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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        label.text = "Hi, \(usernameContainer.username)"
        
    }

    func tabbar() {
        let tabbar = UITabBarController()

        guard  let vc2 = storyboard?.instantiateViewController(withIdentifier: "NavigationController1") as? UINavigationController else {return}
        guard  let vc3 = storyboard?.instantiateViewController(withIdentifier: "NavigationController3") as? UINavigationController else {return}
        guard  let vc4 = storyboard?.instantiateViewController(withIdentifier: "NavigationController4") as? UINavigationController else {return}


        let vc1 = ViewController()
        
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "FirstViewController")
        as? FirstViewController else {
            return
        }

        viewController.usernameContainer = usernameContainer
        viewController.onComplete = { [weak self] updatedUsername in
                    guard let self = self else { return }
                    self.usernameContainer.username = updatedUsername
                    print(usernameContainer.username)
                }
        vc1.title = "firs"
        vc2.title = "secod"
        viewController.title = "secod"

        vc3.title = "third"
        vc4.title = "four"
            tabbar.setViewControllers([vc1,viewController,vc3,vc4], animated: false)
            tabbar.modalPresentationStyle = .fullScreen
            present(tabbar,animated: true)
    }


    }




