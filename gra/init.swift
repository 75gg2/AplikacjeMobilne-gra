//
//  init.swift
//  gra
//
//  Created by Kamil Gargula on 14/09/2022.
//

import Foundation

func loadActions()->Void{
    Action(
        key:"Dom",
        endpoints: ["Ponowna drzemka": "Olej to, i tak nie sprawdzi.",
                    "Zadanie": "Zrób zadanie"],
        onLoad:{
            print("Ranek. Słyszysz budzik, lecz jesteś niewyspany.")
            print("O holibka! Wieczorem olałeś zadanie z matematyki. Masz jeszcze chwilę, zdążysz zrobić 'po łebkach'.")
        }
    );
    Action(
        key:"Zadanie",
        endpoints: ["Autobus": "Idź na autobus",
                    "Bieg na autobus": "Biegnij na autobus"],
        onLoad:{
            let x = Int(arc4random_uniform(10))
            var y = 0
            print("Teraz trzeba rozwiązć równanie:\(x)")
            repeat{
                print("3x=\(3*x)+3")
                y = Int(readLine() ?? "0") ?? 0
            }while(y != (3*x+3)/3)
            print("Dobra, gotowe! Już późno trzeba się pospieszyć na autobus!")
        }
    )
    Action(
        key:"Ponowna drzemka",
        endpoints: ["Autobus": "Idź na autobus",
                    "Bieg na autobus": "Pobiegnij na autobus"],
        onLoad:{
            print("No i zaspałeś. Musisz złapać autobus.")
        }
    );
    Action(
        key:"Autobus",
        endpoints: ["Powrot do domu": "Wróć do domu",
                    "Bieg na autobus": "Ścigaj się z autobusem!"],
        onLoad:{
            print("Autobus nadjeżdża!")
        }
    );
    Action(
        key:"Bieg na autobus",
        endpoints: ["Zaryzykuj": "Brzebiegnij przed samochodem",
                    "Powrot do domu": "Wróć do domu"],
        onLoad:{
            print("Jedzie samochód, ale musisz mu przeciąć drogę. Czy matematyka jest tego naprawdę warta?")
        }
    );
    //TODO - powrot do domu
}
