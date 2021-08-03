//
//  AppDelegate.swift
//  Privacy_Tracking_Alert_iOS15
//
//  Created by Vasileios on 03.08.21.
//

import UIKit
import AppTrackingTransparency
import AVFoundation

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setUpWindow()
        requestCameraPermission()
        requestNotificationPermission()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.25) {
            self.requestTrackingAuthorization()
        }
        return true
    }
    
    private func setUpWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = UIViewController()
        viewController.view.backgroundColor = .systemGreen
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
    
    private func requestCameraPermission() {
        AVCaptureDevice.requestAccess(for: .video) { status in
            print("requestCameraPermission status: \(status)")
        }
    }
    
    private func requestNotificationPermission() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            print("requestNotificationPermission granted: \(granted)")
        }
    }

    private func requestTrackingAuthorization() {
        ATTrackingManager.requestTrackingAuthorization {
            status in
            print("requestTrackingAuthorization status: \(status.rawValue)")
        }
    }
}
