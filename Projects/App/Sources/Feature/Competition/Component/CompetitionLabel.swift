import SwiftUI
import SDS

struct CompetitionLabel: View {
    public enum LabelType {
        case subscribed, closed, headcount
        
        var title: String {
            switch self {
            case .subscribed: "신청"
            case .closed: "마감"
            case .headcount: "신청 인원"
            }
        }
        
        var color: Color {
            switch self {
            case .subscribed: Color.status(.positive)
            case .closed: Color.status(.destructive)
            case .headcount: Color.status(.cautionary)
            }
        }
    }
    
    
    let type: LabelType
    let content: String
    
    init(_ type: LabelType, content: String) {
        self.type = type
        self.content = content
    }
    
    var body: some View {
        
        
        HStack(spacing: 28) {
            Text(type.title)
                .foregroundStyle(type.color)
            
            Text(content)
                .foregroundStyle(Color.common(.w0))
        }
        .font(.body(.medium))
    }
}

#Preview {
    CompetitionLabel(.subscribed, content: "2024.08.02.")
}
