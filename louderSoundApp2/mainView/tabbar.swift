//
//  tabbar.swift
//  louderSoundApp2
//
//  Created by Кирилл on 11.03.2022.
//

import Foundation
import SwiftUI

struct TabBarIcon: View {

    @ObservedObject var tabview_router: tabRouter
    let assignedPage: myRouter
    let width, height: CGFloat
    let systemIconName, tabName: String
  
    var body: some View {
        ZStack{
            VStack(){
                Image(systemName: systemIconName)
                    .foregroundColor(tabview_router.page == assignedPage ? Color(red: 0.09, green: 0.553, blue: 0.961) : .gray)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: height)
                    .padding(0)
                     Text(tabName)
                        .font(.system(size: UIScreen.screenWidth * 0.025, weight: .bold))
                        .foregroundColor(tabview_router.page == assignedPage ? Color(red: 0.09, green: 0.553, blue: 0.961) : .gray)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, -8.0)
                     Spacer()
            }
        }
        .frame(width: width, height: height * 1.5)
        .onTapGesture{
            tabview_router.page = assignedPage
        }
     }
 }

