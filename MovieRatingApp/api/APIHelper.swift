//
//  APIHelper.swift
//  MovieRatingApp
//
//  Created by Nick Thacke on 8/12/23.
//

import Foundation

/**
 READ ME
 
 Error: Error Domain=NSURLErrorDomain Code=-1002 "unsupported URL" UserInfo={NSLocalizedDescription=unsupported URL, NSErrorFailingURLStringKey=localhost:8080/api/movie/, NSErrorFailingURLKey=localhost:8080/api/movie/, _NSURLErrorRelatedURLSessionTaskErrorKey=(
     "LocalDataTask <CF7C666D-9CFE-4BF1-9789-5A0148C0164E>.<1>"
 ), _NSURLErrorFailingURLSessionTaskErrorKey=LocalDataTask <CF7C666D-9CFE-4BF1-9789-5A0148C0164E>.<1>, NSUnderlyingError=0x600000a3ba50 {Error Domain=kCFErrorDomainCFNetwork Code=-1002 "(null)"}}
 
 The above error occurs because the URL given is not correct / supported. Verify that the given URL is prefixed with "http://"
 */

public class APIHelper {
    public static func getUsers() {
        print("Inside getUsers()")
        guard let apiUrl = URL(string: "http://localhost:8080/api/users") else {
            print("An error occurred with the URL")
            return //error
        }
        let session = URLSession.shared
        
        var request = URLRequest(url: apiUrl)
        request.httpMethod = "GET" // Replace with your desired request method
        
        let dataTask = session.dataTask(with: apiUrl) { data, response, error in
            print("Inside dataTask")
            if let error = error {
                // Handle error
                print("Error: \(error)")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
                
                if let data = data {
                    if let user = processUsers(data : data){
                        print(user[0].username)
                    }
                }
            }
        }
        dataTask.resume()
    }
    
    private static func processUsers(data : Data) -> [User]? {
        do {
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode([User].self, from: data)
            return jsonData
        } catch {
            print(String(describing: error))
        }
        return nil
    }
    
    public static func login(username: String, completion: @escaping (Bool) -> ()) {
        print("Attempting to login \(username)")
        guard let apiUrl = URL(string: "http://localhost:8080/api/login/account") else {
            print("An error occurred with the URL")
            completion(false)
            return
        }
        let session = URLSession.shared
        
        var request = URLRequest(url: apiUrl)
        request.httpMethod = "POST"
        
        // Create the data you want to send in the request body
        let postString = "username=\(username)"
        request.httpBody = postString.data(using: .utf8)
        
        // Set the content type header to application/x-www-form-urlencoded
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        let dataTask = session.dataTask(with: request) { data, response, error in
            print("Inside dataTask")
            if let error = error {
                // Handle error
                print("Error: \(error)")
                completion(false)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print(httpResponse.statusCode)
                if httpResponse.statusCode == 200 {
                    completion(true)
                } else {
                    completion(false)
                }
            }
        }
        dataTask.resume()
    }
    
    static func insertMovies(into : Manager, completion: @escaping () -> ()) {
        print("Inside insertMovies()")
        guard let url = URL(string : "http://localhost:8080/api/movie/") else {
            print("URL has mistake")
            completion()
            return
        }
        
        let session = URLSession.shared
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let dataTask = session.dataTask(with: url) { data, response, error in
            print("Inside dataTask")
            if let error = error {
                // Handle error
                print("Error: \(error)")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
                
                if let data = data {
                    if let movies = processMovies(data : data){
                        into.insertMovies(movies: movies)
                        completion()
                    }
                }
            }
        }
        dataTask.resume()
        
    }
    
    private static func processMovies(data : Data) -> [Movie]? {
        do {
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode([Movie].self, from: data)
            return jsonData
        } catch {
            print(String(describing: error))
        }
        return nil
    }
}

