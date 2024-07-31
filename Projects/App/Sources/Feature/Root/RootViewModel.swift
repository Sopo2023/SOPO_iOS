import SwiftUI
import SDS

class RootViewModel: ObservableObject {
    
    var isSigned: Bool {
        
        return KeyChain.read() != nil
    }
    
    
    
    @Published var tabSelection: SopoTabItem = .home
    
    @Published var signTab: SignType = .onboard
  
    
    
    
}
