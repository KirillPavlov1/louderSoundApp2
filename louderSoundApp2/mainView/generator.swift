//
//  generator.swift
//  louderSoundApp2
//
//  Created by Кирилл on 11.03.2022.
//

import Foundation
import SwiftUI

struct Wave: Shape {
    var strength: Double
    var frequency: Double
    var phase: Double
    var animatableData: Double {
        get { phase }
        set { self.phase = newValue }
    }
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath()
        let width = Double(rect.width)
        let height = Double(rect.height)
        let midWidth = width / 2
        let midHeight = height / 2
        let wavelength = width / frequency
        let oneOverMidWidth = 1 / midWidth
        
        path.move(to: CGPoint(x: 0, y: midHeight * 1.5))
        for x in stride(from: 0, through: width, by: 1) {
            let relativeX = x / wavelength
            let distanceFromMidWidth = x - midWidth
            let normalDistance = oneOverMidWidth * distanceFromMidWidth
            let parabola = -(normalDistance * normalDistance) + 1
            let sine = sin(relativeX + phase)
            let y = parabola * strength * sine + midHeight * 1.5
            path.addLine(to: CGPoint(x: x, y: y))
        }
        return Path(path.cgPath)
    }
}

extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        return Binding(
            get: { self.wrappedValue },
            set: { selection in
                self.wrappedValue = selection
                handler(selection)
        })
    }
}

enum freq{
    case f160
    case f300
    case f900
    case f1400
}

struct myScale: View{
    @Binding var value: CGPoint
    @Binding var myUnit : ToneOutputUnit
    @State var curFR: freq = .f160
    
    func setVal(y: Double)
    {
        self.value.y = y
        myUnit.setFrequency(freq: Double(self.value.y))
    }

    var body: some View{
        HStack{
            Button(action: {setVal(y: 160); curFR = .f160})
            {
                Text("160 hz |")
                    .foregroundColor(curFR == .f160 ? Color(red: 0.09, green: 0.553, blue: 0.961) : Color.gray)
                    .font(.system(size: 19, weight: .bold))
            }
            Button(action: {setVal(y: 300); curFR = .f300})
            {
                Text("300hz |")
                    .foregroundColor(curFR == .f300 ? Color(red: 0.09, green: 0.553, blue: 0.961) : Color.gray)
                    .font(.system(size: 19, weight: .bold))
            }
            Button(action: {setVal(y: 900); curFR = .f900})
            {
                Text("900hz |")
                    .foregroundColor(curFR == .f900 ? Color(red: 0.09, green: 0.553, blue: 0.961) : Color.gray)
                    .font(.system(size: 19, weight: .bold))
            }
            Button(action: {setVal(y: 1400); curFR = .f1400})
            {
                Text("1400hz")
                    .foregroundColor(curFR == .f1400 ? Color(red: 0.09, green: 0.553, blue: 0.961) : Color.gray)
                    .font(.system(size: 19, weight: .bold))
            }
            
        }
        .frame(width: 330, height: 65)
        .background(Color(red: 1, green: 1, blue: 1).opacity(0.05))
        .cornerRadius(55)
        
        
    }
}

struct generator: View{
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
                .font(.system(size: 30, weight: .bold, design: .default))
                .foregroundColor(Color.white)
                .frame(width: UIScreen.screenWidth, alignment: .leading)
                .padding(.leading, 100)
            myScale(value: $value, myUnit: $myUnit)
           // Text("\(Int(value.y))")
           //     .foregroundColor(.white)
           //     .font(.largeTitle)
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
    }
}

struct generator_Previews: PreviewProvider {
    
    @State static var myUnit = ToneOutputUnit()
    static var previews: some View {
        generator(value: .constant(CGPoint(x: 0, y: 100)), myUnit: $myUnit, router: tabRouter())
    }
}

