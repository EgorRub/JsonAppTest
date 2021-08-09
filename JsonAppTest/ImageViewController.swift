//
//  ImageViewController.swift
//  JsonAppTest
//
//  Created by Егор on 08.08.2021.
//

import UIKit

class ImageViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var labelStatusCheck: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        fetchImage()
    }

    
    
    
    private func fetchImage() {
        guard let url = URL(string: URLExamples.imageStatus.rawValue) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let response = response else {
                print(error?.localizedDescription ?? "No error decription")
                return
            }
            print(response)
           
            guard let image = UIImage(data: data) else { return }
//            guard let status = UITextField(data: data) else { return }
            
            DispatchQueue.main.async {
                self.imageView.image = image
//                self.labelStatusCheck.text = status
                self.activityIndicator.stopAnimating()
            }
        }.resume()
    }
}
