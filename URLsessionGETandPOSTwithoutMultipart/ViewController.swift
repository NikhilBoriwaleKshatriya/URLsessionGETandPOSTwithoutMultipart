//
//  ViewController.swift
//  URLsessionGETandPOSTwithoutMultipart
//
//  Created by nikhil boriwale on 3/5/18.
//  Copyright © 2018 infostretch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func onGetTapped(_ sender: Any) {
        
        guard let url = URL(string:"https://jsonplaceholder.typicode.com/users")else{return}
        // Crete Session ..
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            // chek Response Successfull..or Not
            if let response = response {
                print(response)
            }
            if let data = data
            {
                print(data)
                do{
                    let  json  = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                }catch{
                    print(error)
                }
            }
            // if u not right resume() not called any nothing will happen
       
    }.resume()
    }
    @IBAction func onPostTapped(_ sender: Any) {
        
    guard let url = URL(string:"https://jsonplaceholder.typicode.com/posts")else{return}
        let parameter = ["username":"Nikhil Boriwale","tweet":"Hello Nikhil"]
        var request = URLRequest(url: url)
        
        // add post Req
         request.httpMethod = "POST"
        // set acual type of content to display Json data with Format ..
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpbody = try?JSONSerialization.data(withJSONObject: parameter, options: [])else{return}
        request.httpBody = httpbody
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response{
                print(response)
            }
            if let data = data

            {
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                }catch{
                    print(error)
                }
                
            }
            
        }.resume()
        
    }
   

}

