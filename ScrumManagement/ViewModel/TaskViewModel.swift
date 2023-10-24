//
//  TaskViewModel.swift
//  ScrumManagement
//
//  Created by Sandeep Khade on 24/10/23.
//

import Foundation


final class TaskViewModel : ObservableObject {
    
    @Published var tasks: [Task] = []
    private var tempTask = Task.createTask()
    
    func getTasks(isActive: Bool) {
        tasks = tempTask.filter({$0.isCompleted == !isActive} )
    }
    
    func addTask(task: Task) -> Bool {
        let taskId = Int.random(in: 5...100)
        let taskToAdd = Task(id: taskId, name: task.name, description: task.description, isCompleted: false, finishDate: task.finishDate)
        tempTask.append(taskToAdd)
        return true
    }
    
    func updateTask(task: Task) -> Bool {
        if let index = tempTask.firstIndex(where: {$0.id == task.id}) {
            tempTask[index].name = task.name
            tempTask[index].description = task.description
            tempTask[index].isCompleted = task.isCompleted
            tempTask[index].finishDate = task.finishDate
            return true
        }
        return false
    }
    
    func deleteTask(task: Task) -> Bool {
        if let index = tempTask.firstIndex(where: {$0.id == task.id}) {
            tempTask.remove(at: index)
            return true
        }
        return false
    }
}
