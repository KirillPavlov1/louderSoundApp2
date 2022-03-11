//
//  onBoarding.swift
//  louderSoundApp2
//
//  Created by Кирилл on 10.03.2022.
//

import Foundation
import SwiftUI
import ApphudSDK
import StoreKit
import UserNotifications
/* if (viewRouter.trialperiod != nil)
 {
     Text("Trial period for \(String(viewRouter.trialperiod)) then \(String(viewRouter.productPrice))")
         .font(.system(size: UIScreen.screenHeight * 0.025))
         .multilineTextAlignment(.center)
         .foregroundColor(Color.gray)
 }
 else
 {
     Text("Billed every \(String(viewRouter.subperiod)) at \(String(viewRouter.productPrice))")
         .font(.system(size: UIScreen.screenWidth * 0.025))
         .multilineTextAlignment(.center)
         .foregroundColor(Color.gray)
 }*/
struct phone1: View{
    var body: some View{
        ZStack{
            Image("wave")
                .padding(.top, 160)
            Image("border")
            Image("newScale")
                .scaleEffect(0.8)
                .padding(.bottom, 150)
        }
        .frame(height: UIScreen.screenHeight * 0.7)
    }
}

struct phone2: View{
    var body: some View{
        ZStack{
            Image("border")
            Image("otzyv")
                .padding(.bottom, 150)
        }
        .frame(height: UIScreen.screenHeight * 0.7)
    }
}
struct phone3: View{
    var body: some View{
        ZStack{
            Image("wave2")
                .padding(.top, 160)
            Image("border")
            Image("sound")
                .padding(.bottom, 150)
        }
        .frame(height: UIScreen.screenHeight * 0.7)
    }
}
struct phone4: View{
    var body: some View{
        ZStack{
            Image("wave3")
                .padding(.top, 160)
            Image("border")
            Image("scale2")
                .padding(.bottom, 150)
        }
        .frame(height: UIScreen.screenHeight * 0.7)
    }
}

struct phone5: View{
    var body: some View{
        ZStack{
            Image("wave")
                .padding(.top, 160)
            Image("border")
            Image("prem")
                .padding(.bottom, 150)
        }
        .frame(height: UIScreen.screenHeight * 0.7)
    }
}

struct onb1: View{
    var body: some View{
        VStack{
            Text("CLEAN SOUND -\nSPEAKER BOOST")
                .foregroundColor(Color.white)
                .font(.system(size: 25, weight: .bold))
                .frame(width: UIScreen.screenWidth * 0.83, height: UIScreen.screenHeight * 0.11, alignment: .leading)
            Text("POWERFUL WAVES GENERATOR")
                .foregroundColor(Color.gray)
                .font(.system(size: 15))
                .frame(width: UIScreen.screenWidth * 0.83, alignment: .leading)
            phone1()
        }
        .padding(.bottom, 40)
    }
}

struct onb2: View{
    var body: some View{
        VStack{
            Text("WE NEED\nYOUR RATINGS!")
                .foregroundColor(Color.white)
                .font(.system(size: 25, weight: .bold))
                .frame(width: UIScreen.screenWidth * 0.83, height: UIScreen.screenHeight * 0.11, alignment: .leading)
            Text("IT HELPS US TO IMPROVE OUR APP")
                .foregroundColor(Color.gray)
                .font(.system(size: 15))
                .frame(width: UIScreen.screenWidth * 0.83, alignment: .leading)
            phone2()
        }
        .padding(.bottom, 40)
    }
}

struct onb3: View{
    var body: some View{
        VStack{
            Text("POWERFUL\nAND CLEAN SOUND")
                .foregroundColor(Color.white)
                .font(.system(size: 25, weight: .bold))
                .frame(width: UIScreen.screenWidth * 0.83, height: UIScreen.screenHeight * 0.11, alignment: .leading)
            Text("MAKE IT SOUNDS PERFECTLY")
                .foregroundColor(Color.gray)
                .font(.system(size: 15))
                .frame(width: UIScreen.screenWidth * 0.83, alignment: .leading)
            phone3()
        }
        .padding(.bottom, 40)
    }
}

struct onb4: View{
    var body: some View{
        VStack{
            Text("YOUR\nSOUND METER")
                .foregroundColor(Color.white)
                .font(.system(size: 25, weight: .bold))
                .frame(width: UIScreen.screenWidth * 0.83, height: UIScreen.screenHeight * 0.11, alignment: .leading)
            Text("SOUND PRESSURE AROUND YOU")
                .foregroundColor(Color.gray)
                .font(.system(size: 15))
                .frame(width: UIScreen.screenWidth * 0.83, alignment: .leading)
            phone4()
        }
        .padding(.bottom, 40)
    }
}

struct onb5: View{

    @StateObject var viewRouter: ViewRouter

