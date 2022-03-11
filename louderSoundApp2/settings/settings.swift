//
//  settings.swift
//  louderSoundApp2
//
//  Created by Кирилл on 11.03.2022.
//

import Foundation
import SwiftUI
import StoreKit

struct settingsView: View{

    func share_app()
    {
        if let name = URL(string: "https://apps.apple.com/app/id1583786874"), !name.absoluteString.isEmpty {
          let objectsToShare = [name]
          let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
        } else {
          // show alert for not available
        }
    }

    var body: some View{
        VStack{
            HStack{
                Image("logo")
                Spacer()
                Image("settings")
                    .foregroundColor(Color.gray)
            }
            .padding([.leading, .trailing], 70)
            .padding(.top, UIScreen.screenHeight * 0.05)
            Text("SETTINGS")
                .font(.system(size: UIScreen.screenHeight * 0.05, weight: .bold, design: .default))
                .foregroundColor(Color.white)
                .frame(width: UIScreen.screenWidth, alignment: .leading)
                .padding(.leading, 100)
            Spacer()
            VStack
            {
                Link(destination: URL(string: "http://cbdapps-srl.tilda.ws/")!)
                {
                    HStack{
                        Text("Help & support")
                            .font(.system(size: 24))
                            .foregroundColor(Color.gray)
                        Spacer()
                        Image(systemName: "arrow.up.forward")
                            .foregroundColor(Color.gray)
                    }
                    .frame(width: UIScreen.screenWidth * 0.85,alignment: .leading)
                    .padding()
                }
                Button(action:{SKStoreReviewController.requestReview()})
                {
                    HStack{
                        Text("Rate this app")
                            .font(.system(size: 24))
                            .foregroundColor(Color.gray)
                        Spacer()
                        Image(systemName: "arrow.up.forward")
                            .foregroundColor(Color.gray)
                    }
                    .frame(width: UIScreen.screenWidth * 0.85,alignment: .leading)
                    .padding()
                }
                Button(action:{share_app()})
                {
                    HStack{
                        Text("Share this app")
                            .font(.system(size: 24))
                            .foregroundColor(Color.gray)
                        Spacer()
                        Image(systemName: "arrow.up.forward")
                            .foregroundColor(Color.gray)
                    }
                    .frame(width: UIScreen.screenWidth * 0.85,alignment: .leading)
                    .padding()
                }
                Link(destination: URL(string: "http://cbdapps-srl.tilda.ws/privacypolicy")!)
                {
                    HStack{
                        Text("About us")
                            .font(.system(size: 24))
                            .foregroundColor(Color.gray)
                        Spacer()
                        Image(systemName: "arrow.up.forward")
                            .foregroundColor(Color.gray)
                    }
                    .frame(width: UIScreen.screenWidth * 0.85,alignment: .leading)
                }
                Link(destination: URL(string: "http://cbdapps-srl.tilda.ws/privacypolicy")!)
                {
                    HStack{
                        Text("Privacy Policy")
                            .font(.system(size: 24))
                            .foregroundColor(Color.gray)
                        Spacer()
                        Image(systemName: "arrow.up.forward")
                            .foregroundColor(Color.gray)
                    }
                    .frame(width: UIScreen.screenWidth * 0.85,alignment: .leading)
                    .padding()
                }
                Link(destination: URL(string: "http://cbdapps-srl.tilda.ws/termsofuse")!)
                {
                    HStack{
                        Text("Terms of use")
                            .font(.system(size: 24))
                            .foregroundColor(Color.gray)
                        Spacer()
                        Image(systemName: "arrow.up.forward")
                            .foregroundColor(Color.gray)
                    }
                    .frame(width: UIScreen.screenWidth * 0.85,alignment: .leading)
                    .padding()
                }
            }
            .background(Rectangle().fill(Color(red: 1, green: 1, blue: 1).opacity(0.05)))
            .cornerRadius(15)
            Spacer()
        }
        .background(Color(red: 0.071, green: 0.118, blue: 0.157))
        .edgesIgnoringSafeArea(.all)
    }
}

struct set_Previews: PreviewProvider {
    static var previews: some View {
        settingsView()
    }
}
