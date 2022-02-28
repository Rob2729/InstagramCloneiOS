//
//  ContentView.swift
//  InstagramClone
//
//  Created by Robert on 28/02/2022.
//

import SwiftUI

let primary = Color.black


struct ContentView: View {
    var body: some View {
        ZStack {
            primary
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Header()
                ScrollView {
                  stories()
                userPosts()
                }
                bottomNav()
            }
        }
    }
}

struct Header : View {
    var body : some View {
        HStack {
            Image("InstaLogo")
                .resizable()
                .frame(width:100, height: 30)
            
            Spacer()
            HStack(alignment: .top, spacing: 20) {
                Image(systemName: "plus.square")
                
                Image(systemName: "suit.heart")
                Image(systemName: "paperplane")
            }
            .foregroundColor(.white)
            .font(.system(size: 21).bold())
        }
        .padding(.init(top: 10, leading: 15, bottom: 1, trailing: 10))
    }
}

struct myStory : View {
    let colorGradient = LinearGradient(gradient: Gradient(colors: [.purple, .red, .pink, .orange]), startPoint: .top, endPoint: .bottom)
    var body: some View {
        VStack {
            Image("profilePhoto")
                .resizable()
                .frame(width:55, height:55)
                .clipShape(Circle())
                .overlay(Circle().stroke(colorGradient, lineWidth: 2).padding(-5))
            
            Text("Your story")
                .font(.caption)
                .foregroundColor(.white)
        }
        
    }
}

struct storyCard : View {
    let profilePicture : String
    let userName : String
    
    let colorGradient = LinearGradient(gradient: Gradient(colors: [.purple, .red, .pink, .orange]), startPoint: .top, endPoint: .bottom)
    var body: some View {
        VStack {
            Image(profilePicture)
                .resizable()
                .frame(width:55, height:55)
                .clipShape(Circle())
                .overlay(Circle().stroke(colorGradient, lineWidth: 2).padding(-5))
            
            Text(userName)
                .font(.caption)
                .foregroundColor(.white)
        }
    }
}

struct post : View {
    var body : some View {
        VStack {
            HStack {
                Image("profilePhoto")
                    .resizable()
                    .frame(width:30, height: 30)
                    .clipShape(Circle())
                
                Text("developer_rob")
                    .font(.caption)
                    .bold()
                Spacer()
                
                Image(systemName: "ellipsis")
            }
            .foregroundColor(.white)
            
            HStack {
                Image("userProfileImage")
                    .resizable()
                    .frame(width:300, height: 300)
            }
            VStack (alignment: .leading) {
                HStack {
                    Image(systemName: "suit.heart")
                    Image(systemName: "bubble.right")
                    Image(systemName: "paperplane")
                    Spacer()
                    
                    Image(systemName: "bookmark")
                
                }
                .foregroundColor(.white)
                .padding(.init(top: 1, leading: 0, bottom: 0, trailing: 0))
                HStack {
                    Text("1,811 likes")
                        .font(.caption)
                        .bold()
                }
                .foregroundColor(.white)
                .padding(.init(top: 2, leading: 0, bottom: 0, trailing: 0))
                
                
                HStack (alignment: .firstTextBaseline, spacing: 3) {
                    Text("**developer_rob** Update on todays code, I am still working through some bugs and hoping to get them finsished ")
                        .font(.caption)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                }
                .foregroundColor(.white)
                .offset(y:3)
                
                VStack(alignment: .leading, spacing: 15)
                {
                    
                    
                    HStack {
                        Text("View all 12 comments")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .offset(y:5)
                    }
                    
                    HStack {
                        Text("1 day ago")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                        
                    }
                }
            }
        }
        .foregroundColor(.white)
        .padding(.init(top: 3, leading: 15, bottom: 10, trailing: 15))
        
        
    }
    
}

struct userPosts : View {
    
    var body: some View {
        ForEach(1..<5) { i in
            post()
        }
    }
}

struct stories : View {
    let images = ["Lego0", "Lego1", "Lego2", "Lego3", "Lego4", "Lego5", "Lego6", "Lego7"]
    
    let colorGradient = LinearGradient(gradient: Gradient(colors: [.purple, .red, .pink, .orange]), startPoint: .top, endPoint: .bottom)
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                myStory()
                ForEach(1..<images.count) { i in
                    storyCard(profilePicture: "Lego\(i)", userName: "LegoUser\(i)")
                }
                .padding(.init(top: 0, leading: 15, bottom: 0, trailing:0))
                
                
            }
            .padding(.init(.init(top: 6, leading: 15, bottom: 0, trailing: 0)))
        }
        
    }
}

struct bottomNav : View {
    var body : some View {
        
        HStack() {
            VStack {
                Image(systemName: "house.fill")
                Text("")
            }
            Spacer()
            VStack {
                Image(systemName: "magnifyingglass")
                Text("")
            }
            Spacer()
            VStack {
                Image(systemName: "play.rectangle")
                Text("")
            }
            Spacer()
            VStack {
                Image(systemName: "bag")
                Text("")
            }
            Spacer()
            VStack{
                Image("profilePhoto")
                    .resizable()
                    .frame(width:20, height: 20)
                    .clipShape(Circle())
                Text("")
            }
        }
        .font(.system(size: 18))
        .foregroundColor(.white)
        .padding(.init(top: 5, leading: 10, bottom: 5, trailing: 10))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
