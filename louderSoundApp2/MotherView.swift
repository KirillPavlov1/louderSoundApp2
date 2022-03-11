//
//  MotherView.swift
//  louderSoundApp2
//
//  Created by Кирилл on 10.03.2022.
//

import Foundation
import SwiftUI

struct MotherView: View{
    @StateObject var viewRouter: ViewRouter

    var body: some View{
        switch viewRouter.currentPage {
        case .onBoarding:
            onBoarding(viewRouter: viewRouter)
        case .main:
            Main_View(viewRouter: viewRouter)
        }
        
    }
    
}
