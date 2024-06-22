//
//  BubbleSortView.swift
//  AlgoVisualization
//
//  Created by Abdullah All Abir on 21/6/24.
//

import SwiftUI

struct BubbleSortView: View {
    
    @State var arr: [Int] = [21, 23, 13, 99, 52, 6]
    @State var didSwap = false
    @State var currentIndex = 0
    @State var timer: Timer?
    @State var isSorted = false
    @State var sortedIndex = 1
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                ForEach(arr.indices, id: \.self) { index in
                    ArrayElement(text: "\(arr[index])", isCurrentIndex: index == currentIndex )
                }
            }
            .animation(.spring, value: arr)
            
            if isSorted{
                Text("Array Sorted")
                    .font(.headline)
                    .padding()
            }
            
            Spacer()
            
            Button(action: {
                timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
                    bubbleSort()
                })
            }, label: {
                Text("Bubble Sort")
                    .font(.title)
            })
            
        }
    }
    
    func bubbleSort(){
        
        if !isSorted{
            if currentIndex == arr.count - sortedIndex{
                print(arr.count - sortedIndex)
                if !didSwap{
                    isSorted = true
                    return
                }else{
                    currentIndex = 0
                    didSwap = false
                    sortedIndex += 1
                    return
                }
            }
            
            if !arr.indices.contains(currentIndex + 1){
                timer?.invalidate()
                return
            }
            
            
            if arr[currentIndex] > arr[currentIndex + 1]{
                arr.swapAt(currentIndex, currentIndex+1)
                didSwap = true
            }
            currentIndex += 1
        }
        else{
            timer?.invalidate()
        }
        
    }
    
}

#Preview {
    BubbleSortView()
}


struct ArrayElement: View {
    var text: String
    var isCurrentIndex: Bool
    var body: some View {
        ZStack{
            Color.purple.opacity(0.4)
            Text("\(text)")
                .font(.title)
        }
        .frame(width: 50, height: 50)
        .background()
        .compositingGroup()
        .border(isCurrentIndex ? .blue : .black )
        .shadow(color: .white,radius: isCurrentIndex ? 5 : 0)
    }
}
