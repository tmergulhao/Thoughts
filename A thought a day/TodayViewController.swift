//
//  TodayViewController.swift
//  A thought a day
//
//  Created by Tiago Mergulhão on 12/01/15.
//  Copyright (c) 2015 Tiago Mergulhão. All rights reserved.
//

import UIKit
import NotificationCenter

/**
*	CUSTOM THOUGHTS AND TWITTER FEED
*	Também pode servir para olhar um tweet ou outro e deletar na medida da necessidade
*	Pode tem tag de música ou de... sei lá... meio que um diário shuffle
*/

extension String {
	var length : Int {
		let asNSString = NSString(string: self)
		
		return asNSString.length
	}
	
	func trimWithReticence (length : Int) -> String {
		
		//	better reticence trimming
		//	\s\S*$
		
		if self.length > length {
			// .substringWithRange(Range<String.Index>(start: advance(str.startIndex, 2), end: advance(str.endIndex, -1)))
			return self.substringWithRange(Range<String.Index>(start: self.startIndex, end: advance(self.startIndex, length - 1))).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) + "…"
		}
		
		return self
	}
}

class TodayViewController: UIViewController, NCWidgetProviding {
	
	@IBOutlet var thoughtLabel : UILabel!
	
	@IBAction func buttonPress () {}
	
	var lastUpdated : NSDate?
	var target : Int?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		var items : Array<String> = [
		"Estudar é uma atividade ativa que necessita constante prova de atenção. \nAo estudar faça exercícios que exijam pesquisa de forma a criar um ciclo iterativo. Procure evitar browsing e leitura passiva. E sempre termine o ciclo com recompensa.\nSegmentar um objetivo local é tão importante quanto ter uma meta. Dividir a tarefa é mais importante do que tentar conquistar o mundo de uma vez pois seu cérebro naturalmente concatena idéias relacionadas. Quanto mais você estudar mais abrangentes e concisas serão suas soluções.",
		"Sobre a vida \n\nEu estava equivocado.\nEu aceito a banalidade da vida.\nEu aceito o curso comum da vida.\nEu me perdôo pelos meus erros.\nEu aceito meus erros.\nEu perdôo os erros dos outros.\nEu quero ter uma vida.\nEu me perdôo por ser um idiota.",
		"Features of love.\n\nA lover is like a cheer glimmer of glamour. It's a ball and the premiere of a history. Is light of life and ember for your heart.\nA friend is the jewel well cared for that shines wherever you go. It contemplates your image and shares its very own traits.\nThe family is the ever growing building of concrete. It's the stone of ages that sets respect and withstands cataclysms.\nLearn the difference.",
		"Pequenos pensamentos\n\nDo que falta por fora\ncresce por dentro\nDe um lado posa' fome\nd'outro logra sustento\n\nDas várias maneiras de amar\nbelas, audazes, grosseiras\nForam enumeradas todas;\nvãs que coincidem com errar",
		"The best way to disassemble http://www.hopperapp.com"
		]
		
		if let lastSession = NSUserDefaults.standardUserDefaults().objectForKey("rs.stae.ThoughtsPersistence") as? Array<String> {
			items = lastSession
		}
		
		// thoughtLabel.text = "No thoughts for today."
		
		thoughtLabel.text = items[Int(arc4random_uniform(UInt32(items.count)))].trimWithReticence(140)
		
		/*
		// http://stackoverflow.com/questions/25390446/how-to-replicate-the-blurred-text-in-notification-center-ios-8
		
		let oldView = self.view
		let effectView = UIVisualEffectView(effect:  UIVibrancyEffect.notificationCenterVibrancyEffect())
		
		effectView.contentView.addSubview(oldView)
		effectView.autoresizingMask = self.view.autoresizingMask
		effectView.frame = oldView.bounds
		effectView.tintColor = UIColor.clearColor()
		
		self.view = effectView
		*/
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
		// Perform any setup necessary in order to update the view.
		
		// If an error is encountered, use NCUpdateResult.Failed
		// If there's no update required, use NCUpdateResult.NoData
		// If there's an update, use NCUpdateResult.NewData
		
		completionHandler(NCUpdateResult.NewData)
	}
	
}
