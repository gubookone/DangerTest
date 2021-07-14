import Danger
import Foundation
//import DangerSwiftHammer // package: https://github.com/el-hoshino/DangerSwiftHammer.git
//import DangerSwiftCoverage // package: https://github.com/f-meloni/danger-swift-coverage.git
//import DangerXCodeSummary // package: https://github.com/f-meloni/danger-swift-xcodesummary.git


let danger = Danger()


//XCodeSummary(filePath: "result.json").report()

SwiftLint.lint(.modifiedAndCreatedFiles(directory: nil), inline: true, configFile: ".swiftlint.yml")
//Coverage.xcodeBuildCoverage(.derivedDataFolder("Build"), minimumCoverage: 90)


//let report = xcov.produce_report(
//  scheme: 'EasyPeasy',
//  workspace: 'Example/EasyPeasy.xcworkspace',
//  exclude_targets: 'Demo.app',
//  minimum_coverage_percentage: 90
//)
//
//# Do some custom filtering with the report here
//
//# Post markdown report
//xcov.output_report(report)
warn("waring")
