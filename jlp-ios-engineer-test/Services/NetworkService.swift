
import Foundation

struct NetworkService {
    static func requestJSON<T: Codable>(_ url: URL, handler: @escaping (T) -> ()) {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        session.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "URLSession Error")
                return
            }
            guard let response = response as? HTTPURLResponse, (200..<300).contains(response.statusCode) else {
                print(response?.description ?? "URLSeession Response")
                return
            }
            if let data = data {
                do {
                    print(data)
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    handler(decodedData)
                } catch let DecodingError.dataCorrupted(context) {
                    print("\n \(url)")
                    print(context)
                } catch let DecodingError.keyNotFound(key, context) {
                    print("\n \(url)")
                    print("Key '\(key)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.valueNotFound(value, context) {
                    print("\n \(url)")
                    print("Value '\(value)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.typeMismatch(type, context)  {
                    print("\n \(url)")
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch {
                    print("\n \(url)")
                    print("error: ", error)
                }
            }
        }.resume()
    }
    
    static func requestData(_ url: URL, handler: @escaping (Data) -> ()) {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        session.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "URLSession Error")
                return
            }
            guard let response = response as? HTTPURLResponse, (200..<300).contains(response.statusCode) else {
                print(response?.description ?? "URLSeession Response")
                return
            }
            if let data = data {
                handler(data)
            }
        }.resume()
    }
    
    static func mockJSON<T: Codable>(fileName: String, type: T.Type) -> T? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            if let data = try? Data(contentsOf: url) {
                print(data)
                do {
                    let decodedData = try JSONDecoder().decode(type, from: data)
                    print(decodedData)
                    return decodedData
                } catch let DecodingError.dataCorrupted(context) {
                    print(context)
                } catch let DecodingError.keyNotFound(key, context) {
                    print("Key '\(key)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.valueNotFound(value, context) {
                    print("Value '\(value)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.typeMismatch(type, context)  {
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch {
                    print("error: ", error)
                }
            } else {
                print("Data Error")
            }
        } else {
            print("Path Error")
        }
        return nil
    }
    
}
