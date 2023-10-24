//
//  TaskListView.swift
//  ScrumManagement
//
//  Created by Sandeep Khade on 24/10/23.
//

import SwiftUI

struct TaskListView: View {
    
    @ObservedObject var taskViewModel : TaskViewModel
    @Binding var selectedTask: Task

    @Binding var showTaskDetail: Bool
    @Binding var refreshTaskList: Bool

    var body: some View {
        NavigationStack {
            List{
                
                Section(header: Text("Task Details")){
                    TextField("Task Name", text: $selectedTask.name)
                    TextEditor(text: $selectedTask.description).font(.footnote)
                    Toggle("Mark Completed", isOn: $selectedTask.isCompleted)
                }
                Section(header: Text("Task date/time")){
                    DatePicker("Task date", selection: $selectedTask.finishDate)
                }
                
                Section {
                    Button{
                        if(taskViewModel.deleteTask(task: selectedTask)){
                            showTaskDetail.toggle()
                            refreshTaskList.toggle()
                        }
                    } label: {
                        Text("Delete")
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
            }
            .navigationTitle("Task Details")
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        showTaskDetail.toggle()
                    } label: {
                        Text("Cancel")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        if(taskViewModel.updateTask(task: selectedTask)){
                            showTaskDetail.toggle()
                            refreshTaskList.toggle()
                        }
                    } label: {
                        Text("Update")
                    }
                }
            }
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView(taskViewModel: TaskViewModel(), selectedTask: .constant(Task.createTask().first!), showTaskDetail: .constant(false), refreshTaskList: .constant(false))
    }
}
