import UIKit

class FriendsViewController: UITableViewController, NetworkServiceDelegate {
    private let networkService = NetworkServices()
    private var friends = [Friend]()
    
    private var navBar : UINavigationBar {
        let navBar = UINavigationBar()
        navBar.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 44)
        return navBar
    }
    
    private var button : UIBarButtonItem {
        let button = UIBarButtonItem()
        button.style = .plain
        button.target = self
        button.image = UIImage(systemName: "person")
        button.action = #selector(buttonTapped)
        return button
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(navBar)
        title = "Friends"
        self.navigationController?.navigationBar.barTintColor = UIColor.blue
           
           self.navigationItem.rightBarButtonItem = button
       
        networkService.friendsDelegate = self
        tableView.register(
            CustomFriendsTableViewCell.self,
            forCellReuseIdentifier: CustomFriendsTableViewCell.identifier
        )
        networkService.getFriends()
        
    }
    
    @objc func buttonTapped() {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.duration = 1.5
        animation.type = .fade
        self.navigationController?.view.layer.add(animation, forKey: nil)
        self.navigationController?.pushViewController(ProfileViewController(), animated: false)
    }
    
    func updateFriends(friends: [Friend]) {
        self.friends = friends
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CustomFriendsTableViewCell.identifier,
            for: indexPath
        ) as? CustomFriendsTableViewCell else {
            return UITableViewCell()
        }
        cell.configureCell(friend: friends[indexPath.row])
        return cell
    }
    
}

//#Preview {
//    FriendsViewController()
//}
