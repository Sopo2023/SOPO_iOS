import SwiftUI

struct NavBarApperance {
    static func initBackground() {
        let navBarAppear = UINavigationBarAppearance()
        navBarAppear.backgroundColor = .white
        navBarAppear.shadowColor = .white
        
        UINavigationBar.appearance().standardAppearance = navBarAppear
        UINavigationBar.appearance().compactAppearance = navBarAppear
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppear
    }
    
}
