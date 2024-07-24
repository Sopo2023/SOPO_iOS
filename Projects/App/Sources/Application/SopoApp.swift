import SwiftUI
import SDS

@main
struct SopoApp: App {
    init() {
        SopoFont.Pretendard.loadFont()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

