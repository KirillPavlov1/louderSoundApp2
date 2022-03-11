//
//  louderSoundApp2App.swift
//  louderSoundApp2
//
//  Created by Кирилл on 10.03.2022.
//

import SwiftUI
import ApphudSDK

@main
struct louderSoundApp2App: App {
    let persistenceController = PersistenceController.shared
    @StateObject var viewRouter = ViewRouter()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            MotherView(viewRouter: viewRouter)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        Apphud.start(apiKey: "app_77HzUza2KmUMp7saTyiBiGmjtCUnpY")
        registerForNotifications()
        return true
    }
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Apphud.submitPushNotificationsToken(token: deviceToken, callback: nil)
    }
    
}

func registerForNotifications(){
   // UNUserNotificationCenter.current().delegate = self
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound])    { (granted, error) in
        // handle if needed
    }
    UIApplication.shared.registerForRemoteNotifications()
    let content = UNMutableNotificationContent()
    content.title = "Get Louder Sound App"
    content.sound = UNNotificationSound.default

    // show this notification five seconds from now
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 4 * 3600, repeats: true)

    // choose a random identifier
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    // add our notification request
    if (!Apphud.hasActiveSubscription())
    {
        UNUserNotificationCenter.current().add(request)
    }
}
