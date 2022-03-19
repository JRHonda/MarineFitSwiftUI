//
//  InputNameView.swift
//  
//
//  Created by Justin Honda on 2/10/22.
//

import SwiftUI

public struct InputNameView: View {
    
    // MARK: - Binding
    
    @Binding public var input: String
    
    // MARK: - Properties
    
    public var page: Int { 4 }
    
    // MARK: - Public Init
    
    public init(input: Binding<String>) {
        self._input = input
    }
    
    // MARK: - Body
    
    public var body: some View {
        TextField("Username", text: $input)
    }
}

// MARK: - Previews

struct InputNameView_Previews: PreviewProvider {
    static var previews: some View {
        InputNameView(input: .constant("Justin"))
    }
}
