import SwiftUI
import SDS

struct HomeCell<Bottom: View>: View {
    
    let icon: SopoIcon
    let title: String
    let content: Bottom
    
    
    init(icon: SopoIcon, title: String, @ViewBuilder content: @escaping () -> Bottom = { EmptyView() }) {
        self.icon = icon
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                Circle()
                    .foregroundStyle(Color.primary(.normal))
                    .frame(width: 30, height: 30)
                    .overlay {
                        icon.image
                            .resizable()
                            .foregroundStyle(Color.common(.w100))
                            .padding(8)
                    }
                
                Text(title)
                    .font(.pretendard(.bold, size: 15))
                
                Spacer()
                
                
                
                Button {
                    
                } label: {
                    Image(systemName: "chevron.right")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 12)
                        .foregroundStyle(Color.label(.assitive))
                }
                
            }
            
            
            content
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 24)
        .background(Color.common(.w100).clipShape(RoundedRectangle(cornerRadius: 12)))
    }
}

#Preview {
    VStack {
        HomeCell(icon: .alarm, title: "알림")
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.common(.w0))
    
}
