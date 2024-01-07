//
//  ToDosViewModel.swift
//  ToDoList00
//
//  Created by Christian Manzaraz on 06/01/2024.
//

import Foundation

class ToDosViewModel: ObservableObject {
    @Published var toDos: [ToDo]  = []
    
    init() {
        // Temp Data here. Will eventually load in saved data
        toDos.append(ToDo(item: "Learn Swift"))
        toDos.append(ToDo(item: "Build Apps"))
        toDos.append(ToDo(item: "Change the World!"))
    }
    
    func saveToDo(toDo: ToDo, newToDo: Bool) {
        if newToDo {
            toDos.append(toDo)            
        } else {
            if let index = toDos.firstIndex(where: {$0.id == toDo.id}) {
                toDos[index] = toDo
            }
        }
    }
    
    func delete(indexSet: IndexSet) {
        toDos.remove(atOffsets: indexSet)
    }
    
    func move(indices: IndexSet, newOffset: Int) {
        toDos.move(fromOffsets: indices, toOffset: newOffset)

    }
}
