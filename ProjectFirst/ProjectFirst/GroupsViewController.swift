import UIKit

class GroupsViewController: UITableViewController, NetworkServiceGroupsDelegate  {
    
    private let networkService = NetworkServices()
    private var groups = [Group]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkService.groupsDelegate = self
        title = "Groups"
        tableView.register(
            CustomGroupsTableViewCell.self,
            forCellReuseIdentifier: CustomGroupsTableViewCell.identifier
        )
        networkService.getGroups()
        
    }
    
    func updateGroups(groups: [Group]) {
        self.groups = groups
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CustomGroupsTableViewCell.identifier,
            for: indexPath
        ) as? CustomGroupsTableViewCell else {
            return UITableViewCell()
        }
        cell.configureCell(group: groups[indexPath.row])
        return cell
    }
    
}

//#Preview {
//    GroupsViewController()
//}
