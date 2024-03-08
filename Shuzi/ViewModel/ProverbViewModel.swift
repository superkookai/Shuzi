//
//  ProverbViewModel.swift
//  Shuzi
//
//  Created by Weerawut Chaiyasomboon on 8/3/2567 BE.
//

import Foundation
import Observation

@Observable
class ProverbViewModel{
    var proverbModel = ProverbModel.defaultQuote()
    let urlString = "https://chinese-proverbs.onrender.com/api/proverbs/random"
    
    func getRandomQuote(){
        getQuote(urlString: urlString)
    }
    
    private func getQuote(urlString: String){
        guard let url = URL(string: urlString) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request){ data, response, error in
            if let error{
                print(error.localizedDescription)
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
            guard let data = data else {
                print("Data is nil")
                return
            }
            
            do{
                let newProverb = try jsonDecoder.decode(ProverbModel.self, from: data)
                DispatchQueue.main.async {
                    self.proverbModel = newProverb
                }
            }catch{
                print("Error decoded: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
}
