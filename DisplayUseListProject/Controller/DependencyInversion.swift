//
//  DependencyInversion.swift
//  DisplayUseListProject
//
//  Created by Neosoft on 02/07/24.
//

import Foundation

protocol DisplayLog {
    func log(message: String)
}

class consoleLogger: DisplayLog {
    func log(message: String) {
        print(message)
    }
}

class FileLogger: DisplayLog {
    func log(message: String) {
        print(message)
    }
}
