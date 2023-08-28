//
//  DownloadView.swift
//  NETFLIX
//
//  Created by MUNAVAR PM on 26/08/23.
//

import SwiftUI



struct DownloadView: View {
    
    @EnvironmentObject var viewModel: MovieViewModel
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "gearshape")
                        Text("Smart Downloads")
                            .fontWeight(.heavy)
                    }
                }
                .padding(.bottom,50)
                VStack {
                    Text("Introducing Downloads for You")
                        .fontWeight(.heavy)
                        .font(.system(size: 25))
                    Text("We'll Download a personalised selection of movies and shows for you,so there's always something to watch on your device.")
                        .padding(.horizontal,30)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                    ZStack {
                        Circle()
                            .foregroundColor(Color(.tertiaryLabel))
                            .frame(width: 250)
                        if viewModel.trending.isEmpty{
                            Color(.gray)
                            
                        } else {
                            viewModel.poster(poster_path: viewModel.trending[0].poster_path, width: 140, height: 160)
                                .rotationEffect(.degrees(-30))
                                .offset(x:-60,y: 0)
                            
                            viewModel.poster(poster_path: viewModel.trending[1].poster_path, width: 140, height: 160)
                                .rotationEffect(.degrees(30))
                                .offset(x:60,y: 0)
                            
                            viewModel.poster(poster_path: viewModel.trending[2].poster_path, width: 150, height: 200)
                        }
                    }
                    Spacer()
                    Button(action: {
                        
                    }){
                        Text("Set Up")
                            .font(.headline)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding()
                            .background( RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.indigo)
                                .frame(width: 350)
                            )
                    }
                    .padding(.bottom,30)
                    Button(action: {
                        
                    }){
                        Text("See What You Can Download")
                            .font(.headline)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .padding()
                            .background( RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                                .frame(width: 250)
                            )
                    }
                    Spacer()
                }
            }
            .onAppear(){
                viewModel.fetchTrending()
            }
            .navigationTitle("Downloads")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "cloud.moon")
                    }
                    .foregroundColor(.secondary)
                    
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "rectangle.badge.person.crop")
                    
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Rectangle()
                        .frame(width: 20,height: 20)
                        .padding(.horizontal)
                }
            }
        }
        
    }
}

struct DownloadView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadView()
            .environmentObject(MovieViewModel())
            .preferredColorScheme(.dark)
    }
}
