//  ToDoListView.swift
//  ToDoList00
//
//  Created by Christian Manzaraz on 05/01/2024.
//

import SwiftUI

struct ToDoListView: View {
    @State private var sheetIsPressented = false
    @EnvironmentObject var toDosVM: ToDosViewModel

    var body: some View {
        NavigationStack {
            List {
                if toDosVM.toDos.count == 0 {
                  Text("There is nothing \"To Do\".")
                } else {
                    ForEach(toDosVM.toDos) { toDo in
                        HStack {
                            Image(systemName: toDo.isCompleted ?  "checkmark.circle.fill" : "circle")
                                .onTapGesture {
                                    toDosVM.toggleCompleted(toDo: toDo)
                                }
                                .foregroundStyle(toDo.isCompleted ? Color.green : Color.gray)
                            
                            NavigationLink {
                                DetailView(toDo: toDo)
                            } label: {
                                Text(toDo.item)
                            }
                            .font(.title2)
                        }
                    }
                    // Shorthand calls to .onDelete and onMove here.
                    .onDelete(perform: toDosVM.deleteToDo)
                    .onMove(perform: toDosVM.moveToDo)
                    //                .onDelete(perform: toDosVM.delete(indexSet:))
                    //                .onMove(perform: toDosVM.move(indices:newOffset:))
                    
                    //Traditional calls are bellow
                    //                .onDelete { indexSet in
                    //                    toDosVM.delete(indexSet: indexSet)
                    //                }
                    //                .onMove { indices, newOffset in
                    //                    toDosVM.move(indices: indices, newOffset: newOffset)
                    //                }
                    
                }
            }
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        sheetIsPressented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $sheetIsPressented) {
                NavigationStack {
                    DetailView(toDo: ToDo()) // New value
                }
            }        
        }
    }
}


#Preview {
    ToDoListView()
        .environmentObject(ToDosViewModel())
}

