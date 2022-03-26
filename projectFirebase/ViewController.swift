//
//  ViewController.swift
//  projectFirebase
//
//  Created by Franco Rodrigues on 3/24/22.
//

import UIKit
import Firebase
import FirebaseFirestore

class ViewController: UIViewController {
    
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var quoteTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    
    var docRef: DocumentReference!
    var quoteListener: ListenerRegistration!
    
    @IBAction func saveTapped(_ sender: UIButton) {
        guard  let quoteText = quoteTextField.text, !quoteText.isEmpty else { return }
        guard let quoteAuthor = authorTextField.text, !quoteAuthor.isEmpty else { return }
        let dataToSave: [String: Any] = ["quote": quoteText, "author": quoteAuthor]
        docRef.setData(dataToSave) { ( error ) in
            if let error = error {
                print("Oh no! Got an error! \(error.localizedDescription)" )
            }else {
                print("Data has been saved")
            }
        }
    }
    @IBAction func fetchTapped(_ sender: UIButton) {
        docRef.getDocument { (docSnapshot, error) in
            guard let docSnapshot = docSnapshot, docSnapshot.exists else { return }
            let myData = docSnapshot.data()
            let latestQuote = myData?["quote"] as? String ?? ""
            let quoteAuthor = myData!["author"] as? String ?? "(none)"
            self.quoteLabel.text = "\"\(latestQuote)\" -- \(quoteAuthor)"
            
        }
    }
                                   
    override func viewDidLoad() {
            super.viewDidLoad()
            docRef = Firestore.firestore().document("SmpleData/inspiration")
            
            
        }
                                   override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
                                   
                                   }
