//
//  ContentView.swift
//  louderSoundApp2
//
//  Created by Кирилл on 10.03.2022.
//

import SwiftUI
import CoreData

struct Main_View: View {
    
    @StateObject var router = tabRouter()
    @State var value: CGPoint = CGPoint(x: 0, y: 165)
    @State var myUnit = ToneOutputUnit()
    @StateObject var viewRouter: ViewRouter

    var body: some View {
        ZStack{
            switch router.page{
            case .first:
                generator(value: $value, myUnit: $myUnit, router: router)
            case .second:
               customFrequency(value: $value, myUnit: $myUnit, router: router)
            case .third:
                meter(router: router, viewRouter: viewRouter)
            case .fourth:
                articles(router: router)
            case .settings:
                settingsView()
            default:
                Text("")
            }
            VStack{
                Spacer()
                HStack{
                    TabBarIcon(tabview_router: router, assignedPage: .first, width: UIScreen.screenWidth/4.5, height: UIScreen.screenHeight/28, systemIconName: "waveform.path.ecg", tabName: "GENERATOR")
                    TabBarIcon(tabview_router: router, assignedPage: .second, width: UIScreen.screenWidth/3.7, height: UIScreen.screenHeight/28, systemIconName: "slider.vertical.3", tabName: "CUSTOM FREQUENCY")
                    TabBarIcon(tabview_router: router, assignedPage: .third, width: UIScreen.screenWidth/4.3, height: UIScreen.screenHeight/28, systemIconName: "music.mic", tabName: "METER")
                    TabBarIcon(tabview_router: router, assignedPage: .fourth, width: UIScreen.screenWidth/4.5, height: UIScreen.screenHeight/28, systemIconName: "book", tabName: "ARTICLE")
                }
                .padding(.top)
                .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 15, alignment: .center)
                .background(Color(red: 0.04, green: 0.077, blue: 0.108))
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}

enum myRouter{
    case first
    case second
    case third
    case fourth
    case settings
}

class tabRouter: ObservableObject{
    @Published var page: myRouter = .first
}

struct main_Previews: PreviewProvider {
    static var previews: some View {
        Main_View(viewRouter: ViewRouter())
    }
}
