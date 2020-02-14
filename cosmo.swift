import Foundation

class cosmoIO {

    func readFileName () -> String {

        let filePath = readLine()

        return filePath!

    }

    func readDataFromFile (_ path: String) -> String {
        
        var data = ""

        if freopen(path, "r", stdin) == nil {
            perror(path)
        }

        while let dataFluxStream = readLine () {
            data += dataFluxStream
        }

        return data; 
    }

    func putsInFile (_ filename: String, message: String) -> Void {

        do {
            try message.write(toFile: filename, atomically: false, encoding: String.Encoding.utf8)

        } catch let error as NSError {
    
            print("Unable to process: \(error)")
    
        } catch {

        }
    }

}

let cosmoObjectRefference = cosmoIO()
let data = cosmoObjectRefference.readDataFromFile(cosmoObjectRefference.readFileName())
cosmoObjectRefference.putsInFile("D:\\code\\workSpace\\cosmo\\ouputDataStream.dataFlux", message: data)

// D:\code\workSpace\cosmo\DataStream.dataFlux