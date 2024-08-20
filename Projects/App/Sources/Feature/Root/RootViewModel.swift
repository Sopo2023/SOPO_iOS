import SwiftUI
import SDS

class RootViewModel: ObservableObject {
    
    static let shared = RootViewModel()
    
    @Published var path: [StackViewType] = .init()

    
    @Published var isAlert: Bool = false
    @Published var alertContent: Alert = .init(title: Text("알림"))
    
    @Published var tabSelection: SopoTabItem = .home
    
    
    let isDegug: Bool = false
    
    var isSigned: Bool {
        
        return isDegug || KeyChain.read() != nil
        
    }
    
    
    
  
    
    
    func openAlert(alert: @escaping () -> Alert) {
        
        alertContent = alert()
        
        isAlert = true
    }
    
}
