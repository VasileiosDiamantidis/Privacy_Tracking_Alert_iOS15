# Privacy_Tracking_Alert_iOS15
This is project is a bug report that demonstrates that app tracking transparency alert is not being presented when another permission has been presented before.
The project was created using Xcode Version 12.5


The "Privacy_Tracking_Alert_iOS15" app presents 3 permission requests to the user. 
- Permission for camera usage
- Permission for Notifications
- Permission for App tracking transparency

<b>Expected behaviour</b> <br>
Running the project should show the initial screen and the prompts stacked so when the user responds to the first permission request then to have to accept the second permission request and finally the App tracking transparency request.<br>
The expected behaviour is reproducible in iOS devices runing iOS version 14.x and 13.x.

<b>Issue </b><br>
When the project runs on device with iOS/iPadOS 15.0, only the permission requests for the camera usage and notifications are being presented to the user.<br>
The permission request for App tracking transparency is not being presented.

If we comment the lines 20,21 from AppDelegate.swift that calls the requests for camera usage and notifications, the App tracking transparency request is being presented to the user.

<b>Steps to reproduce</b><br>
- Clone project
- run the app on iOS/iPadOS device with version 15.0
