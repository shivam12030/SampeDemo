import UIKit

//protocol NotifyUserResonse: AnyObject {
//    func getUserDataSuccessfully(userData: [UserData])
//}

class UserViewController: UIViewController {
    // MARK: - IBOutlets property
    @IBOutlet weak var userListTableView: UITableView!
    
      // MARK: - Instance properties
    var userListVM:UserListProtocol?
    var isOffline = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registeCell()
        if isOffline {
            userListVM = UserListOfflineviewModel()
        }
        else{
            userListVM = UserListViewModel()
        }
        
      // MARK: - Call Bind method 
        self.bindViewModel()
        self.userListVM?.getUserListData()
    }
    func bindViewModel(){
        userListVM?.vmStateCallBack = { state in
            switch(state){
            case .loading(let msg):
                print("Show progreess bar \(msg)")
            case .sucess:
                print("Hide progreess bar")
                DispatchQueue.main.async {
                  self.userListTableView.reloadData()
                }
            case .error (let error):
                print("Hide progreess bar", error)
            case .nodata:
                print("show no data found")
            }
        }
    }
      // MARK: - Register cell
    private func registeCell() {
        userListTableView.register(UINib(nibName: AppConstants.userCell, bundle: nil), forCellReuseIdentifier: AppConstants.userCell)
    }
}

  // MARK: - UITableViewDataSource method
extension UserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userListVM?.getusersDatacount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.userCell, for: indexPath) as? UserTableViewCell
        guard let data = userListVM?.getUsersForIndex(index: indexPath.row) else { return UITableViewCell()}
        cell?.setupUI(data: data)
        return cell ?? UITableViewCell()
    }
}
