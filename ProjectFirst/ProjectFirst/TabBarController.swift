import UIKit

class TabBarController: UITabBarController {
    
    let friendsViewController = FriendsViewController()
    
    let groupsViewController = GroupsViewController()
    
    let photosViewController = PhotosViewController( collectionViewLayout: UICollectionViewFlowLayout())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        friendsViewController.tabBarItem = UITabBarItem(title: "Friends", image: UIImage(systemName: "person"), tag: 2)
        
                
        groupsViewController.tabBarItem = UITabBarItem(title: "Groups", image: UIImage(systemName: "person"), tag: 2)
                
        
        photosViewController.tabBarItem = UITabBarItem(title: "Photos", image: UIImage(systemName: "person"), tag: 2)
        
        let friendsNavigationController = UINavigationController(rootViewController: friendsViewController)
        let groupsNavigationController = UINavigationController(rootViewController: groupsViewController)
        let photosNavigationController = UINavigationController(rootViewController: photosViewController)
                
        self.viewControllers = [friendsNavigationController, groupsNavigationController, photosNavigationController]
        
        let appearance = UITabBarItem.appearance()
               let attributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
               appearance.setTitleTextAttributes(attributes, for: .normal)
        

        
        
    }
}

#Preview {
    TabBarController()
}
