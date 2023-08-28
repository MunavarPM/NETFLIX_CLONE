


import SwiftUI

struct ComingSoon: View {
    
    @EnvironmentObject var viewModel: MovieViewModel
    @State var movie : Movie
    
    var body: some View {
        HStack(alignment: .top) {
            VStack {
                let(month,day) = viewModel.getDateMonth(dateString: movie.release_date)
                Text("""
                            \(month.prefix(3).uppercased())
                            \(day)
                            """)
                .bold()
            }
            
            VStack(alignment: .leading) {
                viewModel.poster(poster_path: movie.poster_path, width: 350, height: 200)
                HStack{
                    Text("\(movie.title)")
                    Spacer()
                    VStack {
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "bell")
                            Text("Remind Me")
                        })
                        .foregroundColor(.secondary)
                        .buttonStyle(.bordered)
                    }
                    VStack {
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "info.circle")
                            Text("Info")
                        })
                        .foregroundColor(.secondary)
                        .buttonStyle(.bordered)
                    }
                }
                .padding(.top)
                Text("\(movie.overview)")
                    .foregroundColor(.secondary)
            }
        }
        .padding(.horizontal)
        .frame(width:400, height: 400)
    }
}

struct ComingSoon_Previews: PreviewProvider {
    static var previews: some View {
        ComingSoon(movie: Movie(id: 0, overview: "", poster_path: "", release_date: "", title: ""))
            .environmentObject(MovieViewModel())
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
