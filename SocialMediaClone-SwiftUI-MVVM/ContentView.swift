//
//  ContentView.swift
//  TwitterCloneSwiftUI
//
//  Created by NomoteteS on 24.11.2022.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @State private var showMenu = false
    @EnvironmentObject var viewModel : AuthViewModel
    
    var body: some View {
        Group{
            if viewModel.userSession == nil {
                LoginView()
            }else {
                ZStack(alignment: .topLeading){
                    MainTabView()
                        .navigationBarHidden(showMenu == true)
                    
                    if showMenu {
                        ZStack {
                            Color.black.opacity(showMenu ? 0.25 : 0.0 )
                        }.onTapGesture {
                            withAnimation(.easeInOut(duration: 1)) {
                                showMenu = false
                            }
                        }.ignoresSafeArea()
                    }
                    
                    SideMenuView()
                        .frame(width: 300)
                        .offset(x: showMenu ? 0 : -300,y: 0)
                        .background(showMenu ? Color.white : Color.clear)
                }
                .onAppear{
                    showMenu = false
                }
                .navigationTitle("Home")
                .navigationBarTitleDisplayMode(.inline)
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        if let user = viewModel.currentUser {
                            Button {
                                withAnimation {
                                    showMenu.toggle()
                                }
                            } label: {
                                KFImage(URL(string: user.profileImageUrl))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 32)
                                    .clipShape(Circle())
                            }
                        }
                        
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
