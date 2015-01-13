//
//  ViewController.swift
//  Thoughts
//
//  Created by Tiago Mergulhão on 12/01/15.
//  Copyright (c) 2015 Tiago Mergulhão. All rights reserved.
//

import UIKit

// NSUserDefaults only works with NSObjects
// NSData, NSString, NSNumber, NSDate, NSArray or NSDictionary; recursivelly
// https://developer.apple.com/Library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSUserDefaults_Class/index.html#//apple_ref/occ/instm/NSUserDefaults/setObject:forKey:

class ViewController: UIViewController {
	
	@IBOutlet weak var textLabel: UILabel!
	@IBOutlet weak var textField: UITextView!
	@IBAction func addButton(sender: AnyObject) {
		items.append(textField.text)
		
		textField.text = ""
		
		NSUserDefaults.standardUserDefaults().setObject(items, forKey: "rs.stae.ThoughtsPersistence")
		NSUserDefaults.standardUserDefaults().synchronize()
		
		textLabel.text = "THANK YOU"
	}
	
	var items : Array<String> = []

	override func viewDidLoad() {
		super.viewDidLoad()
		
		if let lastSessionItems =
			NSUserDefaults.standardUserDefaults().objectForKey("rs.stae.ThoughtsPersistence") as? Array<String> {
			
			items = lastSessionItems
		}
		
		for item in items {
			println(item)
		}
		
		NSUserDefaults.standardUserDefaults().synchronize()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		
		// Dispose of any resources that can be recreated.
	}


}

