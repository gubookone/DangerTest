import Danger
import Foundation
import DangerSwiftCoverage // package: https://github.com/f-meloni/danger-swift-coverage.git
import DangerXCodeSummary // package: https://github.com/f-meloni/danger-swift-xcodesummary.git
import DangerSwiftHammer // package: https://github.com/el-hoshino/DangerSwiftHammer.git
import DangerShellExecutor


let maxWarningsCount = 300

let danger = Danger()
let executor = ShellExecutor()

Coverage.xcodeBuildCoverage(.derivedDataFolder("Build"), minimumCoverage: 90)






let swiftC = try executor.execute("curl -H 'Accept: application/vnd.github.v3+json' 'https://api.github.com/repos/gubookone/DangerTest/'", arguments: [])
print(swiftC)


 


let summary = XCodeSummary(filePath: "./build/reports/errors.json")

if summary.warningsCount > maxWarningsCount {
  fail("There are more than \(maxWarningsCount) warnings")
}

summary.report()
