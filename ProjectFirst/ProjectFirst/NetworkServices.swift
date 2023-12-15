//
//  NetworkServices.swift
//  ProjectFirst
//
//  Created by Maxim Terekhin on 15.12.2023.
//

import Foundation

protocol NetworkServiceDelegate: AnyObject {
    func updateFriends(friends: [Friend])
}

protocol NetworkServiceGroupsDelegate : AnyObject {
    func updateGroups(groups: [Group])
}

protocol NetworkServicePhotosDelegate : AnyObject {
    func updatePhotos(photos: [Size])
}

class NetworkServices {
    private let session = URLSession.shared
    weak var friendsDelegate: NetworkServiceDelegate?
    weak var groupsDelegate: NetworkServiceGroupsDelegate?
    weak var photosDelegate: NetworkServicePhotosDelegate?
    
    static var token = ""
    
    func getFriends() {
        guard let url = URL(string: "https://api.vk.com/method/friends.get?access_token=\(NetworkServices.token)&v=5.199&fields=first_name,last_name,photo_200_orig,online") else {
            return
        }
        
        session.dataTask(with: url) {
            [weak self] data, response, error in guard let data else {return}
            
            do {
                let friendsList = try JSONDecoder().decode(FriendsResult.self, from: data)
                self?.friendsDelegate?.updateFriends(friends: friendsList.response.items)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    
    func getGroups() {
        guard let url = URL(string: "https://api.vk.com/method/groups.get?access_token=\(NetworkServices.token)&v=5.199&extended=1&fields=description") else {return}
        
        session.dataTask(with: url) {
            [weak self] data, response, error in guard let data else {return}
            
            do {
                let groups = try JSONDecoder().decode(GroupsResult.self, from: data)
                self?.groupsDelegate?.updateGroups(groups: groups.response.items)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func getImages() {
        guard let url = URL(string: "https://api.vk.com/method/photos.getProfile?access_token=\(NetworkServices.token)&v=5.199") else {return}
        
        session.dataTask(with: url) {
            [weak self] data, response, error in guard let data else {return}
            
            do {
                let photos = try JSONDecoder().decode(ProfilePhotosResult.self, from: data).response.items
                var sizes = [Size]()
                photos.forEach{ph in
                    ph.sizes.forEach{ s in
                        sizes.append(s)
                    }
                    
                }
                
                self?.photosDelegate!.updatePhotos(photos: sizes)
                
            } catch {
                print(error)
            }
        }.resume()
        
    }
}
