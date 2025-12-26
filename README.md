# SwiftUI Todo App

A simple and clean todo application built with SwiftUI and MVVM architecture. This project is intended as a practice playground for learning and experimenting with modern SwiftUI patterns.


## Preview

https://github.com/user-attachments/assets/f23e61c7-8465-49a5-b11f-e8eac5f6e651






## Features

- **Add todos** – Quickly create new tasks
- **Mark as complete** – Toggle task completion state
- **Delete todos** – Remove tasks you no longer need
- **SwiftUI-based UI** – Uses declarative UI and reactive updates


## Tech Stack

- **Language:** Swift
- **UI Framework:** SwiftUI
- **Platform:** iOS


## Requirements

- Xcode 15 or later
- iOS 17 SDK (or adjust deployment target as needed)


## Getting Started

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/swift_ui_practice.git
   ```

2. **Open the project in Xcode**
   - Open `swift_ui_practice.xcodeproj` or `.xcworkspace` (if you use Swift Package Manager/CocoaPods).

3. **Select a simulator or device** in Xcode.

4. **Build & run** the app with `Cmd + R`.


## Project Structure

- **`swift_ui_practice/`** – Main app source
  - **`View/`** – SwiftUI views (e.g. `TodoItemView.swift`)
  - **`Model/`** – Data models for todos (if present)
  - **`ViewModel/`** – State management / business logic (if present)


## Customization

- **Change app name & icons** in the Xcode project settings.
- **Modify UI** in the SwiftUI view files under `View/`.
- **Extend data model** to support due dates, priorities, or persistence (UserDefaults/CoreData/etc.).


## Roadmap / Ideas

- **Persistence** – Save todos between app launches
- **Sorting & filtering** – Show only completed / active tasks
- **Theming** – Light/Dark theme customizations
- **Animations** – Smooth transitions for adding/removing items


