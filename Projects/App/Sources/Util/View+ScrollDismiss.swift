import SwiftUI

public extension View {
    @ViewBuilder
    func scrollDismiss() -> some View {
        if #available(iOS 16, *) {
            self
                .scrollDismissesKeyboard(.immediately)
        }
    }
}
