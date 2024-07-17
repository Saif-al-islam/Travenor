//
//  TripDetailsView.swift
//  Travenor
//
//  Created by Saif on 20/02/2024.
//

import SwiftUI

struct TripDetailsView: View {
    
    @EnvironmentObject var router: Router
    @StateObject var viewModel = TripDetailsViewModel()
    
    let tripId: Int
    
    @State private var showDesc = false
    
    init(tripId: Int) {
        self.tripId = tripId
    }
    
    
    var body: some View {
        VStack {
            Image(viewModel.mainImage)
                .resizable()
                .height(410)
            
            VStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(.grayColor1.opacity(0.2))
                    .frame(width: 36, height: 5)
                
                SpacerH(24)
                
                TripInfoSection(tripDetails: viewModel.tripDetails)
                
                SpacerH(24)
                
                TripImagesSection(
                    images: viewModel.tripDetails?.images.filter { im in
                        !im.tripMainImage
                    }) { image in
                        viewModel.mainImage = image.path
                    }
                
                SpacerH(24)
                
                Text("about-destination")
                    .font(.font_SfUiDisplaySemiBold(size: 20, relativeTo: .title2))
                    .foregroundStyle(.colorBlack1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                SpacerH(8)
                
                // TODO try To enable max Lines for read more.
                Group {
                    Text(viewModel.tripDetails?.description ?? "")
                        .color(.grayColor1)
                    + Text(self.showDesc ? "" : "read_more")
                        .color(.colorOrange1)
                }
                .font(.font_SfUiDisplayLight(size: 13, relativeTo: .body))
                .onTapGesture {
                    self.showDesc = !self.showDesc
                }

                Spacer()
                
                Button("book-now") {
                    viewModel.bookTrip()
                }
                .buttonStyle(BaseButtonStyle())
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 32, topTrailing: 32))
                    .fill(.white)
            )
            .offset(y: -48)
            
            
        }
        .ignoresSafeArea()
        .baseToolBar(title: "details", baseColor: .white) {
            Image(systemName: "bookmark")
                .size(44)
                .background(Circle().fill(.gray.opacity(0.16)))
                .foregroundStyle(.white)
        }
        .onAppear {
            viewModel.getTripDetails(tripId)
        }
        
    }
}

#Preview {
    TripDetailsView(tripId: 1)
}

struct TripInfoSection: View {
    let tripDetails: Trip?
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(tripDetails?.title ?? "")
                    .font(.font_SfUiDisplayMedium(size: 24, relativeTo: .title))
                
                SpacerH(6)
                
                Group {
                    Text(tripDetails?.country.name ?? "") + Text(", ")
                    + Text(tripDetails?.city.name ?? "")
                }
                .font(.font_SfUiDisplayLight(size: 15, relativeTo: .subheadline))
                .foregroundStyle(.grayColor1)
            }
            
            Spacer()
            
            Image(tripDetails?.user.image ?? "ic_user")
                .resizable()
                .size(48)
        }
        
        SpacerH(24)
        
        HStack {
            Label(tripDetails?.country.name ?? "", image: "ic_location")
            Spacer()
            Label(
                title: {
                    Text(String(format: "%.1f", tripDetails?.avgRate ?? 5))
                        .color(.colorBlack1)
                    +
                    Text(tripDetails?.comments?.count ?? 0 > 0 ? " (\(tripDetails?.comments?.count ?? 0))" : "")
                },
                icon: {
                    Image(systemName: "star.fill")
                        .foregroundStyle(.colorYellow1)
                }
            )
            
            Spacer()
            
            Text("$"+String(format: "%.0f", tripDetails?.pricePerPersonInUS ?? 0) + "/")
                .color(.colorBlue2)
            +
            Text("person")
            
        }
        .font(.font_SfUiDisplayLight(size: 15, relativeTo: .subheadline))
        .foregroundStyle(.grayColor1)
    }
}



struct TripImagesSection: View {
    
    let images: [TripImage]?
    let onImageClick: (TripImage)->Void
    var maxRowCount: Int {
        guard let list = images else { return 0 }
        return list.count > 5 ? 5 : list.count
    }
    
    var body: some View {
        HStack {
            ForEach(0..<maxRowCount, id: \.self) { index in
                Image(images?[index].path ?? "")
                    .resizable()
                    .size(42)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay {
                        if  images?.count ?? 0 > 5 && index == 4 {
                            Text("+\(images!.count-5)")
                                .font(.font_SfUiDisplayLight(size: 14))
                                .foregroundStyle(.white)
                        }
                    }
                    .onTapGesture {
                        onImageClick(images![index])
                    }
                
                if index != 4 {
                    SpacerW(26)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
