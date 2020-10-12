/*
MIT License

Copyright (c) 2020 Cigan Oliviu David

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

import Foundation

class setup {

    public let KEY = "abcdefghi";
    public let WORKFLOW_PATH = ""
}

class cosmoIO {

    func readFileName () -> String {

        let filePath = readLine()

        return filePath!

    }

    func readDataFromFile (path: String) -> String {

        var data = ""

        if freopen(path, "r", stdin) == nil {
            perror(path)
        }

        while let dataFluxStream = readLine () {
            data += dataFluxStream
        }

        return data;
    }

    func putsInFile (filename: String, message: String) -> Void {

        do {
            try message.write(toFile: filename, atomically: false, encoding: String.Encoding.utf8)

        } catch let error as NSError {

            print("Unable to process: \(error)")

        } catch {

        }
    }
}

class cosmoCriptoProcessor {

    func processCriptography (key: String) -> Array<Character> {

        var lettersForCripto = [Character]()

        for letter in key {
            lettersForCripto.append(letter);
        }

        return lettersForCripto
    }

    func convertListToDictionary (lettersList: Array<Character>) -> Dictionary<Character, Int> {

        var lettersDictionaryRefference = Dictionary<Character, Int>()
        var iterator = 0

        for letter in lettersList {
            lettersDictionaryRefference[letter] = iterator;
            iterator += 1;
        }

        return lettersDictionaryRefference
    }

    func processCriptoMessage (dictionaryLetters: Dictionary<Character, Int>, message: String) -> String {

        var crypto_msg = ""

        for (key_letter, number) in dictionaryLetters {

            for letter in message {
                if letter == key_letter {
                    crypto_msg += String(number)
                }
            }
            crypto_msg += String(key_letter)
        }
        return crypto_msg
    }
}

let cosmoIOObjectRefference = cosmoIO()
let cosmoCriptoProcessorRefference = cosmoCriptoProcessor()
let systemSetup = setup()

var list = [Character]()
var listDict = Dictionary<Character, Int>()
var msg = String()

let data = cosmoIOObjectRefference.readDataFromFile(path: systemSetup.WORKFLOW_PATH + cosmoIOObjectRefference.readFileName())

list = cosmoCriptoProcessorRefference.processCriptography(key: systemSetup.KEY)
listDict = cosmoCriptoProcessorRefference.convertListToDictionary(lettersList: list)
msg = cosmoCriptoProcessorRefference.processCriptoMessage(dictionaryLetters: listDict, message: data)

cosmoIOObjectRefference.putsInFile(filename: systemSetup.WORKFLOW_PATH + "ouputDataStream.dataFlux", message: msg)
