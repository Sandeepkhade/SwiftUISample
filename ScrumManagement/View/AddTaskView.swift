//
//  AddTaskView.swift
//  ScrumManagement
//
//  Created by Sandeep Khade on 24/10/23.
//

import SwiftUI

struct AddTaskView: View {
    
    @ObservedObject var taskViewModel : TaskViewModel
    @State private var taskToAdd: Task = Task(id: 0, name: "", description: "", isCompleted: false, finishDate: Date())
    
    @Binding var showAddTaskView: Bool
    @Binding var refreshTaskList: Bool

    var body: some View {
        
        NavigationStack {
            List{
                
                Section(header: Text("Task Details")){
                    TextField("Task Name", text: $taskToAdd.name)
                    TextField("Description", text: $taskToAdd.description)

                }
                Section(header: Text("Task date/time")){
                    DatePicker("Task date", selection: $taskToAdd.finishDate)
                }
                
            }
            .navigationTitle("Add Task")
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        showAddTaskView.toggle()
                    } label: {
                        Text("Cancel")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        if(taskViewModel.addTask(task: taskToAdd)) {
                            showAddTaskView.toggle()
                            refreshTaskList.toggle()
                        }
                    } label: {
                        Text("Add")
                    }
                }
            }
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(taskViewModel: TaskViewModel(), showAddTaskView: .constant(false), refreshTaskList: .constant(false))
    }
}
