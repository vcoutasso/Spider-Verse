import SwiftUI

struct HeaderComponent: View {
    var body: some View {
        HStack {
            HeaderButtonView(text: "magnifyingglass") {
                SearchView()
                    .background(Color("BackgroundColor").edgesIgnoringSafeArea(.all))
//                SearchBar(query: $query, showCancelButton: $showCancelButton)
            }

            Spacer()

            Text("foodlitzer")
                .font(.lora(.regular, size: 17))

            Spacer()

            HeaderButtonView(text: "gear") {
                ProfileView(viewModel: ProfileViewModelFactory.make())
            }
        }
    }
}
