import SwiftUI

struct CompetitionView: View {
    let requist: SigninRequest = .init()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                print(requist.params )
            }
    }
}

#Preview {
    CompetitionView()
}
