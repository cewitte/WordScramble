//
//  ContentView.swift
//  WordScramble
//
//  Created by Carlos Eduardo Witte on 20/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                            Text(word)
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit {
                addNewWord()
            }
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        // exit if string is empty
        guard answer.count > 0 else { return }
        
        // extra validation to come
        withAnimation {
            usedWords.insert(answer, at: 0)
            newWord = ""            
        }

    }
}

#Preview {
    ContentView()
}
