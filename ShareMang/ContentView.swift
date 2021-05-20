//
//  ContentView.swift
//  ShareMang
//
//  Created by Thaksina on 18/5/2564 BE.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @State var email = ""
    @State var pass = ""
    var body: some View {
       Home()

    }

    

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct Home: View {
    var body: some View {
        NavigationView{
        ZStack{
            Color(#colorLiteral(red: 0.9690919518, green: 0.7980648875, blue: 0.8212717175, alpha: 1)).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack{
                
            Image("name")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding([.leading, .trailing], 60)
            NavigationLink(
                destination: Login(),
                label: {
                    Text("Enter")
                })    .font(Font.body.bold())
                .foregroundColor(.pink)
                .frame(width: 150, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                .padding()
                
//            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
//                    Text("Enter")
//                })
//                .font(Font.body.bold())
//                .foregroundColor(.pink)
//                .frame(width: 150, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
//                .padding()
                

                }
        }
    }
    }
}

struct Login: View {
    @State var email = ""
    @State var pass = ""
    
    @State var selection: Int? = nil
    
    var body: some View {

                    ZStack{
                        
                        Color(#colorLiteral(red: 0.9803224206, green: 0.7262012362, blue: 0.7711936831, alpha: 1)).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        VStack{
                            Text("Login").foregroundColor(.black)
                                .font(Font.body.bold())
                                .padding()
                            
                            TextField("Email", text:$email)
                                .padding()
                                .background(Color(#colorLiteral(red: 0.6519014239, green: 0.8831939101, blue: 0.9718664289, alpha: 1)))
                                .padding([.leading, .trailing], 20)
                                .background(Circle().frame(width: 650, height: 500, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/))
                            SecureField("Password", text:$pass)
                                .padding()
                                .background(Color(#colorLiteral(red: 0.6519014239, green: 0.8831939101, blue: 0.9718664289, alpha: 1)))
                                .padding([.leading, .trailing], 20)
                            
                            HStack{
                                
                                NavigationLink(destination: RookListView(), tag: 1, selection: $selection) {
                                    Button(
                                        
                                        action: {
                                            
//                                            print(self.selection)
                                            login()
                                            
                                            
                                            
                                        }, label: { Text("Sign In")})
                    
                                }
                                .font(Font.body.bold())
                                .foregroundColor(.white)
                                .frame(width: 120, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .background(Color(#colorLiteral(red: 0.6519014239, green: 0.8831939101, blue: 0.9718664289, alpha: 1)))
                                .padding()
                                .foregroundColor(.black)
                                
                                
                                NavigationLink(
                                    destination: Register(),
                                    label: {
                                        Text("Register")
                                    })
                                    .font(Font.body.bold())
                                    .foregroundColor(.white)
                                    .frame(width: 120, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .background(Color(#colorLiteral(red: 0.6519014239, green: 0.8831939101, blue: 0.9718664289, alpha: 1)))
                                    .padding()
                                    .foregroundColor(.black)
                            }
                            .padding(.top, 30)
                        }
                    .navigationTitle("Login").foregroundColor(.white)
                    
                                
                }
                
                
            }
            func login(){
                print("Email=",email," Password=",pass)
                if(email != "" && pass != ""){
                    Auth.auth().signIn(withEmail: email, password: pass){
                            (Result,error) in
                               if error != nil{
                                self.selection = nil
                                   print(error?.localizedDescription ?? "")
                               }
                               else{
                                       self.selection = 1
                               }
                           }
                }
                
               
                
                
            }
                        
        }




struct Register: View {
    @State var reemail = ""
    @State var repass = ""
    @State var reuser = ""
    var body: some View {
        ZStack{
            Color(#colorLiteral(red: 0.9803224206, green: 0.7262012362, blue: 0.7711936831, alpha: 1)).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                
                Image("re")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                TextField("Email", text:$reemail)
                    .padding()
                    .background(Color(#colorLiteral(red: 0.6519014239, green: 0.8831939101, blue: 0.9718664289, alpha: 1)))
                    .padding([.leading, .trailing], 20)
                TextField("Password", text:$repass)
                    .padding()
                    .background(Color(#colorLiteral(red: 0.6519014239, green: 0.8831939101, blue: 0.9718664289, alpha: 1)))
                    .padding([.leading, .trailing], 20)

                
                Button(action: {register()}, label: {
                    Text("Submit")
                        .font(Font.body.bold())
                        .foregroundColor(.white)
                        .frame(width: 120, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color(#colorLiteral(red: 0.6519014239, green: 0.8831939101, blue: 0.9718664289, alpha: 1)))
                        .padding()
                        .foregroundColor(.black)
                        

                })
            }

        }
    }
    func register(){
        
    }

}


struct Listname: View {
    var body : some View{
        ZStack{
            Color(#colorLiteral(red: 0.9803224206, green: 0.7262012362, blue: 0.7711936831, alpha: 1)).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                
            }

        }
    }
}

struct RookListView : View {
    @ObservedObject private var viewModel = BooksViewModel()
    @State private var presentAddNewBookScreen = false
    
    var body: some View{
        ZStack{
            Color(#colorLiteral(red: 0.9803224206, green: 0.7262012362, blue: 0.7711936831, alpha: 1)).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)

        VStack{
            Image("rec")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            NavigationLink(
                destination: RookEditView(),
                label: {
                    Text("Add more")
                })
                .font(Font.body.bold())
                .foregroundColor(.white)
                .frame(width: 120, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color(#colorLiteral(red: 0.6519014239, green: 0.8831939101, blue: 0.9718664289, alpha: 1)))
                .padding()
                .foregroundColor(.black)
            
            List(viewModel.books){
                book in VStack(alignment: .leading){
                    Text(book.book)
                        .foregroundColor(.pink)
                        .font(.custom("Sail", size: 25))
//                        .font(.system(size: 25, weight: .light, design: .default))
                        .frame(maxWidth: .infinity)
                        .background(Color(#colorLiteral(red: 0.6519014239, green: 0.8831939101, blue: 0.9718664289, alpha: 1)))
                    Text(book.comment)
                        .font(.headline)
                }
            }
            .onAppear(){
                self.viewModel.fetchData()
            }
        }
    }
    }
}


struct RookEditView: View{
    @StateObject var viewModel = BookAddViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body : some View{
        ZStack{
            Color(#colorLiteral(red: 0.9803224206, green: 0.7262012362, blue: 0.7711936831, alpha: 1)).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)

        VStack{
            Image("addend")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Section(header: Text("")){
                TextField("Books", text:$viewModel.book.book)
                    .padding()
                    .background(Color(#colorLiteral(red: 0.6519014239, green: 0.8831939101, blue: 0.9718664289, alpha: 1)))
                    .padding([.leading, .trailing], 20)
                    .foregroundColor(.white)
                 
                TextField("Information", text:$viewModel.book.comment)
                    .padding()
                    .background(Color(#colorLiteral(red: 0.6519014239, green: 0.8831939101, blue: 0.9718664289, alpha: 1)))
                    .padding([.leading, .trailing], 20)
                    .foregroundColor(.white)
               
                
            Button(action: {submit()}, label: {
                    Text("Submit")
                })
                .font(Font.body.bold())
                .foregroundColor(.white)
                .frame(width: 120, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color(#colorLiteral(red: 0.6519014239, green: 0.8831939101, blue: 0.9718664289, alpha: 1)))
                .padding()
                .foregroundColor(.black)
            }
        }
    }
    }
    func submit(){
        viewModel.save()
        dismiss()
    }
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

