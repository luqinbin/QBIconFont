const fs = require('fs')
const pify = require('pify')

let stat = fs.stat;

// handle file system

let readFile = (filepath) => {
    return pify(fs.readFile)(filepath, 'utf8')
}

let writeFile = (filepath) => {
    return function useData(data) {
        return pify(fs.writeFile)(filepath, data)
    }
}

let copyFile = (src, dest) => {
    return new Promise(
        (resolve, reject) => {
            fs.copyFile(src, dest, (err) => {
                if (err) {
                    reject(err)
                } else {
                    resolve()
                }
            })
        }
    )
}

let addBreakLine = () => {
    return "\n";
}

let addIndentTab = () => {
    return "\t";
}

module.exports = {
    readFile,
    writeFile,
    copyFile,
    addBreakLine,
    addIndentTab,
}
