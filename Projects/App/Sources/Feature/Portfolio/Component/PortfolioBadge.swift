import SwiftUI
import SDS

struct PortfolioBadge: View {
    
    let caption: String
    
    init(caption: String) {
        self.caption = caption
    }

    var body: some View {
        Text(caption)
            .foregroundStyle(SopoColor.Pallete.Gray.w20.color)
            .font(.caption(.medium))
            .padding(.horizontal, 14)
            .padding(.vertical, 12)
            .background(SopoColor.Pallete.Gray.w90.color.clipShape(RoundedRectangle(cornerRadius: 36)))
    }
}
