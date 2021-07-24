import Danger
import Foundation
import DangerSwiftCoverage // package: https://github.com/f-meloni/danger-swift-coverage.git
import DangerXCodeSummary // package: https://github.com/f-meloni/danger-swift-xcodesummary.git


let maxWarningsCount = 300

let danger = Danger()

Coverage.xcodeBuildCoverage(.derivedDataFolder("Build"), minimumCoverage: 90)

//SwiftLint.lint(.modifiedAndCreatedFiles(directory: nil), inline: true, configFile: ".swiftlint.yml")


let additions = danger.github.pullRequest.additions
let deletions = danger.github.pullRequest.deletions
let commits = danger.github.pullrequest.commits
message("\(additions)")
message("\(deletions)")
message("\(commits)")

let summary = XCodeSummary(filePath: "./build/reports/errors.json")

if summary.warningsCount > maxWarningsCount {
  fail("There are more than \(maxWarningsCount) warnings")
}

summary.report()
