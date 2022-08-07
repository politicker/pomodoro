import Cocoa
import FlutterMacOS

@NSApplicationMain
class AppDelegate: FlutterAppDelegate {
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return false
  }
	
	override func applicationDidFinishLaunching(_ aNotification: Notification) {
		let window = NSApplication.shared.windows.first!
		
		window.titlebarAppearsTransparent = true
		window.backgroundColor = .white
		window.standardWindowButton(.closeButton)!.isHidden = true
		window.standardWindowButton(.miniaturizeButton)!.isHidden = true
		window.standardWindowButton(.zoomButton)!.isHidden = true
	}
}
