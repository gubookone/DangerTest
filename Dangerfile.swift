import Danger
import Foundation
//import DangerSwiftHammer // package: https://github.com/el-hoshino/DangerSwiftHammer.git
import DangerSwiftCoverage // package: https://github.com/f-meloni/danger-swift-coverage.git
//import DangerXCodeSummary // package: https://github.com/f-meloni/danger-swift-xcodesummary.git


let danger = Danger()


//XCodeSummary(filePath: "result.json").report()

SwiftLint.lint(.modifiedAndCreatedFiles(directory: nil), inline: true, configFile: ".swiftlint.yml")
Coverage.xcodeBuildCoverage(.derivedDataFolder("Build"), minimumCoverage: 90)
