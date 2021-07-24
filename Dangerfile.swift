import Danger
import Foundation
import DangerSwiftCoverage // package: https://github.com/f-meloni/danger-swift-coverage.git
import DangerXCodeSummary // package: https://github.com/f-meloni/danger-swift-xcodesummary.git


let maxWarningsCount = 300

let danger = Danger()

Coverage.xcodeBuildCoverage(.derivedDataFolder("Build"), minimumCoverage: 90)

//SwiftLint.lint(.modifiedAndCreatedFiles(directory: nil), inline: true, configFile: ".swiftlint.yml")


let arr = danger.git.createdFiles + danger.git.modifiedFiles

let swiftFilesWithCopyright = arr.filter { $0.fileType == .swift && danger.utils.readFile($0).contains("if #available(iOS") }

if swiftFilesWithCopyright.isEmpty {
    message("없음")
} else {
    message("있음")
}


let summary = XCodeSummary(filePath: "./build/reports/errors.json")

if summary.warningsCount > maxWarningsCount {
  fail("There are more than \(maxWarningsCount) warnings")
}

summary.report()
