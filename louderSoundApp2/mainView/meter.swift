//
//  test.swift
//  louderSoundApp2
//
//  Created by Кирилл on 11.03.2022.
//

import Foundation
import SwiftUI
import UIKit
import AVFoundation
import CoreAudio
import ApphudSDK

class MicrophoneMonitor: ObservableObject {
    
    // 1
    private var audioRecorder: AVAudioRecorder
    private var timer: Timer?
    
    private var currentSample: Int
    private let numberOfSamples: Int
    
    // 2
    @Published public var soundSamples: [Float]
    @Published public var turn: Bool
    //@Published public var audioRecorder: AVAudioRecorder
    
    init(numberOfSamples: Int) {
        self.numberOfSamples = numberOfSamples // In production check this is > 0.
        self.soundSamples = [Float](repeating: .zero, count: numberOfSamples)
        self.currentSample = 0
        self.turn = false
        // 3
        let audioSession = AVAudioSession.sharedInstance()
        if audioSession.recordPermission != .granted {
            audioSession.requestRecordPermission { (isGranted) in
                if !isGranted {
                    fatalError("You must allow audio recording for this demo to work")
                }
            }
        }
        
        // 4
        let url = URL(fileURLWithPath: "/dev/null", isDirectory: true)
        let recorderSettings: [String:Any] = [
            AVFormatIDKey: NSNumber(value: kAudioFormatAppleLossless),
            AVSampleRateKey: 44100.0,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.min.rawValue
        ]
        
        // 5
        do {
            audioRecorder = try AVAudioRecorder(url: url, settings: recorderSettings)
            try audioSession.setCategory(.playAndRecord, mode: .default, options: [])
            
            //startMonitoring()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    // 6
    public func startMonitoring() {
        audioRecorder.isMeteringEnabled = true
        audioRecorder.record()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { (timer) in
            // 7
            self.audioRecorder.updateMeters()
            self.soundSamples[self.currentSample] = self.audioRecorder.averagePower(forChannel: 0)
            self.currentSample = (self.currentSample + 1) % self.numberOfSamples
        })
    }
    
    public func endMonitoring()
    {
        timer?.invalidate()
        audioRecorder.stop()
    }
    // 8
    deinit {
        timer?.invalidate()
        audioRecorder.stop()
    }
    
    
}

let numberOfSamples: Int = 2

struct meter: View{
    
    @ObservedObject private var mic = MicrophoneMonitor(numberOfSamples: numberOfSamples)
    @State private var start = true
    @ObservedObject var router: tabRouter
    @StateObject var viewRouter: ViewRouter

    var body: some View{
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
            Spacer()
            HStack{
               
                Text(String((Int((mic.soundSamples[0] + 120) * 0.75))).trimmingCharacters(in: CharacterSet(charactersIn: "0123456789").inverted))
                    .foregroundColor(.white)
                    .font(Font.custom("Montserrat-Black", size: UIScreen.screenHeight * 0.05))
                Text("dB")
                    .foregroundColor(.white)
                    .font(.system(size: 24))
            }
            Spacer()
            if (Apphud.hasActiveSubscription())
            {
            Button(action: {start ? mic.startMonitoring() : mic.endMonitoring() ;start.toggle()})
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
            else
            {
                Button(action: {viewRouter.subscribeButtonAction();
                    UNUserNotificationCenter.current().removeAllPendingNotificationRequests()})
            {
                VStack{
                    Text("UNLOCK PRO VERSION")
                        .foregroundColor(Color.black)
                    Text("UPGRADE")
                        .foregroundColor(Color.black)
                }

            }
            .frame(width: UIScreen.screenWidth * 0.5)
            .background(Rectangle().fill(Color.white).cornerRadius(20))
            .font(.system(size: 16))
            .padding(.top, 10)
            .padding(.bottom, UIScreen.screenHeight / 8)
            }
        }
        .background(Color(red: 0.071, green: 0.118, blue: 0.157))
        .edgesIgnoringSafeArea(.all)
    }
}

struct meter_Previews: PreviewProvider {
    
    @State static var myUnit = ToneOutputUnit()
    static var previews: some View {
        meter(router: tabRouter(), viewRouter: ViewRouter())
    }
}
