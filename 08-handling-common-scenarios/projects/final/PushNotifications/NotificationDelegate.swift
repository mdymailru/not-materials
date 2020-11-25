import UserNotifications

final class NotificationDelegate: NSObject, UNUserNotificationCenterDelegate {
  func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    completionHandler([.banner, .sound, .badge])
  }
  
  func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
    defer { completionHandler() }
    
    guard
      response.actionIdentifier == UNNotificationDefaultActionIdentifier
    else {
      return
    }
    
    guard let beach = response.notification.request.content.userInfo["beach"] else {
      return
    }
  }
}
