import SwiftUI
import SDS

struct STJView: View {
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    STJCell()
                }
            }
            
        }
        .padding(.horizontal, 28)
    }
}

#Preview {
    NavigationView {
        STJView()
    }
}