    var body: some View{
        VStack{
            Text("UNLIMITED ACCESS\nTO ALL FUNCTIONS")
                .foregroundColor(Color.white)
                .font(.system(size: 25, weight: .bold))
                .frame(width: UIScreen.screenWidth * 0.83, height: UIScreen.screenHeight * 0.11, alignment: .leading)
            if (viewRouter.trialperiod != nil)
            {
                 Text("Trial period for \(String(viewRouter.trialperiod)) then \(String(viewRouter.productPrice))")
                    .foregroundColor(Color.gray)
                    .font(.system(size: 15))
                    .frame(width: UIScreen.screenWidth * 0.83, alignment: .leading)
             }
             else
             {
                 Text("Billed every \(String(viewRouter.subperiod)) at \(String(viewRouter.productPrice))")
                     .foregroundColor(Color.gray)
                     .font(.system(size: 15))
                     .frame(width: UIScreen.screenWidth * 0.83, alignment: .leading)
             }
            phone5()
        }
        .padding(.bottom, 40)
    }
}

struct image_switch: View{
    
    @Binding var currentTab: Int
    @StateObject var viewRouter: ViewRouter
    
    init(currentTab: Binding<Int>, viewRouter: StateObject<ViewRouter>){
        self._currentTab = currentTab
        self._viewRouter = viewRouter
    }

    var body: some View{
        ZStack{
            switch currentTab{
            case 0:
                onb1()
                    .edgesIgnoringSafeArea(.all)
            case 1:
                onb2()
                    .edgesIgnoringSafeArea(.all)
            case 2:
                onb3()
                    .edgesIgnoringSafeArea(.all)
            case 3:
                onb4()
                    .edgesIgnoringSafeArea(.all)
            case 4:
                onb5(viewRouter: viewRouter)
                    .edgesIgnoringSafeArea(.all)
            default:
                Image("onb1")
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}



struct links_restore: View{
    @StateObject var viewRouter: ViewRouter
    
    var body: some View{
        HStack{
                Link("PRIVACY POLICY", destination: URL(string: "http://cbdapps-srl.tilda.ws/privacypolicy")!)
                    .font(.system(size: 10))
                    .foregroundColor(Color.white)
                Text("    |   ")
                    .font(.system(size: 10))
                    .foregroundColor(Color.white)
            Button(action: {viewRouter.restore_product()})
                {
                    Text("RESTORE")
                    .font(.system(size: 10))
                    .foregroundColor(Color.white)
                }
                Text("   |    ")
                    .font(.system(size: 10))
                    .foregroundColor(Color.white)
                Link("TERMS OF USE", destination: URL(string: "http://cbdapps-srl.tilda.ws/termsofuse")!)
                    .font(.system(size: 10))
                    .foregroundColor(Color.white)
        }
        .padding(.bottom, 20)
    }
}

struct onBoarding: View {
    @State private var currentTab = 0
    @State private var text_button = "CONTINUE"
    @StateObject var viewRouter: ViewRouter
    @State private var last = false
   
    func `continue`()
    {
        if (currentTab < 4)
        {
            currentTab+=1
            if (currentTab == 2)
            {
                viewRouter.configure()
                SKStoreReviewController.requestReview()
            }
            if (currentTab == 4)
            {
                text_button = "Continue & Subscribe"
                last.toggle()
            }
        }
        else
        {
            if (Apphud.hasActiveSubscription())
            {
                viewRouter.currentPage = .main
                UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
            }
            else
            {
                viewRouter.subscribeButtonAction()
                UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
            }
        }
    }
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color(red: 0.071, green: 0.118, blue: 0.157))
                .edgesIgnoringSafeArea(.all)
            image_switch(currentTab: $currentTab, viewRouter: _viewRouter )
            VStack{
                Spacer()
                Spacer()
                ZStack{
                    VStack{
                        Spacer()
                        Button(action: {self.continue()})
                        {
                            Text(text_button)
                                .frame(width: UIScreen.screenWidth * 0.85, height: UIScreen.screenHeight / 17)
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .bold))
                            
                        }
                        .frame(width: UIScreen.screenWidth * 0.75)
                        .frame(height: UIScreen.screenHeight / 12)
                        .background(Color(red: 0.09, green: 0.553, blue: 0.961))
                        .cornerRadius(8)
                        .padding(.bottom, UIScreen.screenHeight * 0.02)
                        .padding(.top, 20)
                        links_restore(viewRouter: viewRouter)
                            .padding([.bottom, .horizontal], 13)
                    }
                }
        }
        VStack{
            HStack{
                Spacer()
                Button(action: {viewRouter.currentPage = .main})
                {
                    Image(systemName: "xmark")
                        .resizable()
                        .foregroundColor(Color.white)
                        .frame(width: 30, height: 30)
                        
                }
                .padding([.top, .trailing], 40)
            }
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
    }
    }
}

struct onboarding_Previews: PreviewProvider {
    static var previews: some View {
        onBoarding(viewRouter: ViewRouter())
    }
}
