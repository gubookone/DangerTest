import Danger
import Foundation
import DangerSwiftCoverage // package: https://github.com/f-meloni/danger-swift-coverage.git
import DangerXCodeSummary // package: https://github.com/f-meloni/danger-swift-xcodesummary.git
import DangerSwiftHammer // package: https://github.com/el-hoshino/DangerSwiftHammer.git


let maxWarningsCount = 300

let danger = Danger()

Coverage.xcodeBuildCoverage(.derivedDataFolder("Build"), minimumCoverage: 90)

//SwiftLint.lint(.modifiedAndCreatedFiles(directory: nil), inline: true, configFile: ".swiftlint.yml")


let arr = danger.git.createdFiles + danger.git.modifiedFiles

let swiftFilesWithCopyright = arr.filter { $0.fileType == .swift }

swiftFilesWithCopyright.forEach { file in
    let lines = danger.hammer.diffLines(in: file)
    let additions = lines.additions.map { $0.contains("if #available(iOS")}
    
    if additions.isEmpty != false {
        message("""
                OS 버전을 분기하는 코드가 들어가 있네요.
                티켓에 명시하는거 잊지 마세요~
                """)
    }
}


let summary = XCodeSummary(filePath: "./build/reports/errors.json")

if summary.warningsCount > maxWarningsCount {
  fail("There are more than \(maxWarningsCount) warnings")
}

summary.report()
