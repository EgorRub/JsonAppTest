//
//  MainCollectionViewController.swift
//  JsonAppTest
//
//  Created by Егор on 08.08.2021.
//

import UIKit

enum URLExamples: String {
    case imageStatus = "https://images.dog.ceo//breeds//deerhound-scottish//n02092002_49.jpg"
    case selectionOne = "https://freegeoip.app/json/"
}


enum UserActions: String, CaseIterable {
    case downloadImage = "Download Image"
    case selectCity = "Check Cordinates"
}


class MainCollectionViewController: UICollectionViewController {
    private let userActions = UserActions.allCases
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        userActions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserCell
        
        cell.userActionLabel.text = userActions[indexPath.item].rawValue
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userAction = userActions[indexPath.item]
        
        switch userAction {
        case .downloadImage: performSegue(withIdentifier: "showImage", sender: nil)
        case .selectCity: performSegue(withIdentifier: "showCity", sender: nil)
        }
        
    }
    
    // MARL: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCity" {
            let cityVC = segue.destination as! CityTableViewController
            cityVC.fetchCity()
        }
    }
    
    
    
}

extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
}
