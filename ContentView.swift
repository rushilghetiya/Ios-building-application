//
//  ContentView.swift
//  Amazon
//
//  Created by User on 13/09/23.
//

import SwiftUI

struct Product: Identifiable {
    let id=UUID()
    let name: String
    let price: Double
    let imageName: String
}
let sampleProduct = [
    
    Product(name: "Ipad mini", price: 399.99, imageName: "Image"),
    Product(name: "Macbook M2", price: 999.99, imageName: "Image 1"),
    Product(name: "Iphone", price: 99.99, imageName: "Image 2"),
    Product(name: "iWatch", price: 499.99, imageName: "Image 3"),
    Product(name: "Magic Mouse", price: 299.99, imageName: "Image 4")
    
]

struct Productfile: View{
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Image(product.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 150)
            
            Text(product.name)
                .font(.headline)
            
            Text("$\(String(format: "%.2f", product.price))")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 4)
    }
}

struct ContentView: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible(minimum: 100, maximum: 200), spacing: 16),
        GridItem(.flexible(minimum: 100, maximum: 200), spacing: 16),
    ]
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: columns) {
                    ForEach(sampleProduct)
                    {product in
                        NavigationLink(destination: ProductDetail(product: product)){
                            Productfile(product: product)
                        }
                    }
                }
                .padding(30)
            }
            .navigationTitle("E-commerce Store App")
        }
    }
    
    struct ProductDetail: View{
        let product: Product
        
        var body: some View{
            
            VStack{
                
                Image(product.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 300)
                Text(product.name)
                    .font(.title)
                    .padding()
                
                Text("Price: $\(String(format: "%.2f",product.price))")
                    .font(.headline)
                    .padding()
                
                Spacer()
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
