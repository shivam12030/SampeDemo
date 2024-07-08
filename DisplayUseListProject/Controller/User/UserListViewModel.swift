import Foundation

protocol UserListProtocol{
    func getUserListData()
    func getusersDatacount() -> Int
    func getUsersForIndex(index:Int) -> UserData
    var vmStateCallBack:((UserListViewState)->())? { get set}
}

class UserListViewModel:UserListProtocol {
    var vmStateCallBack: ((UserListViewState) -> ())? = { _ in}
    var usersData: [UserData] = []
    
    func getUserListData() {
        APIManager.shared.getDataFromApi(APIConstants.userUrl) { userData in
            
            if userData.data?.isEmpty ?? true {
                self.vmStateCallBack?(.nodata)
                self.vmStateCallBack?(UserListViewState.error("No Data Found"))
            } else {
                self.usersData = userData.data ?? []
                self.vmStateCallBack?(.sucess)
            }
        }
    }
    
    func getusersDatacount() -> Int {
        usersData.count
    }
    
    func getUsersForIndex(index: Int) -> UserData {
        usersData[index]
    }

}

