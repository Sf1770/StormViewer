//
//  DetailViewController.swift
//  StormViewer
//
//  Created by Sabrina Fletcher on 12/14/17.
//  Copyright © 2017 Sabrina Fletcher. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedImage : String?
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        title = selectedImage
        if let imageLoad = selectedImage {
            imageView.image = UIImage(named: imageLoad)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    override func prefersHomeIndicatorAutoHidden() -> Bool {
        return navigationController!.hidesBarsOnTap
    }
}
