//
//  TripItem.swift
//  Travenor
//
//  Created by Saif on 19/02/2024.
//

import Foundation
import SwiftUI

struct HomeTripItem: View {
    let item: Trip
    
    var body: some View {
        CardView(color: .white, cornerRadius: 24, contentPadding: .all(14)) {
            VStack {
                Image(
                    item.images.first(where: { im in im.tripMainImage })?.path ?? ""
                )
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 286)
                .frame(maxWidth: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .overlay(alignment: .topTrailing) {
                    Image(systemName: "bookmark")
                        .foregroundStyle(.white)
                        .padding(8)
                        .background(Circle().fill(.gray.opacity(0.2)))
                        .padding(14)
                }
                
                SpacerH(14)
                
                HStack {
                    Text(item.title)
                        .font(.font_SfUiDisplayMedium(size: 18, relativeTo: .title))
                    
                    Spacer()
                    
                    Label(
                        title: {
                            Text(String(format: "%.1f", item.avgRate))
                                .font(.font_SfUiDisplayLight(size: 15, relativeTo: .caption))
                        },
                        icon: {
                            Image(systemName: "star.fill")
                                .foregroundStyle(.colorYellow1)
                        }
                    )
                }
                .padding(.horizontal, 6)
                
                SpacerH(10)
                
                HStack {
                    Label("\(item.country.name), \(item.city.name)", image: "ic_location")
                        .font(.font_SfUiDisplayLight(size: 15, relativeTo: .caption))
                        .foregroundStyle(.grayColor1)
                    
                    Spacer()
                    
                    if !(item.comments?.isEmpty ?? true) {
                        ZStack {
                            if item.comments!.indices.contains(0) {
                                Image(item.comments![0].user.image ?? "ic_user")
                                    .resizable()
                                    .size(24)
                            }
                            
                            if item.comments!.indices.contains(1) {
                                Image(item.comments![1].user.image ?? "ic_user")
                                    .resizable()
                                    .size(24)
                                    .padding(.leading, 24)
                            }
                            
                            if item.comments!.indices.contains(2) {
                                Image(item.comments![2].user.image ?? "ic_user")
                                    .resizable()
                                    .size(24)
                                    .padding(.leading, 48)
                            }
                            
                            Text(item.comments!.count > 3 ? "+\(item.comments!.count - 3)" : "...")
                                .font(.font_SfUiDisplayLight(size: 11))
                                .size(24)
                                .background(Circle().fill(.colorBlue3))
                                .padding(.leading, 72)
                        }
                    }
                    
                }
                .padding(.horizontal, 6)
                
            }
            
        }
        
    }
}


#Preview {
    HomeTripItem(item: MockData.trips[0])
        .padding()
    
}
