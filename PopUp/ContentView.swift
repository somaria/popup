import SwiftUI

struct ContentView: View {
    @State private var isShowingPopup = false
    
    var body: some View {
        ZStack {
            if isShowingPopup {
                Color.black.opacity(0.1)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        isShowingPopup = false
                    }
                
                PopupOverlayView(isShowingPopup: $isShowingPopup)
                    .frame(width: 200, height: 150)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding()
                    .offset(y: -100)
            }
            
            VStack {
                Button(action: {
                   isShowingPopup.toggle()
                }) {
                    Text("Click here to reveal more text")
                }
            }
            .zIndex(1) // Ensure the main content is behind the popup
        }
        .statusBar(hidden: isShowingPopup) // Hide status bar when the popup is showing
    }
}

struct PopupOverlayView: View {
    @Binding var isShowingPopup: Bool
    
    var body: some View {
        VStack {
            Text("This is the additional text")
                .font(.title)
                .foregroundColor(.white)
                .padding()
            
            Spacer()
        }
        .onTapGesture {
            isShowingPopup = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
