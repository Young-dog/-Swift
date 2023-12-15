//
//  ViewController.swift
//  ProjectFirst
//
//  Created by Maxim Terekhin on 04.12.2023.
//

import UIKit
import WebKit

class ViewController: UIViewController  {
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView(frame: view.bounds)
        webView.navigationDelegate = self
        return webView
    } ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        
        let url = URL(string: "https://oauth.vk.com/authorize?client_id=51815231&redirect_uri=https://oauth.vk.com/blank.html&display=mobile&scope=262150&response_type=token")
        
        webView.load(URLRequest(url: url!))
    }
    
    private func setupViews() {
        view.addSubview(webView)
    }
    
    @objc func onTap() {
        navigationController?.pushViewController(TabBarController(), animated: true)
    }
    
   
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        let params = fragment.components(separatedBy: "&").map{$0.components(separatedBy: "=")}.reduce([String: String]()) { result, param in
            var dict = result
            let key = param[0]
            let value = param[1]
            dict[key] = value
            return dict
        }
        let token = params["access_token"]
        NetworkServices.token = token!
        decisionHandler(.cancel)
        webView.removeFromSuperview()
        onTap()
    }
}

#Preview {
    ViewController()
}

/*
 private let logo: UIImageView = {
     let image = UIImageView()
     image.image = UIImage(systemName: "person")
     //image.backgroundColor = .white
     image.tintColor = .white
     return image
 } ()
 
 private let labelTitle: UILabel = {
     let label = UILabel()
     label.backgroundColor = .white
     label.text = "Авторизация"
     label.textAlignment = .center
     label.font = UIFont.boldSystemFont(ofSize: 30)
     label.layer.masksToBounds = true
     label.layer.cornerRadius = 16
     return label
 } ()

 private let emailField : UITextField = {
     let field = UITextField()
     field.backgroundColor = .white
     field.placeholder = "Логин"
     field.font = UIFont.boldSystemFont(ofSize: 25)
     field.layer.masksToBounds = true
     field.layer.cornerRadius = 16
     return field
 } ()
 
 private let passwordField : UITextField = {
     let field = UITextField()
     field.backgroundColor = .white
     field.placeholder = "Пароль"
     field.font = UIFont.boldSystemFont(ofSize: 25)
     field.layer.masksToBounds = true
     field.layer.cornerRadius = 16
     return field
 } ()
 
 private let submitButton : UIButton = {
     let button = UIButton()
     button.setTitle("Войти", for: .normal)
     button.setTitleColor(.black, for: .normal)
     button.backgroundColor = .white
     button.layer.masksToBounds = true
     button.layer.cornerRadius = 16
     return button
 } ()
 
 override func viewDidLoad() {
     super.viewDidLoad()
     
     view.backgroundColor = .black
     setupView()
     setupConstraints()
     submitButton.addTarget(self, action: #selector(onTap), for: .touchUpInside)
 }

private func setupView() {
  view.addSubview(logo)
  view.addSubview(emailField)
  view.addSubview(passwordField)
  view.addSubview(labelTitle)
  view.addSubview(submitButton)
}

private func setupConstraints() {
  logo.translatesAutoresizingMaskIntoConstraints = false
  emailField.translatesAutoresizingMaskIntoConstraints = false
  passwordField.translatesAutoresizingMaskIntoConstraints = false
  labelTitle.translatesAutoresizingMaskIntoConstraints = false
  submitButton.translatesAutoresizingMaskIntoConstraints = false
  
  NSLayoutConstraint.activate([
      
      logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      logo.widthAnchor.constraint(equalToConstant: view.frame.size.width/2),
      logo.heightAnchor.constraint(equalToConstant: 80),
      
      labelTitle.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 40),
      labelTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      labelTitle.widthAnchor.constraint(equalToConstant: view.frame.size.width/1.1),
      labelTitle.heightAnchor.constraint(equalToConstant: view.frame.size.height/17),
      
      emailField.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 30),
      emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      emailField.widthAnchor.constraint(equalToConstant: view.frame.size.width/2),
      emailField.heightAnchor.constraint(equalToConstant: view.frame.size.height/17),
      
      passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 20),
      passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      passwordField.widthAnchor.constraint(equalToConstant: view.frame.size.width/2),
      passwordField.heightAnchor.constraint(equalToConstant: view.frame.size.height/17),
      
      submitButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 30),
      submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      submitButton.widthAnchor.constraint(equalToConstant: view.frame.size.width/1.5),
      submitButton.heightAnchor.constraint(equalToConstant: view.frame.size.height/17),
  ])
  
}
 */
