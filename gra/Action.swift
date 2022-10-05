//
//  Action.swift
//  swift
//
//  Created by Kamil Gargula on 14/09/2022.
//

import Foundation


class Action{
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
