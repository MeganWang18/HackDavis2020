//
//  MEOviewcontrollerViewController.swift
//  MEO
//
//  Created by Matthew on 1/19/20.
//  Copyright © 2020 MAMA. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift

class MEOviewcontrollerViewController: UIViewController {

    var db: Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
let settings = FirestoreSettings()
        // Do any additional setup after loading the view.
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        db.collection("users").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }

        
    }
    @IBAction func offerRide(_ sender: Any) {
        print("testR")
        var ref: DocumentReference? = nil
        ref = db.collection("users").addDocument(data: [
            "first": "Ada",
            "last": "Lovelace",
            "born": 1815
            /*
             "name": name,
             "Number of Bags": numbags,
             "Number of empty seats": numSeats,
             "Price ": price,
             */
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
