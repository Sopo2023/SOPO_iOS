import SwiftUI
import SDS

@main
struct SopoApp: App {
    init() {
        SopoFont.Pretendard.loadFont()
        NavBarApperance.initBackground()
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        
    }
}

