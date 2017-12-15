//
//  ViewController.swift
//  StormViewer
//
//  Created by Sabrina Fletcher on 12/14/17.
//  Copyright © 2017 Sabrina Fletcher. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
    navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        //implicitly unwrapped optional, might hold data, certain that it does
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items{
            if item.hasPrefix("nssl"){
                //this is a picture to load!
                pictures.append(item)
            }
        }
        print(pictures)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController{
            
            vc.selectedImage = pictures[indexPath.row]
            
        navigationController?.pushViewController(vc, animated: true)
            
        }
    }


}

