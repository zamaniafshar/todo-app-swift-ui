import SwiftUI

enum Theme: String, CaseIterable, Identifiable {
    case light = "Light"
    case dark = "Dark"
    
    var id: String { self.rawValue }
    
    var colorScheme: ColorScheme{
        switch self {
        case .light: return .light
        case .dark: return .dark
        }
    }
    
    var isDark: Bool {
        switch self {
            case .light: return false
            case .dark: return true
        }
    }
    
    mutating func toggle() {
       self =  self == .light ? .dark : .light
    }
}
