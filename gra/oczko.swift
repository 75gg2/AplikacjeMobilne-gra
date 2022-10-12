let x = 10// Int(arc4random_uniform(10))

/**

                            Online Swift Compiler.
                Code, Compile, Run and Debug Swift script online.
Write your code in this editor and press "Run" button to execute it.

*/

//var karty: [String : Int] = ["1":1,"2":2,"3":3,"4":4,"5":5,"6":6,"7":7,"8":8,"9":9,"W":2,"D":3,"K":4,"A":11]

var karty: [String : Int] = ["1♤":1,
                             "2♤":2,
                             "3♤":3,
                             "4♤":4,
                             "5♤":5,
                             "6♤":6,
                             "7♤":7,
                             "8♤":8,
                             "9♤":9,
                             "W♤":2,
                             "D♤":3,
                             "K♤":4,
                             "A♤":11,
                             "1♡":1,
                             "2♡":2,
                             "3♡":3,
                             "4♡":4,
                             "5♡":5,
                             "6♡":6,
                             "7♡":7,
                             "8♡":8,
                             "9♡":9,
                             "W♡":2,
                             "D♡":3,
                             "K♡":4,
                             "A♡":11,
                             "1♢":1,
                             "2♢":2,
                             "3♢":3,
                             "4♢":4,
                             "5♢":5,
                             "6♢":6,
                             "7♢":7,
                             "8♢":8,
                             "9♢":9,
                             "W♢":2,
                             "D♢":3,
                             "K♢":4,
                             "A♢":11,
                             "1♧":1,
                             "2♧":2,
                             "3♧":3,
                             "4♧":4,
                             "5♧":5,
                             "6♧":6,
                             "7♧":7,
                             "8♧":8,
                             "9♧":9,
                             "W♧":2,
                             "D♧":3,
                             "K♧":4,
                             "A♧":11]
var komp: Set = Set<String>();
var gracz: Set = Set<String>();
var talia: Set = Set<String>();

for _ in 0...100{
    talia.insert(karty.randomElement()!.key)
}
print(talia);



var przeciwnik = true
func RuchPrzeciwnika()->Void{
    var res:Int = 321321;
    print("Twój ruch.");
    print("Twoje karty: " + toString(karty2:gracz));
    print("suma: " + String(suma(karty2: gracz)));
    repeat{
        if(res != 321321){
            print("Zła liczba. powtórz")
        }
        print("1 - Dobierz, 2 - Pass")
        res = Int(readLine() ?? "0") ?? 0
    }while( !(res == 1 || res == 2) )

    if(res == 2){
        print("pass")
        przeciwnik=false
    }
    if(res == 1){
        let x = talia.removeFirst();
        gracz.insert(x);
        print("dobrano "+x);
    }

    if(suma(karty2: gracz) > 22){
        przeciwnik = false;
        print("przegrałeś xd")
    }
}

func suma(karty2: Set<String>)->Int{
    var i = 0;
    for k in karty2{
        i += karty[k]!;
    }
    return i;
}

func toString( karty2: Set<String>)->String{
    var s = "";
    for k in karty2{
        s+=k;
        s+=" (" + String(karty[k]!) + ") ";
    }
    return s
}

var komputer = true
func RuchKomputera()->Void{
    if(suma(karty2: komp)<18){
        let x = talia.removeFirst();
        komp.insert(x);
        print("Niejawne: komputer dobrał " + x + " suma " + String(suma(karty2: komp)));
        print("Komputer się ruszył " + toString(karty2: komp))
    }else{
        print("Komputer spasował")
        komputer=false

    }
}

func main()->Void{
    while(komputer || przeciwnik){
        if(przeciwnik){
            RuchPrzeciwnika();
        }
        if(komputer){
            RuchKomputera();
        }
        print("")
    }

    let k = suma(karty2: komp);
    let g = suma(karty2: gracz);

    if(k == 22 && komp.count == 2){
        return print("Komputer wygrał.")
    }
    if(g == 22 && gracz.count == 2){
        return print("Gracz wygrał.")
    }
    if(k > 21 && g > 21){
        return print("Nikt nie wygrał")}
    if(k <= 21 && g > 21){
        return print("Komputer wygrał")}
    if(k > 21 && g <= 21){
        return print("Gracz wygrał")}
    if(k == g){
        return print("remis")}
    if(k < g){
        return print("Gracz wygrał")}
    if(k > g){
        return print("Komputer wygrał")}
    print("Lolxd to nie wiem")

}
main()
//
//"1♤":1,
//"2♤":2,
//"3♤":3,
//"4♤":4,
//"5♤":5,
//"6♤":6,
//"7♤":7,
//"8♤":8,
//"9♤":9,
//"W♤":2,
//"D♤":3,
//"K♤":4,
//"A♤":11,
//"1♡":1,
//"2♡":2,
//"3♡":3,
//"4♡":4,
//"5♡":5,
//"6♡":6,
//"7♡":7,
//"8♡":8,
//"9♡":9,
//"W♡":2,
//"D♡":3,
//"K♡":4,
//"A♡":11,
//"1♢":1,
//"2♢":2,
//"3♢":3,
//"4♢":4,
//"5♢":5,
//"6♢":6,
//"7♢":7,
//"8♢":8,
//"9♢":9,
//"W♢":2,
//"D♢":3,
//"K♢":4,
//"A♢":11,
//"1♧":1,
//"2♧":2,
//"3♧":3,
//"4♧":4,
//"5♧":5,
//"6♧":6,
//"7♧":7,
//"8♧":8,
//"9♧":9,
//"W♧":2,
//"D♧":3,
//"K♧":4,
//"A♧":11,