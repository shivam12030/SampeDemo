//
//  UserListOfflineviewModel.swift
//  DisplayUseListProject
//
//  Created by Neosoft on 02/07/24.
//

import Foundation
class UserListOfflineviewModel:UserListProtocol {
    var vmStateCallBack: ((UserListViewState) -> ())? = { _ in}
    
    var usersData:[UserData] = []
    
    func getUserListData() {
        takeTest()
        self.vmStateCallBack?(.loading("loading"))
        for i in 1...10{
            usersData.append(UserData(id: i, email: "Id\(i)@gmail.com", first_name: "Name\(i)", last_name: "Last Name\(i)", avatar: "https://www.google.com/"))
        }
        self.vmStateCallBack?(.sucess)
    }
    
    func getusersDatacount() -> Int {
        return usersData.count
    }
    
    func getUsersForIndex(index: Int) -> UserData {
        return usersData[index]
    }

    func takeTest() {
        let group = DispatchGroup()
        
        group.enter()
        taskOne()
        group.leave()
        
        group.enter()
        taskTwo()
        group.leave()
        
        group.enter()
        taskThree()
        group.leave()
        group.notify(queue: .main) {
            print("Completed...")
        }
    }
    
    func taskOne() {
        for _ in 0...120202 {
            print("one")
        }
    }
    
    func taskTwo() {
        for _ in 0...120202 {
            print("one")
        }
    }
    
    func taskThree() {
        for _ in 0...120202 {
            print("one")
        }
    }
    
}
