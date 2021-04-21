import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    // Print the temp folder
    let path = URL(fileURLWithPath: NSTemporaryDirectory())
    print(path)

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
