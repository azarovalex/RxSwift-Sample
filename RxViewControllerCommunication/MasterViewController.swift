//
//  ViewController.swift
//  RxViewControllerCommunication
//
//  Created by Brian Advent on 09.01.18.
//  Copyright © 2018 Brian Advent. All rights reserved.
//

import UIKit
import RxSwift


class MasterViewController: UIViewController {

    @IBOutlet weak var greetingsLabel: UILabel!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func selectCharacter(_ sender: Any) {
        
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.selectedCharacter
            .subscribe(onNext: { [weak self] character in
                self?.greetingsLabel.text = "Hello \(character)"
            }).disposed(by: disposeBag)
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

