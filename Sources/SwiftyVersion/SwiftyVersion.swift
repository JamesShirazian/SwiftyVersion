import Foundation


/// Version states
public enum State{
    case NewVersion, InitLaunch, NotChanged
}


/// <#Description#>
public class SwiftyVersion{
    
    public init(completion: (_ state: State,_ version : String,_ build: String) -> Void){
        
        let currentBuild = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
        let currentVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String
        
        let CFBundleShortVersionStringOfLastRun = UserDefaults.standard.object(forKey: "CFBundleShortVersionStringOfLastRun") as? String
        let CFBundleVersionOfLastRun = UserDefaults.standard.object(forKey: "CFBundleVersionOfLastRun") as? String
        
        if CFBundleShortVersionStringOfLastRun == nil, CFBundleVersionOfLastRun == nil{
            completion(.InitLaunch,currentVersion!,currentBuild!)
        } else if currentBuild != CFBundleShortVersionStringOfLastRun ||  currentVersion != CFBundleVersionOfLastRun{
            completion(.NewVersion,currentVersion!,currentBuild!)
        }else{
            completion(.NotChanged,currentVersion!,currentBuild!)
        }
        
        UserDefaults.standard.set(currentBuild, forKey: "CFBundleShortVersionStringOfLastRun")
        UserDefaults.standard.set(currentVersion, forKey: "CFBundleVersionOfLastRun")
        UserDefaults.standard.synchronize()
        
    }
}

