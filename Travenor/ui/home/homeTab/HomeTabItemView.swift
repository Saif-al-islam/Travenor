//
//  HomeTabItemView.swift
//  Travenor
//
//  Created by Saif on 15/02/2024.
//

import SwiftUI

struct HomeTabItemView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            HStack {
                
                UserInfoSection(username: viewModel.user?.fName ?? "",
                                userIcon: viewModel.user?.image ?? "ic_user")
                
                Spacer()
                
                Image(systemName: "bell")
                    .padding(10)
                    .background(Circle().fill(.colorGray1))
                
            }
            .padding(.trailing, 20)
            
            SpacerH(24)
            
            VStack {
                Text("explore-the")
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(alignment: .top) {
                    Text("beautiful")
                    VStack(spacing: 0) {
                        Text("world-")
                            .foregroundColor(.colorOrange1)
                        Image("im-home-line")
                    }
                }
                .font(.font_SfUiDisplayBlack(size: 38, relativeTo: .title))
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .font(.font_SfUiDisplayMedium(size: 38, relativeTo: .title))
            
            SpacerH(30)
            
            HStack {
                Text("best-destination")
                    .font(.font_SfUiDisplaySemiBold(size: 20, relativeTo: .headline))
                
                Spacer()
                
                Text("view-all")
                    .font(.font_SfUiDisplaySemiBold(size: 14, relativeTo: .title))
                    .foregroundStyle(.colorBlue2)
            }
            .padding(.trailing, 20)
            
            SpacerH(16)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing:16, content: {
                    ForEach(viewModel.popularTrips ?? [], id: \.id) { item in
                        HomeTripItem(item: item)
                        
                    }
                    .listStyle(.plain)
                    
                })
                .fixedSize()
            }
            
            Spacer()
            
        }
        .padding(.leading, 20)
    }
}

#Preview {
    HomeTabItemView()
}

struct UserInfoSection: View {
    let username: String
    let userIcon: String
    
    var body: some View {
        HStack {
            Image(userIcon)
                .clipShape(Circle())
            
            Text(username)
                .font(.font_SfUiDisplayMedium(size: 14, relativeTo: .headline))
        }
        .padding(4)
        .padding(.trailing, 12)
        .background(RoundedRectangle(cornerRadius: 22).fill(.colorGray1))
        
    }
}


