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
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
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
            print("requestAccess status \(status)")
        }
    }

    private func requestTrackingAuthorization() {
        ATTrackingManager.requestTrackingAuthorization {
            status in
            print("App Tracking Transparency status: \(status.rawValue)")
        }
    }
}
