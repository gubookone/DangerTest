import Danger
import Foundation
import DangerSwiftCoverage // package: https://github.com/f-meloni/danger-swift-coverage.git
import DangerXCodeSummary // package: https://github.com/f-meloni/danger-swift-xcodesummary.git
import DangerSwiftHammer // package: https://github.com/el-hoshino/DangerSwiftHammer.git
import DangerShellExecutor


let maxWarningsCount = 300

let danger = Danger()
let executor = ShellExecutor()

//Coverage.xcodeBuildCoverage(.derivedDataFolder("Build"), minimumCoverage: 90)

//
//if let number = ProcessInfo.processInfo.environment["PR_NUMBER"] as? String {
//    print(" PR number = \(number)")
//}





//let swiftC = try executor.execute("curl -H 'Accept: application/vnd.github.v3+json' 'https://api.github.com/repos/gubookone/DangerTest/'", arguments: [])
//print(swiftC)

//
//let env = try executor.execute("env", arguments: [])
//print(env)
//
//let number = "curl -SSL -H Accept: application/vnd.github.v3+json -H Authorization: token $GITHUB_TOKEN -X POST -H 'Content-Type: application/json' -d '{\"labels\":[\"bug\"]}' https://api.github.com/repos/gubookone/DangerTest/issues/$PR_NUMBER/labels"

//
//let env2 = try executor.execute("curl -X POST -H Accept: application/vnd.github.v3+json -H Authorization: token $GITHUB_TOKEN https://api.github.com/repos/gubookone/DangerTest/pulls/$PR_NUMBER" , arguments: [])
//print(env2)
////

if let token = ProcessInfo.processInfo.environment["GITHUB_TOKEN"],
   let number = ProcessInfo.processInfo.environment["PR_NUMBER"] {
    let script = "curl -v -X POST -H 'Accept: application/vnd.github.v3+json' -H 'Authorization: token \(token)' -H \"Content-Type: application/json\" -d '{\"labels\":[\"bug\"]}' https://api.github.com/repos/gubookone/DangerTest/issues/\(number)/labels"
    
    let env = try? executor.execute(script, arguments: [])
    print(" sh = \(env)")
}



//if let token = ProcessInfo.processInfo.environment["GITHUB_TOKEN"],
//   let number = ProcessInfo.processInfo.environment["PR_NUMBER"] {
//    let script = "curl -v -H 'Accept: application/vnd.github.v3+json' -H 'Authorization: token \(token)' -H \"Content-Type: application/json\" https://api.github.com/repos/gubookone/DangerTest/pulls"
//
//    let env = try? executor.execute(script, arguments: [])
//    print(" sh = \(env)")
//}


//let env2 = executor.execute("curl -H 'Accept: application/vnd.github.v3+json' -H 'Authorization: token $GITHUB_TOKEN' -X POST -d {'labels':'bug'} https://api.github.com/repos/gubookone/DangerTest/issues/$PR_NUMBER/labels" , arguments: [])
//print(env2)

//let summary = XCodeSummary(filePath: "./build/reports/errors.json")
//
//if summary.warningsCount > maxWarningsCount {
//  fail("There are more than \(maxWarningsCount) warnings")
//}
//
//summary.report()
