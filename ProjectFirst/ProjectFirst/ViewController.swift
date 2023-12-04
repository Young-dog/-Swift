//
//  ViewController.swift
//  ProjectFirst
//
//  Created by Maxim Terekhin on 04.12.2023.
//

import UIKit

class ViewController: UIViewController {


    let label = UILabel()
    let loginField = UITextField()
       let passwordField = UITextField()
       let loginButton = UIButton()

       override func viewDidLoad() {
           super.viewDidLoad()
           createImageView()
           createTitleLabel()
           
           loginField.placeholder = "Логин"
           passwordField.placeholder = "Пароль"
           loginField.borderStyle = .roundedRect
           passwordField.borderStyle = .roundedRect
           
           loginButton.setTitle("Войти", for: .normal)
           loginButton.setTitleColor(.white, for: .normal)
           loginButton.backgroundColor = .blue
           loginButton.layer.cornerRadius = 5
           
           
        view.addSubview(label)
           view.addSubview(loginField)
           view.addSubview(passwordField)
           view.addSubview(loginButton)
           
           loginField.translatesAutoresizingMaskIntoConstraints = false
           passwordField.translatesAutoresizingMaskIntoConstraints = false
           loginButton.translatesAutoresizingMaskIntoConstraints = false
           
           NSLayoutConstraint.activate([
            
               loginField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               loginField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
               loginField.widthAnchor.constraint(equalToConstant: 200),
               
               passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               passwordField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
               passwordField.widthAnchor.constraint(equalToConstant: 200),
               
               loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 150),
               loginButton.widthAnchor.constraint(equalToConstant: 100),
               loginButton.heightAnchor.constraint(equalToConstant: 30)
           ])
       }

    func createTitleLabel() {
        let titleLabel = UILabel()
        titleLabel.text = "Авторизация"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    func createImageView() {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "yourImage")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }

}

#Preview {
    ViewController()
}
