import Danger
import Foundation
import DangerSwiftHammer // package: https://github.com/el-hoshino/DangerSwiftHammer.git


let danger = Danger()

let file = pathToFile
let lines = danger.hammer.diffLines(in: file)
let additions = lines.additions
