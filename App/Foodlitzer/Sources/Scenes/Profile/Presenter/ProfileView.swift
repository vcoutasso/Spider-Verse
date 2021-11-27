import SwiftUI

struct ProfileView<ViewModelType>: View where ViewModelType: ProfileViewModelProtocol {
    // MARK: - View model

    @State private var isLocationOn = true
    @State private var isMicOn = false

    @ObservedObject private(set) var viewModel: ViewModelType

    // MARK: - Views

    var body: some View {
        VStack {
            VStack {
                Text("Settings")
                    .font(.custom("Lora-Regular", size: 36))
                    .padding(.top, 10)
                    .padding(.bottom, 65)
            }
            account
            //            permissions
            Spacer()
            //            deleteButton
            signOutButton
        }
        .navigationBarTitleDisplayMode(.inline)
    }

    private var account: some View {
        ZStack {
            VStack {
                HStack(alignment: .center, spacing: 0) {
                    Text(viewModel.userName ?? "N/A")
                        .font(.compact(.regular, size: 24))
                        .padding(.trailing, 5)

                    EditProfileButtonView(destination: { EditProfileView(userName: $viewModel.editingName,
                                                                         userEmail: $viewModel.editingName,
                                                                         nameHolder: viewModel.userName!,
                                                                         userHolder: viewModel.userEmail!) })
                }
                .padding(.bottom, 20)
                .padding(.top, 35)
                .padding(.leading, 20)

                Text(viewModel.userEmail ?? "N/A")
                    .font(.compact(.regular, size: 14))
                    .padding(.bottom, 20)
            }
            .frame(width: UIScreen.main.bounds.width - 70)
            .border(Color.black, width: 0.3)

            VStack {
                HStack(alignment: .center) {
                    Text("Account")
                        .font(.compact(.light, size: 18))
                        .padding(.horizontal, 65)
                        .padding(.vertical, 10)
                }
                .background(Rectangle().foregroundColor(.white).border(Color.black, width: 0.3))
            }
            .padding(.bottom, 135)
        }
    }

    // TODO: Pra quem quiser: Implementar permissions block e delete account

    //    private var permissions: some View {
    //        VStack {
    //            permissionTitle.zIndex(10)
    //            VStack {
    //                permissionsLocation
    //                Rectangle()
    //                    .frame(width: 312, height: 0.5)
    //                    .background(Color.black)
    //                permissionsMic
    //                Rectangle()
    //                    .frame(width: 312, height: 0.5)
    //                    .background(Color.black)
    //                permissionsPlaceholder
    //            }.background(Rectangle()
    //                            .strokeBorder(lineWidth: 0.5)
    //                            .frame(width: 324, height: 182))
    //        }.padding()
    //    }
    //
    //    private var permissionTitle: some View {
    //        Text("Permissions")
    //            .font(.compact(.light, size: 18))
    //            .foregroundColor(Color.black)
    //            .background(Rectangle()
    //                            .strokeBorder(Color.black, lineWidth: 0.5)
    //                            .frame(width: 195, height: 31)
    //                            .background(Color.white))
    //    }
    //
    //    private var permissionsLocation: some View {
    //        HStack {
    //            Image(systemName: "mappin")
    //                .frame(width: 38, height: 38)
    //            Text("LOCALIZATION")
    //                .font(.compact(.regular, size: 14))
    //                .frame(width: 200)
    //            Toggle("", isOn: $isLocationOn)
    //                .tint(.black)
    //
    //        }.frame(width: 300)
    //    }
    //
    //    private var permissionsMic: some View {
    //        HStack {
    //            Image(systemName: "mic.fill")
    //                .frame(width: 38, height: 38)
    //            Text("MIC")
    //                .font(.compact(.regular, size: 14))
    //                .frame(width: 200)
    //            Toggle("", isOn: $isMicOn)
    //                .tint(.black)
    //
    //        }.frame(width: 300)
    //    }
    //
    //    private var permissionsPlaceholder: some View {
    //        HStack {
    //            Image(systemName: "gear")
    //                .frame(width: 38, height: 38)
    //            Text("PLACEHOLDER")
    //                .font(.compact(.regular, size: 14))
    //                .frame(width: 200)
    //            Toggle("", isOn: $isMicOn)
    //                .tint(.black)
    //
    //        }.frame(width: 300)
    //    }

    //    private var deleteButton: some View {
    //        Button {
    //            viewModel.delete()
    //        } label: {
    //            Text("Delete Account")
    //                .frame(width: 302, height: 40)
    //                .foregroundColor(.black)
    //                .overlay(Rectangle()
    //                            .stroke(Color.black, lineWidth: 0.5))
    //        }
    //        .padding(.vertical, 16)
    //    }

    private var signOutButton: some View {
        Button {
            viewModel.signOut()
        } label: {
            Text("Logout")
                .font(.compact(.regular, size: 14))
                .frame(width: UIScreen.main.bounds.width - 70, height: 40)
                .foregroundColor(.white)
                .background(Color.black)
        }
        .padding(.vertical, 16)
    }
}
