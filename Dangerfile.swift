import Danger
import Foundation
import DangerSwiftCoverage // package: https://github.com/f-meloni/danger-swift-coverage.git
import DangerXCodeSummary // package: https://github.com/f-meloni/danger-swift-xcodesummary.git




let danger = Danger()

markdown("## New danger.github.pr.head : " + github.pullRequest.base.ref)

slather.configure("DangerTest.xcodeproj", "DangerTest", options: {
  workspace: 'DangerTest',
  build_directory: 'DangerTest',
  ci_service: github})

slather.notify_if_coverage_is_less_than(minimum_coverage: 80)
slather.notify_if_modified_file_is_less_than(minimum_coverage: 60)
slather.show_coverage

Coverage.xcodeBuildCoverage(.derivedDataFolder("Build"), minimumCoverage: 90)




SwiftLint.lint(.modifiedAndCreatedFiles(directory: nil), inline: true, configFile: ".swiftlint.yml")

