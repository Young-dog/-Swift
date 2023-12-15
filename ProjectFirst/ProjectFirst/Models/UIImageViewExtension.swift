//
//  UIImageViewExtension.swift
//  ProjectFirst
//
//  Created by Maxim Terekhin on 15.12.2023.
//

import Foundation
import UIKit

extension UIImageView {

    
    func getImage(imageUrl: String) {
        
        print(imageUrl)
        guard let url = URL(string: "\(imageUrl)") else {return}
        
        let session = URLSession.shared
        
        session.dataTask(with: url) {
            data, _, _ in
            guard let data else {return}
            
            let  pictureUrl = try? JSONDecoder().decode(NetworkImgeModel.self, from: data).url
            
            guard let urlImage = URL(string: pictureUrl ?? "") else {return}
            
            session.dataTask(with: urlImage) { [weak self] data, _, _ in
                guard let data, let picture = UIImage(data: data) else {return}
                DispatchQueue.main.async {
                    self?.image = picture
                }
            
        
                
            }.resume()
            
        }.resume()
    }
}
