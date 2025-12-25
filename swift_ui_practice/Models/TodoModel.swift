//
//  TodoModel.swift
//  swift_ui_practice
//
//  Created by Mac on 12/18/25.
//

import Foundation
import SwiftData

@Model
class TodoModel: Identifiable {
    #Unique<TodoModel>([\.id])

    var id: UUID = UUID()
    var title: String
    var todDesc: String
    var isCompleted: Bool
    var createdAt:Date

    init(title: String, todDesc: String = "", isCompleted: Bool = false) {
        self.title = title
        self.todDesc = todDesc
        self.isCompleted = isCompleted
        self.createdAt=Date()
    }

    func toggleCompleted() {
        isCompleted.toggle()
    }
}
