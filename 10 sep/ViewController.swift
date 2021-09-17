//
//  ViewController.swift
//  10 sep
//
//  Created by Сергей Абросов on 17.09.2021.
//

import UIKit

class ViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet var views: [UIView]!

    @IBAction func nextGeneration(_ sender: Any)
    {
        let button = sender as? UIButton
        button?.isEnabled = false
        
        var set = Set<UIColor>()
        while set.count < views.count
        {
            set.insert(
                UIColor(
                    red: .random(in: 0...1),
                    green: .random(in: 0...1),
                    blue: .random(in: 0...1),
                    alpha: 1
                )
            )
        }
        
        UIView.animate(withDuration: 2, animations:
        {
            for view in self.views
            {
                view.layer.cornerRadius = .random(in: 0...60)
                view.backgroundColor = set.popFirst()
            }
        }) {
            completion in button?.isEnabled = true
        }
    }
}

