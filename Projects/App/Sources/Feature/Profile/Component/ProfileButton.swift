import SwiftUI



struct ProfileButton<Trailer: View>: View {
    enum ButtonType {
        case primary, destructive
        
        var color: Color {
            switch self {
            case .primary: Color.common(.w0)
            case .destructive: Color.status(.destructive)
            }
        }
    }
    
    let title: String
    let type: ButtonType
    let action: (() -> ())?
    
    let trailer: Trailer
    
    init(title: String, type: ButtonType = .primary, action: (() -> Void)? = nil, @ViewBuilder trailer: @escaping () -> Trailer = { EmptyView() } ) {
        self.title = title
        self.type = type
        self.action = action
        self.trailer = trailer()
    }
    
    
    
    var body: some View {
        Button {
            if let action = action {
                action()
            }
        } label: {
            HStack(spacing: 0) {
                Text(title)
                    .font(.label(.bold))
                    .foregroundStyle(type.color)
                
                Spacer()
                
                
                trailer
                
                
            }
            
        }
        .padding(24)
        .background(Color.common(.w100))
    }
}

#Preview {
    ProfileButton(title: "d")
}
