//
//  ToDosViewModel.swift
//  ToDoList00
//
//  Created by Christian Manzaraz on 06/01/2024.
//

import Foundation
import SwiftData

@Model
class ToDo {
    @Attribute(.unique) var item = ""
    var reminderIsOn = false
    var dueDate = Date.now // + (60*60*24) //MARK: let's test if i can a create a new ToDo since today.
    var notes = ""
    var isCompleted = false
    
    init(item: String = "", reminderIsOn: Bool = false, dueDate: Date = .now , notes: String = "", isCompleted: Bool = false) {
        self.item = item
        self.reminderIsOn = reminderIsOn
        self.dueDate = dueDate
        self.notes = notes
        self.isCompleted = isCompleted
    }
    
}
