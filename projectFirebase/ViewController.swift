//
//  ViewController.swift
//  projectFirebase
//
//  Created by Franco Rodrigues on 3/24/22.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var quoteTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    
    var docRef: DocumentReference!
    
    @IBAction func saveTapped(_ sender: UIButton) {
        guard  let quoteText = quoteTextField.text, !quoteText.isEmpty else { return }
        guard let quoteAuthor = authorTextField.text, !quoteAuthor.isEmpty else { return }
        let dataToSave: [String: Any] = ["quote": quoteText, "author": quoteAuthor]
        docRef.setData(dataToSave) { ( error ) in
            if let error = error {
                print("Oh no! Got an error \(error.localizedDescription)" )
            }else {
                print("Data has been saved")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        docRef = Firestore.firestore().collection("sampleData").document("inspiration")
            
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

