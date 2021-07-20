import Danger
import Foundation
import DangerSwiftCoverage // package: https://github.com/f-meloni/danger-swift-coverage.git
import DangerXCodeSummary // package: https://github.com/f-meloni/danger-swift-xcodesummary.git




let danger = Danger()

Coverage.xcodeBuildCoverage(.derivedDataFolder("Build"), minimumCoverage: 90)

SwiftLint.lint(.modifiedAndCreatedFiles(directory: nil), inline: true, configFile: ".swiftlint.yml")


let summary = XCodeSummary(filePath: "Build/Build/reports/error.json")

if summary.warningsCount > maxWarningsCount {
  fail("There are more than \(maxWarningsCount) warnings"
}

summary.report()
