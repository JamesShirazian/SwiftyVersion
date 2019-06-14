# SwiftyVersion

Swifty package allow the user to detect Version or Build changes


```Swift
SwiftyVersion { (state, version, build) in
switch state{
case .InitLaunch:
print("Init Launched \(version)  \(build)")
break;
case .NewVersion:
print("New Version \(version)  \(build)")

break;
case .NotChanged:
print("Not Changed \(version)  \(build)")

break;
}
}
```
