# ImportableModules-iOS

### Run the app
To run the app, open `ImportableModules_iOS.xcodeproj` in Xcode and after selecting the target and required simulator, press `Cmd + R`

Note: The HelperFunctions module doesn't have UI and hence cannot be used for demo.

### Demo
To run a demo for a particular module, in Xcode, navigate to `ImportableModules-iOS/ProjectFiles/AppDelegate` and change the value of the `mainVc` variable to match the name of the view controller class. 


- For example, to demo ProgressBar implementation, add the following line to `AppDelegate`

        `let mainVc = ProgressBarViewController()`
- To demo OTP implementation, add the following line to `AppDelegate`

        `let mainVc = OTPViewController()`
     
This will set the demo module's corresponding VC as the main screen of the iOS app
