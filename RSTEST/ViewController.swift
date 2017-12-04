//
//  ViewController.swift
//  RSTEST
//
//  Created by Roman Smirnov on 04/12/2017.
//  Copyright © 2017 Roman Smirnov. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    @IBOutlet weak var tField: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var tLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        let myJust = { (element: String) -> Observable<String> in
            return Observable.create { observer in
                observer.on(.next(element))
                observer.on(.completed)
                return Disposables.create()
            }
        }
        
        myJust("z")
            .subscribe {
                if let el = $0.element {
                    self.tLabel.text = ( self.tLabel.text ?? "" ) + "\n" + el
                } else {
                    self.tLabel.text = ( self.tLabel.text ?? "" ) + "\n" + $0.debugDescription
                }
                print("self.tLabel.text = \(self.tLabel.text!))")
            }
            .disposed(by: disposeBag)
    }
}

