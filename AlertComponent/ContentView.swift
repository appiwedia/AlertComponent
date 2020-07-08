//
//  ContentView.swift
//  AlertComponent
//
//  Created by Mickael Mas on 15/06/2020.
//  Copyright © 2020 APPIWEDIA. All rights reserved.
//

import SwiftUI

struct Cart: Identifiable {
    var id = UUID()
    var nbProduct = 0
}

struct ContentView: View {
    
    @State var validateAlertIsPresented = false
    @State var destructiveAlertIsPresented = false
    @State var twoButtonsAlertIsPresented = false
    
    @State var cart: Cart?
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                // Alerte simple avec titre
                Button(action: {
                    print("Good")
                    self.validateAlertIsPresented = true
                }) {
                    Text("Alerte simple avec titre").frame(width: 250, height: 50)
                        .foregroundColor(Color.white)
                        .background(
                            RoundedRectangle(cornerRadius: 20, style: .circular).foregroundColor(Color.green)
                    )
                }.alert(isPresented: $validateAlertIsPresented) {
                    Alert(title: Text("Validé"), message: Text("Voici ma popup"))
                }
                
                
                
                
                
                
                
                
                
                
                // Alerte avec bouton de destruction
                Button(action: {
                    self.destructiveAlertIsPresented = true
                }) {
                    Text("Alerte de suppression").frame(width: 250, height: 50)
                        .foregroundColor(Color.white)
                        .background(
                            RoundedRectangle(cornerRadius: 20, style: .circular).foregroundColor(Color.red)
                    )
                }.alert(isPresented: $destructiveAlertIsPresented) {
                    Alert(title: Text("Alert App"), message: Text("Ce message sera supprimé..."), dismissButton: Alert.Button.destructive(Text("Êtes-vous sûr ?")))
                }
                
                
                
                
                
                
                
                
                
                
                // Alerte avec 2 boutons + Callbacks
                Button(action: {
                    self.twoButtonsAlertIsPresented = true
                }) {
                    Text("Alerte à 2 boutons + Callback")
                        .frame(width: 250, height: 50)
                        .foregroundColor(Color.white)
                        .background(
                            RoundedRectangle(cornerRadius: 20, style: .circular).foregroundColor(Color.orange)
                    )
                }.alert(isPresented: $twoButtonsAlertIsPresented) {
                    Alert(title: Text("Alert App"), message: Text("Souhaitez-vous poursuivre l'opération ?"), primaryButton: Alert.Button.default(Text("OK"), action: {
                        print("Super c'est validé !")
                    }), secondaryButton: Alert.Button.cancel(Text("Annuler"), action: {
                        print("Non, merci !")
                    }))
                }
                
                
                
                
                
                
                
                // Alerte avec un model
                Button(action: {
                    self.cart = Cart(nbProduct: 10)
                }) {
                    Text("Alerte avec model")
                        .frame(width: 250, height: 50)
                        .foregroundColor(Color.white)
                        .background(
                            RoundedRectangle(cornerRadius: 20, style: .circular).foregroundColor(Color.blue)
                    )
                    }.alert(item: $cart) { (cart) in
                        Alert(title: Text("Panier"), message: Text("Vous avez \(cart.nbProduct) articles dans votre panier"))
                }
            }
            .navigationBarTitle("Alert App")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
