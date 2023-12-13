import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabBarController = UITabBarController()
        
        let firstViewController = FriendsViewController()
        
        let secondViewController = GroupsViewController()
        
        let thirdViewController = PhotosViewController()

        
        firstViewController.tabBarItem.title = "Friends"
        
        secondViewController.tabBarItem.title = "Groups"
        
        thirdViewController.tabBarItem.title = "Photos"
        // Создание контроллера навигации для каждой вкладки
        let firstNavigationController = UINavigationController(rootViewController: firstViewController)
        let secondNavigationController = UINavigationController(rootViewController: secondViewController)
        let thirdNavigationController = UINavigationController(rootViewController: thirdViewController)
        
        self.viewControllers = [firstNavigationController, secondNavigationController, thirdNavigationController]
        
        self.tabBar.tintColor = UIColor.black // Цвет активной вкладки
        self.tabBar.barTintColor = UIColor.black
        
        tabBarController.tabBar.barTintColor = UIColor.black

        
    }
}
