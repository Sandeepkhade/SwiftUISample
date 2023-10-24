//
//  HomeView.swift
//  ScrumManagement
//
//  Created by Sandeep Khade on 24/10/23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var pickerFilters: [String] = ["Active","Closed"]
    @StateObject var taskViewModel : TaskViewModel = TaskViewModel()
    @State private var defaultPickerSelectedItem: String = "Active"
    @State private var showAddTaskView: Bool = false
    @State private var showTaskDetail: Bool = false
    @State private var selectedTask: Task = Task(id: 0, name: "", description: "", isCompleted: false, finishDate: Date())
    @State private var refreshTaskList: Bool = false
    
    var body: some View {
        NavigationStack{
            
            Picker("Picker Filter", selection: $defaultPickerSelectedItem) {
                ForEach(pickerFilters, id: \.self){
                    Text($0)
                }
            }.pickerStyle(.segmented)
                .onChange(of: defaultPickerSelectedItem) { newValue in taskViewModel.getTasks(isActive: defaultPickerSelectedItem == "Active")
                }
            
            List(taskViewModel.tasks, id: \.id){ task in
                
                VStack (alignment: .leading){
                    Text(task.name).font(.title)
                    
                    HStack{
                        
                        Text(task.description).font(.subheadline).lineLimit(2)
                        Spacer()
                        Text(task.finishDate.toString()).font(.subheadline)
                    }
                }.onTapGesture {
                    selectedTask = task
                    showTaskDetail.toggle()
                }
            }.onAppear{
                taskViewModel.getTasks(isActive: true)
            }
            .onChange(of: refreshTaskList, perform: {_ in
                taskViewModel.getTasks(isActive: defaultPickerSelectedItem == "Active")
            })
            .listStyle(.plain)
                .navigationTitle("Tickets")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showAddTaskView = true
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showAddTaskView) {
                    AddTaskView(taskViewModel: taskViewModel, showAddTaskView: $showAddTaskView, refreshTaskList: $refreshTaskList)
                    
                }
                .sheet(isPresented: $showTaskDetail) {
                    TaskListView(taskViewModel: taskViewModel, selectedTask: $selectedTask, showTaskDetail: $showTaskDetail, refreshTaskList: $refreshTaskList)
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
