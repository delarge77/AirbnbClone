//
//  DestinationSearchView.swift
//  AirbnbClone
//
//  Created by Alessandro dos Santos Pinto on 2024-05-27.
//

import SwiftUI

enum DestinationSearchOptions {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @Binding var show: Bool
    @ObservedObject var viewModel: ExploreViewModel
    @State private var selectionOption: DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuests = 0
    
    var body: some View {
        HStack() {
            Button(action: {
                withAnimation(.snappy) {
                    viewModel.updateListingsForLocation()
                    show.toggle()
                }
            }, label: {
                Image(systemName: "xmark.circle")
                    .imageScale(.large)
                    .foregroundColor(.black)
            })
            
            Spacer()
            
            if !viewModel.searchLocation.isEmpty {
                Button("clear") {
                    viewModel.searchLocation = ""
                    viewModel.updateListingsForLocation()
                }
                .foregroundStyle(.black)
                .font(.subheadline)
                .fontWeight(.semibold)
            }
        }
        .padding()
        
        VStack(alignment: .leading){
            
            if selectionOption == .location {
                Text("Where to")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                HStack{
                    Image(systemName: "magnifyingglass")
                        .imageScale(.small)
                    
                    TextField("Search destinations", text: $viewModel.searchLocation)
                        .font(.subheadline)
                        .onSubmit {
                            viewModel.updateListingsForLocation()
                            show.toggle()
                        }
                }
                .frame(height: 44)
                .padding(.horizontal)
                .overlay{
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 1.0)
                        .foregroundStyle(Color(.systemGray4))
                }
            } else {
                CollapsedPickerView(title: "Where", description: "Add destination")
            }
            
            
        }
        .frame(height: selectionOption == .location ? 120 : 64)
        .modifier(CollapsibleDestinationViewModifier())
        .onTapGesture {
            withAnimation(.snappy) { selectionOption = .location }
        }
        
        // date selection view
        VStack(alignment: .leading) {
            if selectionOption == .dates {
                Text("When's your trip?")
                    .font(.title2)
                    .fontWeight(.semibold)
                VStack {
                    DatePicker("From", selection: $startDate, displayedComponents: .date)
                    
                    Divider()
                    
                    DatePicker("to", selection: $endDate, displayedComponents: .date)
                }
                .foregroundColor(.gray)
                .font(.subheadline)
                .fontWeight(.semibold)
                
            } else {
                CollapsedPickerView(title: "When", description: "Add dates")
            }
        }
        .frame(height: selectionOption == .dates ? 180 : 64)
        .modifier(CollapsibleDestinationViewModifier())
        .onTapGesture {
            withAnimation(.snappy) { selectionOption = .dates }
        }
        
        // num guests view
        VStack(alignment: .leading) {
            if selectionOption == .guests {
                Text("Who's coming?")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Stepper {
                    Text("\(numGuests) Adults")
                } onIncrement: {
                    numGuests += 1
                } onDecrement: {
                    guard numGuests > 0 else { return }
                    numGuests -= 1
                }
            } else {
                CollapsedPickerView(title: "Who", description: "Add Guests")
            }
                
        }
        .frame(height: selectionOption == .guests ? 120 : 64)
        .modifier(CollapsibleDestinationViewModifier())
        .onTapGesture {
            withAnimation(.snappy) { selectionOption = .guests }
        }
        Spacer()
    }
}

struct CollapsibleDestinationViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
}

#Preview {
    DestinationSearchView(show: .constant(false), viewModel: ExploreViewModel(service: ExploreService()))
}

struct CollapsedPickerView: View {
    
    let title: String
    let description: String
    
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text( description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
            .padding()
        }
    }
}
