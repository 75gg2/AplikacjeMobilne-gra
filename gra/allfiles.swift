/**

                            Online Swift Compiler.
                Code, Compile, Run and Debug Swift script online.
Write your code in this editor and press "Run" button to execute it.

*/class Action{
    var onLoad:()->();
    var key: String;
    var endpoints: [String:String];

    init(key:String, endpoints: [String:String], onLoad:@escaping ()->Void){
        self.key = key;
        self.endpoints = endpoints;
        self.onLoad = onLoad;
        AddThisPageOnInit(key:key)
    }
    func load(){

        onLoad();
        let n:String = printAndReadActions();
        print(n)
        setEndpoint(endpoint: n)
    }
    func printAndReadActions()->String{
        var n:Int = 0;
        repeat{
            print()
            print("Wykonaj ruch wpisując liczbę:");
            for (i,e) in endpoints.enumerated(){
                print("\(i+1) -> \(e.key)")
            }
            n = Int(readLine() ?? "0") ?? 0
        }while(n <= 0 || n > endpoints.count)
        return Array(endpoints.keys)[n-1];
    }
    func setEndpoint(endpoint:String) -> Void{
//        setPage(actionName: self.endpoints[endpoint]!);
        setPage(actionName: endpoint)
    }
    func setPage(actionName:String) -> Void{
        if(actions[actionName] == nil){
            return print("ERROR!!! Nie ma screenu: '\(actionName)'");
        }

        actions[actionName]!.load();
    }
    func AddThisPageOnInit(key:String) -> Void{
        actions[key] = self
    }
}

