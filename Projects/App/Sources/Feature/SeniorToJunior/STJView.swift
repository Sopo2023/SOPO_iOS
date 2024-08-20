import SwiftUI
import SDS



struct STJView: View {
    
    @EnvironmentObject var stjVM: STJViewModel
    
    var body: some View {
        VStack(spacing: 22) {
            SopoSearchField(text: .constant(""), prompt: "검색어를 입력해주세요.")
                .padding(.horizontal, 28)
            
            HStack(spacing: 18) {
                SopoIconButton(icon: .arrowRight, withLabel: "인기")
                
                SopoIconButton(icon: .clock, withLabel: "최신")
                
                Spacer()
            }
            .padding(.horizontal, 28)
            
            ScrollView {
                VStack(spacing: 20) {
                    
                    ForEach(stjVM.response, id: \.boardId) { model in
                        if model.boardId == 1 {
                            STJCell(model: model)
                        } else {
                            STJCutCell(model: model)
                        }
                        
                        SopoDevider()
                    }
                    
                    Spacer(minLength: 80)
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 28)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .scrollDismiss()
            
            
        }
        .padding(.top, 12)
    }
}

#Preview {
    NavigationView {
        STJView()
    }
}
