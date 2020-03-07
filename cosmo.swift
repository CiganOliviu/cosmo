import Foundation

class setup {

    public let KEY = "abcdefghi";
    public let WORKFLOW_PATH = "D:\\code\\workSpace\\cosmo\\IOData\\" 
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