func loadActions()->Void{
    Action(
            key:"Dom",
            endpoints: ["Ponowna drzemka": "Olej to, i tak nie sprawdzi.",
                        "Zadanie": "ZrÃ³b zadanie"],
            onLoad:{
                print("Ranek. SÅyszysz budzik, lecz jesteÅ niewyspany.")
                print("O holibka! Wieczorem olaÅeÅ zadanie z matematyki. Masz jeszcze chwil, zdÄÅ¼ysz zrobiÄ 'po Åebkach'.")
            }
    );
    Action(
            key:"Zadanie",
            endpoints: ["Autobus": "IdÅº na autobus",
                        "Bieg na autobus": "Biegnij na autobus"],
            onLoad:{
                let x = 10// Int(arc4random_uniform(10))
                var y = 0
                print("Teraz trzeba rozwiÄzÄ rÃ³wnanie:\(x)")
                repeat{
                    print("3x=\(3*x)+3")
                    y = Int(readLine() ?? "0") ?? 0
                }while(y != (3*x+3)/3)
                print("Dobra, gotowe! JuÅ¼ pÃ³Åºno trzeba siÄ pospieszyÄ na autobus!")
            }
    )
    Action(
            key:"Ponowna drzemka",
            endpoints: ["Autobus": "IdÅº na autobus",
                        "Bieg na autobus": "Pobiegnij na autobus"],
            onLoad:{
                print("No i zaspaÅeÅ. Musisz zÅapaÄ autobus.")
            }
    );
    Action(
            key:"Autobus",
            endpoints: ["Powrot do domu": "WrÃ³Ä do domu",
                        "Bieg na autobus": "Åcigaj siÄz autobusem!"],
            onLoad:{
                print("Autobus nadjeÅ¼dÅ¼a!")
            }
    );
    Action(
            key:"Powrot do domu",
            endpoints: ["Dom":"Ok"],
            onLoad:{
                print("""
                      Wracasz do domu. NIc nie tracisz bo jutro teÅ¼ szkoa!
                      Mija dzieÅ..
                      """)
            }
    );
    Action(
            key:"Bieg na autobus",
            endpoints: ["Zaryzykuj": "Brzebiegnij przed samochodem",
                        "Wymuszenie": "Biegnij, ale ostroÅ¼nie",
                        "Powrot do domu": "WrÃ³Ä do domu"],
            onLoad:{
                print("\n\n    Home Network\n      HTTP, HTML & Text\n      CSS3\n      Image\n      Social\n      Finance\n      Hacker\n      Handy\n      Contact New Page \n\nHacker Tools\n\n    ASCII banners\n    Ascii Art converter\n    ANSI Art converter\n    Steganography\n    Image to Byte array\n\n    I\n    Hacker\n    Ascii Art converter\n\nConvert Images to Ascii Art\n\nUse ASCII art on Facebook & Twitter! \n(or anywhere else)\n\nASCII art generator for geeks!\n\n                                                                                \n                                                                                \n                                                                                \n                                                                                \n                                                                                \n                                     .****(#######(/**/**.                      \n                               (**%//////////////////////////##**,              \n                         ,@/*&&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&.,.,,**,       \n                    *#(///#,,///////////////////***********,**********///*..    \n       /(((((((((///((((,//(((((/((((((((((((((((((((((((((((((/**,*/(((((*//   \n     .....##(/(@&%%%#@///##################################(*/@%%%%#@%//(((#/   \n   #########(&##*%%**##&(/################################//&%#*%%**##&%((#((   \n    %&@&%%%%@##(&.., /%%@###(((((((((((((((((((#(((((((((#(@##(%.., *#%@#%#.    \n             ##&/%%,#%#&                                    %#%/%%,###%         \n               &%###%%                                        &%###%#           \n                                                                                ")
                print("Jedzie samochÃ³d, ale musisz mu przeci drogÄ. Czy matematyka jest tego naprawdÄ warta?")
            }
    );
    Action(
            key:"Zaryzykuj",
            endpoints: ["Ucieczka": "Ucieknij ze szpitala",
                        "Policja": "Poczekaj na policjÄ, b wyjaÅniaÄ wypadek"],
            onLoad:{
                print("PotrÄci ciÄsamochÃ³d.     Budzisz siÄ w szpitalu.\n    JesteÅ poobijany, ale nic ci nie jest. ")
            }
    );
    Action(
            key:"Ucieczka",
            endpoints: ["Skok": "Pierwsze piÄtro, moÅ¼esz uciekaÄ oknem.",
                        "Korytarz": "Uciekaj schodami"],
            onLoad:{
                print("Uciekasz. Potrzebujesz wyjść z pokoju")
            }
    );
    Action(
            key:"Skok",
            endpoints: ["Policja":"Dalej"],
            onLoad:{
                print("Skaczesz przez okno, niestety ktoś zostawił tam samochód.")
                print("Włącza się alarm, ochrona podjeżdża, i już wiesz że nie uciekniesz")
            }
    );
    Action(
            key:"Korytarz",
            endpoints: ["Schody":"Biegnij schodami, będzie szubcjiej",
                        "Winda":"Wskocz do windy, odjedziessz zamin cię złapie"
            ],
            onLoad:{
                print("Wychodzisz na korytarz, jednak lekarz cię rozpoznaje. Uciekaj!")
            }
    );
    Action(
            key:"Winda",
            endpoints: ["Policja":"Dalej"],
            onLoad:{
                print("Drzwi się zamknęły. Jedziesz.")
                print("Parter. Otwierzją się drzwi, i  widzisz ochronę. No to szykuje się miłe popołudnie.")
            }
    );
    Action(
            key:"Ulica",
            endpoints: ["Policja":"Dalej"],
            onLoad:{
                print("Biegniesz ulicą, jednak radiowóz zawraca. Będziesz miał się z czego tłumaczyć.")
            }
    );
    Action(
            key:"Piwo",
            endpoints: ["Policja":"Dalej"],
            onLoad:{
                print("Tego jeszcze brakowało, policjant cię zauważył z piwem")
                print("Ani chybi dostaniesz mandat za picie i zostaniesz zdemaskowany")
            }
    );
    Action(
            key:"Schody",
            endpoints: ["Policja":"Uciekaj boczną ulicą",
                        "Sklep":"Chowaj się w sklepie i udawaj że wszystko ok."],
            onLoad:{
                print("Zbiegasz ze schodów, wybiegasz z budynku. Widzisz już jadący radiowóz.")
            }
    );
    Action(
            key:"Sklep",
            endpoints: ["Piwo":"Kup piwo",
                        "Loteria":"Kup los do loterii"],
            onLoad:{
                print("Wchodzisz do sklepu. Udawaj, że nic się nie dzieje, najlepiej coś kup")
            }
    );
    Action(
            key:"Loteria",
            endpoints: ["wygrana":"odczytaj wynik"],
            onLoad:{
                print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,...................(@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@@@@@@.............................@@@@@@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@@@......... &@@@@@@@@@@@@@#..........@@@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@....... @@@@@@@@.      @@@@@@@@........@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@.......@@@@@@@@@@@...... @@@@@@@@@@%.......@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@......@@@@@@@@.................@@@@@@@,......@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@......@@@@@@@........ (&# .......@@@@@@@@......@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@ .....@@@@@@@@........@@@@@@@@@@@@@@@@@@@@&...../@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@......@@@@@@@@/............... @@@@@@@@@@@@......@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@.....,@@@@@@@@@@%.. ............. @@@@@@@@@......@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@......@@@@@@@@@@@@@@@@@@,..........@@@@@@@@......@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@ .....@@@@@@@@.......@@@@@@(.......@@@@@@@%.....#@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@......@@@@@@@/...................@@@@@@@@..... @@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@......(@@@@@@@@..............#@@@@@@@@ ......@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@.......%@@@@@@@@@@...... @@@@@@@@@@*......*@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@........@@@@@@@@@@@@@@@@@@@@@@&....... @@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@@@..........*@@@@@@@@@@@@@..........*@@@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@@@@@@............................/@@@@@@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@% ................. @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
                )
                print("Kupujesz los. Sprawdź wyjnik jakby nigdy nic.")
            }
    );
    Action(
            key:"wyjnik",
            endpoints: [:],
            onLoad:{
                print("Policja pojechała. Sprawdzasz wynik i wygrałeś 100k")
            }
    );
    Action(
            key: "Policja",
            endpoints: [:],
            onLoad: {
                print("Dowieźli cię na posterunek.")
                print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,,.,,*&@@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@/,,*,,,.@@@@@@@#*@%&/(@%@@@@*,*.......,..@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@*,,,,,,,,,,,,..,.,,..,#@@%/%,*#%/@..*...... ..,.......  .(@@@@@@@@@@\n@@@@@@@@,,,,,,..,,,,,.,..*,...,,,,.,@@@@@@@@@@,,......,...,., ........%.. @@@@@@\n@@@@@@......*.@@@@%  ..,,....,,..,,..@@@@@@@@.,.,.,..,......@@@@@@@@@@@..*,. @@@\n@@@@..... @@@@@@@@@@@@. ..,....,......,@@@@@,,,, ,.,....,.@@@@@@@@@@@@@@@/....@@\n@@@.,..,,@@@@@@@@@@@@@@@@  .,...,,.,.*%@@@@@.....,,,.....@@@@@@@@@@@@@@@@@( ..@@\n@@@.... @@@@@@@@@@@@@@@@@@   .,.,,..,@@@@@@@@@,.... ....@@@@@@@@@@@@@@@@@@@ ../@\n@@@...  @@@@@@@@@@@@@@@@@@@   ...,*@@@@@@@@@@@@@.......@@@@@@@@@@@@@@@@@@@, ..@@\n@@@ ..  @@@@@@@@@@@@@@@@@@   ,@@@@@@@@@@@@@@@@@@@,,...,@@@@@@@@@@@@@@@@@&,,&(.@@\n@@@@ .  . @@@@@@@@@@@@@@@    @@@@@@@@@@@@@@@@@@@@@,.,,,,.@@@@@@@@@@@@@@,,....,@@\n@@@@@,   * .@@@@@@@@@@@,    @@@@@@@@@@@@@@@@@@@@@@@@.....,.&@@@@@@@@,,...,,,@@@@\n@@@@@@@ .#.     .*.      .@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.,...,,.,,.,.,..,*@@@@@@@\n@@@@@@@@@@@@@#        .@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@..,,,,,,@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
                print("Teraz zapłacisz za swoje przewinienia grzywnę 20k")
            }
    );


}
var actions: [String:Action] = [:];
loadActions()
actions["Dom"]!.load()
