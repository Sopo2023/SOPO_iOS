import SwiftUI
import SDS

struct SopoCardViewer: View {
    
    let screenSize = UIScreen.main.bounds.size
    
    let randomColor: [Color] = [.red, .green, .blue, .yellow]
    
    var body: some View {
        ZStack {
            ForEach(0..<10) { i in
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(randomColor.randomElement() ?? .gray)
                    .frame(
                        width: screenSize.width * 0.88,
                        height: screenSize.height * 0.2)
                    .shadow(color: .common(.w0).opacity(0.09), radius: 9, y: 3)
                    .offset(x: -8 * CGFloat(i), y: 4 * -CGFloat(i))
                    
            }
        }
        .overlay {
            VStack {
                
                Spacer()
                
                HStack() {
                    ForEach(0..<10) { i in
                        Circle()
                            .frame(width: 8, height: 8)
                            .foregroundStyle(i == 0 ? .status(.positive) : SopoColor.Pallete.Gray.w80.color)
                    }
                }
                
            }
            .padding(.vertical, 10)
            
        }
        
    }
}

#Preview {
    SopoCardViewer()
}
