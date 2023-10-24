//
//  Task.swift
//  ScrumManagement
//
//  Created by Sandeep Khade on 24/10/23.
//

import Foundation


struct Task {
    
    let id: Int
    var name: String
    var description: String
    var isCompleted: Bool
    var finishDate: Date
    
    static func createTask() -> [Task] {
        
        return[
        
            Task(id: 1, name: "Home View", description: "Home view design with API configuration for all user details", isCompleted: false, finishDate: Date()),
            Task(id: 2, name: "User View", description: "User view with user details and tasks", isCompleted: true, finishDate: Date()),
            Task(id: 3, name: "API", description: "Web services for basic services", isCompleted: false, finishDate: Date()),
            Task(id: 4, name: "QA", description: "Sprint QA Planning", isCompleted: false, finishDate: Date()),

        ]
    }
    
}
