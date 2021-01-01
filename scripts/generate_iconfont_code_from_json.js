const path = require('path');

let readFile = require('./helper_functions').readFile
let writeFile = require('./helper_functions').writeFile
let copyFile = require('./helper_functions').copyFile
let addBreakLine = require('./helper_functions').addBreakLine
let addIndentTab = require('./helper_functions').addIndentTab

const interfaceFilename = 'QBIconFontClassMapInfo.h'
const implementFilename = 'QBIconFontClassMapInfo.m'

const projectPath = path.resolve(__dirname, '../')
const destFolder = path.resolve(projectPath, './IconfontExtention')
const iconfontJsonPath = path.resolve(projectPath, './font_package/iconfont.json')
const iconfontTTFSrcPath = path.resolve(projectPath, './font_package/iconfont.ttf')
const iconfontTTFDestPath = path.resolve(destFolder, './iconfont.ttf')
const interfaceFilePath = path.resolve(destFolder, interfaceFilename)
const implementFilePath = path.resolve(destFolder, implementFilename)

const interfaceContent = "// -------------------------------------\n" +
    "// This file is auto-generated by script\n" +
    "// ------------------------------------- \n" +
    "\n" +
    "#import <Foundation/Foundation.h> \n" +
    "#import \"IconFontClassMapProtocol.h\"\n" +
    "\n" +
    "NS_ASSUME_NONNULL_BEGIN\n" +
    "\n" +
    "@interface QBIconFontClassMapInfo : NSObject <IconFontClassMapProtocol>\n" +
    "\n" +
    "@end\n" +
    "\n" +
    "NS_ASSUME_NONNULL_END";



let implementContent = (glyphs) => {
    var keyAndValue = ''
    glyphs.forEach(
        (value) => {
            glyphs[value['font_class']] = value['unicode']
            keyAndValue += "\t" + "\t" +"@\"" +
                `${value['font_class']}`  +
                "\"" + ":" + " " +
                "@\"" +
                `${value['unicode']}` + "\""  + "," +
                addIndentTab() +
                addIndentTab() +
                "//" + " " + `${value['name']}` +
                addBreakLine()
        }
    )

    let content = "// -------------------------------------\n" +
        "// This file is auto-generated by script\n" +
        "// ------------------------------------- \n" +
        "\n" +
        "#import \"QBIconFontClassMapInfo.h\"\n" +
        "\n" +
        "@implementation QBIconFontClassMapInfo\n" +
        "\n" +
        "+ (NSDictionary<QBFontClass, QBUnicode> *)iconFontClassMap {\n" +
        "\treturn @{\n" +
        `${keyAndValue}` +
        "\t};\n" +
        "};\n" +
        "\n" +
        "+ (QBUnicode)iconfontUnicode:(QBFontClass)fontClass {\n" +
        "\tNSString *unicode = [[self iconFontClassMap] valueForKey:fontClass];\n" +
        "\n" +
        "#ifdef DEBUG\n" +
        "\tif (unicode.length < 1) {\n" +
        "\t\tNSString *errorMsg = [NSString stringWithFormat:@\"[QBIconFont] FontClass:【%@】 doesn't exist\", fontClass];\n" +
        "\t\tNSLog(@\"%@\", errorMsg);\n" +
        "\t}\n" +
        "\n" +
        "#endif\n" +
        "\n" +
        "\treturn unicode;\n" +
        "}\n" +
        "\n" +
        "@end\n";

    return content
}


let generateIconfontInfoFile = () => {
    console.log('*********拷贝iconfon.ttf文件到：' + `${iconfontTTFDestPath}`)
    copyFile(iconfontTTFSrcPath, iconfontTTFDestPath).then(
        () => {
            console.log('*********拷贝iconfon.ttf文件成功！')
        }
    ).catch(
        (err) => {
            console.log('*********拷贝iconfon.ttf文件失败！')
        }
    )

    console.log('*********正在读取iconfont.json文件')
    readFile(iconfontJsonPath).then(
        JSON.parse
    ).then(
        (value) => {
            console.log('*********正在生成QBIconFontClassMapInfo.h/.m文件')
            writeFile(interfaceFilePath)(interfaceContent)
            console.log('*********.h文件path： ' +  `${interfaceFilePath}`)
            writeFile(implementFilePath)(implementContent(value["glyphs"]))
            console.log('*********.m文件path： ' +  `${implementFilePath}`)

        }
    )
}

generateIconfontInfoFile()
