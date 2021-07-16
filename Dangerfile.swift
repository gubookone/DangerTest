import Danger
import Foundation
import DangerSwiftCoverage // package: https://github.com/f-meloni/danger-swift-coverage.git
import DangerXCodeSummary // package: https://github.com/f-meloni/danger-swift-xcodesummary.git


let danger = Danger()

markdown("## New danger.github.pr.head" + danger.github.pr.head)

Coverage.xcodeBuildCoverage(.derivedDataFolder("Build"), minimumCoverage: 90)




SwiftLint.lint(.modifiedAndCreatedFiles(directory: nil), inline: true, configFile: ".swiftlint.yml")

