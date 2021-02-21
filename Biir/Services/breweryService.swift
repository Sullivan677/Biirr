import Foundation

class breweryService {
    static let shared = breweryService()
    // Decoding the JSON response from URL and handling some errors
    func getResults(completed: @escaping (Result<BeerResult, ErrorMessage>) -> Void) {
        guard let url = URL(string: "\(endPointURL)\(apiKey)") else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completed(.failure(.invalidData))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            do {
                let deconder = JSONDecoder()
                deconder.keyDecodingStrategy = .convertFromSnakeCase
                let results = try deconder.decode(BeerResult.self, from: data)
                completed(.success(results))
                
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
