import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      
    GeneratedPluginRegistrant.register(with: self)
      
    
      
      // method channel
      let vc = self.window.rootViewController as? FlutterViewController
      
      
      let path = vc!.lookupKey(forAsset: "assets");
      print("\(Bundle.main.bundlePath)")
      print("\(path)")
      
      let channel = FlutterMethodChannel(name: "samples.zpfate/utils", binaryMessenger: vc!.binaryMessenger)
      channel.setMethodCallHandler { call, result in
      if (call.method == "openAppMarket") {
          let url = URL(string: "https://apps.apple.com/cn/app/id414478124")
          UIApplication.shared.openURL(url!)
          
      } else if (call.method == "getBundlePath") {
          
          let str = "\(Bundle.main.bundlePath)/\(path)";
          result(str);
      } else {
          
          result(FlutterMethodNotImplemented)
      }
    }
      
//      channel.invokeMethod("methodChannel Callback", arguments: ["result":true])
      
//    // basic message channel
//      let basicMessageChannel = FlutterBasicMessageChannel(name: "samples.zpfate/utils", binaryMessenger: vc!.binaryMessenger)
//      
//      basicMessageChannel.setMessageHandler { message, callback in
//          
//          let method = message as? String
//          
//          if method  == "openAppMarket" {
//           callback("success")
//          }
//      }
//      // 原生向flutter发送消息
//      basicMessageChannel.sendMessage("success")
      
      

      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
