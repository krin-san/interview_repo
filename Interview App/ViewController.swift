//
//  ViewController.swift
//  Interview App
//
//  Created by Aliaksandr Chapliuk on 9/26/17.
//  Copyright © 2017 Inteview Sinergy. All rights reserved.
//

import UIKit


struct Asset {

    let image: UIImage
    let title: String
    let description: String

}

class ViewController: UIViewController {

    private var data: [Asset] = []

    override func viewDidLoad() {
        super.viewDidLoad()
//        prepareData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func prepareData() {
        data = [
            Asset(image: UIImage(named: "american_beauty")!, title: "American Beauty", description: "Lester Burnham brennt eine Sicherung durch, als er die lolitahafte Freundin seiner mißmutigen Tochter Jane kennenlernt. Sexuell frustriert setzt er sich eine Affäre mit dem Teentraum in den Kopf. Er kündigt seinen Routinejob und beginnt sich wieder rebellisch wie ein Jugendlicher zu benehmen."),
            Asset(image: UIImage(named: "babylon")!, title: "Babylon A.D.", description: "Der mit allen Wassern gewaschene Söldner Toorop lebt in einer von Kriegen und Viren zerrütteten Welt einer nahen Zukunft. Von dem undurchsichtigen Gangster Gorsky nimmt er den Auftrag an, ein junges Mädchen über die gemeingefährliche Grenze nach New York zu bringen. Tooroop holt sie und ihre Beschützerin von einem Kloster ab, um sich danach auf einen regelrechten Spießrutenlauf einzulassen. Via Auto, Zug, U-Boot und Schneemobil - immer verfolgt von feindlichen Kämpfern - geht es über die Beringstraße nach Amerika."),
            Asset(image: UIImage(named: "braveheart")!, title: "Braveheart", description: "Schottland zum Ende des 13. Jahrhunderts. Da der König keinen Thronfolger hinterlassen hat, ist es dem Engländer Edward I. gelungen, die Macht an sich zu reißen. Als die englischen Besatzer die Frau des Schotten William Wallace töten, schwört dieser blutige Rache. Er sagt der britischen Krone den Kampf an und führt eine bunt zusammengewürfelte Armee in eine schier aussichtslos Schlacht. Nach dem überraschenden Sieg will Wallace die Engländer endgültig aus seinem Land vertreiben. Doch schließlich fällt er einer Intrige zum Opfer."),
            Asset(image: UIImage(named: "lost")!, title: "LOST", description: "48 Überlebende finden sich nach dem Absturz von Flug 815 auf einer einsamen Insel wieder. Der Pilot ist tot und Rettung kommt nicht. Gemeinsam kämpfen sie ums Überleben. Es gibt Anfeindungen, Eifersüchteleien, Neid, Intrigen."),
            Asset(image: UIImage(named: "naked_gun_")!, title: "The Naked Gun", description: "Polizeileutnant Frank Drebin ist bei seinem neuen Fall besonders engagiert, denn ein Kollege wurde bei einem Einsatz lebensgefährlich verletzt. Die Spur führt zum Geschäftsmann Vincent Ludwig. Außer der hübschen Sekretärin Jane, die sich heftigst in ihn verliebt, kann Drebin bei Ludwig nichts Verdächtiges entdecken. Was Drebin nicht weiß: Ludwig plant, die englische Königin, die Los Angeles besuchen wird, zu ermorden - und Drebin gehört zum königlichen Polizeischutz."),
            Asset(image: UIImage(named: "saw")!, title: "Saw", description: "Der Arzt Lawrence und Fotograf Adam erwachen in einem heruntergekommenen Waschraum. Eine massive Stahlkette fesselt sie an Rohre, in der Mitte des Raumes liegt eine Leiche. Keiner der beiden kann sich daran erinnern, wie er hier gelandet ist. Die Gefangenen stoßen auf Hinweise, die nur einen Schluss zulassen: Sie sind in die Falle des \"Jigsaw-Mörders\" geraten. Der bringt seine Opfer in aussichtslose Situationen, die sie meistern müssen, um ihr Leben zu retten."),
        ]
    }

}
