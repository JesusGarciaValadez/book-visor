//
//  WebViewController.swift
//  Book Visor
//
//  Created by Jesús García Valadez on 05/09/16.
//  Copyright © 2016 Hydrastudio. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

  var fileName : String? = nil
  var filePath : URL? = nil

  @IBOutlet weak var webView: UIWebView!

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    self.webView.scalesPageToFit = true
    showPDF()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func showPDF() {
    if let file = self.fileName {
      self.filePath = NSURL(
        fileURLWithPath: Bundle.main.path( forResource: file, ofType: "pdf" )!
      ) as URL
    } else {
      self.filePath = NSURL(
        fileURLWithPath: Bundle.main.path( forResource: "pdf_1", ofType: "pdf" )!
      ) as URL
    }

    let pdfFile = NSData( contentsOf: filePath! ) as! Data

    DispatchQueue.main.async(execute: {
      self.webView.load(
        pdfFile,
        mimeType: "application/pdf",
        textEncodingName: "utf-8",
        baseURL: self.filePath!
      )
    } )
  }

  /*
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
  }
  */

}
