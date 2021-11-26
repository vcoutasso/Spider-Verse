import SwiftUI

struct TopHomeView: View {
    var body: some View {
        VStack(spacing: 0) {
            HeaderComponent()
                .padding(.vertical) // set final padding

            CustomSegmentedPicker()
        }
        .navigationBarHidden(true)
    }
}
