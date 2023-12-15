//
//  ProfileViewController.swift
//  ProjectFirst
//
//  Created by Maxim Terekhin on 15.12.2023.
//

import UIKit


class ProfileViewController : UIViewController, NetworkServiceProfileDelegate {
    func updateProfile(profile: Profile) {
        self.profile = profile
        
        let url = URL(string: profile.photo)
                
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url!) {
                        DispatchQueue.main.async {
                            self.logo.image = UIImage(data: data)
                            
                            self.labelTitle.text = "\(profile.lastName) \(profile.firstName)"
                        }
                    }
                    self.view.setNeedsDisplay()
                }
        
        self.view.setNeedsDisplay()
    }
    
    
    private let networkService = NetworkServices()
    
    private var profile = Profile(id: 0, photo: "", firstName: "", lastName: "")
    
    private let logo: UIImageView = {
        let image = UIImageView()
        //image.backgroundColor = .white
        image.tintColor = .black
        return image
    } ()
    
    private var labelTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkService.profileDelegate = self
        view.backgroundColor = .white
        setupView()
        setupConstraints()
        networkService.getProfile()
    }

   private func setupView() {
     view.addSubview(logo)
     view.addSubview(labelTitle)
   }

    private func setupConstraints() {
        logo.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.widthAnchor.constraint(equalToConstant: view.frame.size.width/2),
            logo.heightAnchor.constraint(equalToConstant: 80),
            
            labelTitle.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 40),
            labelTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelTitle.widthAnchor.constraint(equalToConstant: view.frame.size.width/1.1),
            labelTitle.heightAnchor.constraint(equalToConstant: view.frame.size.height/17),
            
        ])
    }
}
