//
//  NextViewController.swift
//  SlideshowApp
//
//  Created by 杉山貴哉 on 2020/09/02.
//  Copyright © 2020 TakayaSugiyama. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
 
    var imageString: String? = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: imageString!)
        // Do any additional setup after loading the view.
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
