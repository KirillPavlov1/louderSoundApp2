//
//  customFrequency.swift
//  louderSoundApp2
//
//  Created by Кирилл on 11.03.2022.
//

import Foundation
import SwiftUI

struct customFrequency: View{
    @State private var phase = 0.0
    @Binding var value: CGPoint
    @State private var start = true
    var initialCenter = CGPoint()
    @Binding var myUnit : ToneOutputUnit
    @ObservedObject var router: tabRouter
    
    func button()
    {
        if (self.start)
        {
            myUnit.setFrequency(freq: Double(self.value.y))
            myUnit.enableSpeaker()
            myUnit.setToneTime(t: 20000)
            self.start = false
        }
        else
        {
            self.start = true
            myUnit.stop()
        }
    }
    var simpleDrag: some Gesture {
            DragGesture()
                .onChanged { value in
                    self.value = CGPoint(x: self.value.x + (value.location.x - value.startLocation.x), y: self.value.y + ((value.startLocation.y - value.location.y) / 5))
                    if (self.value.y > 25000)
                    {
                        self.value.y = 25000
                    }
                    else if (self.value.y < 0)
                    {
                        self.value.y = 0
                    }
                    self.myUnit.setFrequency(freq: Double(self.value.y))
                }
                .onEnded{ value in
                    
                    self.value = CGPoint(x: self.value.x + (value.location.x - value.startLocation.x), y: self.value.y + ((value.startLocation.y - value.location.y) / 5))
                    if (self.value.y > 25000)
                    {
                        self.value.y = 25000
                    }
                    else if (self.value.y < 0)
                    {
                        self.value.y = 0
                    }
                    myUnit.setFrequency(freq: Double(self.value.y))
                }
        }
    //@State var result = String(Int(value.y)).trimmingCharacters(in: CharacterSet(charactersIn: "0123456789").inverted)
    var body: some View {
        
        VStack{
            HStack{
                Image("logo")
                Spacer()
                Button(action:{router.page = .settings})
                {
                    Image("settings")
                    .foregroundColor(Color.gray)
                }
            }
            .padding([.leading, .trailing], 70)
            .padding(.top, UIScreen.screenHeight * 0.05)
            Text("GENERATOR")
                .font(.system(size: UIScreen.screenHeight * 0.05, weight: .bold, design: .default))
                .foregroundColor(Color.white)
                .frame(width: UIScreen.screenWidth, alignment: .leading)
                .padding(.leading, 100)
            Image("arrow1")
            HStack{
               
                Text(String(Int(value.y)).trimmingCharacters(in: CharacterSet(charactersIn: "0123456789").inverted))
                    .foregroundColor(.white)
                    .font(Font.custom("Montserrat-Black", size: UIScreen.screenHeight * 0.05))
                Text("HZ")
                    .foregroundColor(.white)
                    .font(.system(size: 24))
            }
            .padding(.top, UIScreen.screenHeight * 0.03)
            .padding(.bottom, UIScreen.screenHeight * 0.015)
            Text("SWIPE UP & DOWN TO ADJUST FREQUENCY")
                .foregroundColor(Color.gray)
                .font(.system(size: 13))
                .padding(.bottom, UIScreen.screenHeight * 0.015)
            Image("arrow2")
                
            Spacer()
            ZStack{
                ForEach(4..<8) { i in
                    let x = 1500 / (i * i)
                   Wave(strength: Double(x), frequency: Double(self.value.y) / 500 , phase: self.phase)
                        .stroke(Color(red: 0.286, green: 0.627, blue: 0.922), style: StrokeStyle(lineWidth: 4, lineCap: .butt, lineJoin: .miter, miterLimit: 0, dash: [3, 3], dashPhase: 0))
                }
            }
            .padding(.bottom, UIScreen.screenHeight * 0.05)
            .frame(height: UIScreen.screenHeight * 0.2)
            Spacer()
            Button(action: {self.button()})
            {
                start ?
                    Text("START")
                        .frame(width: UIScreen.screenWidth * 0.2, height: UIScreen.screenWidth * 0.2)
                        .foregroundColor(.white)
                        
                    :
                    Text("STOP")
                        .frame(width: UIScreen.screenWidth * 0.2, height: UIScreen.screenWidth * 0.2)
                        .foregroundColor(Color.gray.opacity(0.5))
            }
            .frame(width: UIScreen.screenWidth * 0.2)
           
            .background(Circle().fill(Color.gray.opacity(0.05)))
            .font(.system(size: 16))
            .padding(.top, 10)
            .padding(.bottom, UIScreen.screenHeight / 8)
        }
        .background(Color(red: 0.071, green: 0.118, blue: 0.157))
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                self.phase = -.pi * 2
            }
        }
        .gesture(
            simpleDrag
        )
    }
}

struct cF_Previews: PreviewProvider {
    
    @State static var myUnit = ToneOutputUnit()
    static var previews: some View {
        customFrequency(value: .constant(CGPoint(x: 0, y: 100)), myUnit: $myUnit, router: tabRouter())
    }
}
