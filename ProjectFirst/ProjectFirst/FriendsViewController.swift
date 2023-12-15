import UIKit

class FriendsViewController: UITableViewController, NetworkServiceDelegate {
    private let networkService = NetworkServices()
    private var friends = [Friend]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Friends"
    
        networkService.friendsDelegate = self
        tableView.register(
            CustomFriendsTableViewCell.self,
            forCellReuseIdentifier: CustomFriendsTableViewCell.identifier
        )
        networkService.getFriends()
        
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
