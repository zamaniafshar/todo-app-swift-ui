//
//  swift_ui_practiceApp.swift
//  swift_ui_practice
//
//  Created by Mac on 12/16/25.
//

import SwiftData
import SwiftUI

@main
struct swift_ui_practiceApp: App {
    let container: ModelContainer

    init() {
        do {
            container = try ModelContainer(for: TodoModel.self)
        } catch {
            fatalError("Failed to create ModelContainer")
        }
    }

    var body: some Scene {
        WindowGroup {
            TodoListView().environment(
                TodoListViewModel(
                    modelContainer: container
                )
            )
        }
    }
}
