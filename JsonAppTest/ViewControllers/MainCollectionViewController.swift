//
//  MainCollectionViewController.swift
//  JsonAppTest
//
//  Created by Егор on 08.08.2021.
//

import UIKit

enum URLExamples: String {
    case imageStatus = "https://images.dog.ceo//breeds//deerhound-scottish//n02092002_49.jpg"
    case selectionOne = "https://training.xcelvations.com/data/books.json"
    case alamofire = "https://api.nasa.gov/DONKI/HSS?startDate=2016-01-01&endDate=2016-01-31&api_key=DEMO_KEY"
}

enum UserActions: String, CaseIterable {
    case downloadImage = "Check an Image"
    case person = "Find Book"
    case alamofire = "Hight Speed Stream (HSS)"
}

class MainCollectionViewController: UICollectionViewController {

    private let userActions = UserActions.allCases
    
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        userActions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserCell
        
        let userAction = userActions[indexPath.item]
        cell.userActionLabel.text = userAction.rawValue
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let userAction = userActions[indexPath.item]
        
        switch userAction {
        case .downloadImage: performSegue(withIdentifier: "showImage", sender: nil)
        case .person: performSegue(withIdentifier: "showPersonList", sender: nil)
        case .alamofire: performSegue(withIdentifier: "showHHS", sender: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPersonList" {
            let personVC = segue.destination as! PersonViewController
            personVC.fetchPersons()
        }
    }
    
    

    // MARK: UICollectionViewDelegate
    
    
    
    // MARK: Navigation
    
    
    
}
extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
}
