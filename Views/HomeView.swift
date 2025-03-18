  //
//  HomeView.swift
//  SuperMarketAppUI
//
//  Created by Miten Mistry on 03/03/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var cartManager: CartManager
    @State private var searchText = ""
    @State private var selectedCategory: Category?
    

    let products = [
        Product(name: "Apple", description: "Fresh and Organic Apples\nApple is a sweet and delicious fruit that is very healthy. It is also a good disease-fighter and we can eat it every day. The delicious taste and bright colour of the food make it even more appealing. Moreover, it is a versatile fruit which we can use in many dishes.", price: 1.99, image: "apple", category: .fruits),
        Product(name: "Banana", description: "Sweet and Ripe Bananas\nBanana is a very popular fruit due to its low price and high nutritive value. It is consumed in fresh or cooked form both as ripe and raw fruit. Banana is a rich source of carbohydrate and is rich in vitamins particularly vitamin B.", price: 0.79, image: "banana", category: .fruits),
        Product(name: "Carrot", description: "Fresh and Organic Carrots\nCarrots are a popular, nutritious root vegetable known for their sweet flavor and vibrant orange color.", price: 0.99, image: "carrot", category: .vegetables),
        Product(name: "Tomato", description: "Juicy Tomatoes\nTomatoes are edible fruits, botanically belonging to the nightshade family, commonly known as the vegetable, and are a popular ingredient, known for their versatile use in various dishes and are a good source of nutrients.", price: 1.49, image: "tomato", category: .vegetables),
        Product(name: "Milk", description: "Fresh Dairy Milk, Rich in Calcium", price: 2.50, image: "milk", category: .dairy),
        Product(name: "Cheese", description: "Cheddar Cheese\nCheese is a nutrient-dense dairy food, providing protein, fats, and minerals. Some hard block cheeses that contain little moisture like Parmigiano-Reggiano and aged cheddar are easily stored and travel well because they do not require refrigeration.", price: 3.99, image: "cheese", category: .dairy),
        Product(name: "Orange Juice", description: "100% Pure Orange Juice", price: 2.99, image: "orange juice", category: .beverages),
        Product(name: "Cola", description: "Refreshing Soda", price: 1.89, image: "cola", category: .beverages),
        Product(name: "Chips", description: "Crispy Potato Chips", price: 1.99, image: "chips", category: .snacks),
        Product(name: "Chocolate", description: "Delicious Chocolate Bar", price: 2.49, image: "chocolate", category: .snacks),
        Product(name: "Ground Chickpeas", description: "Eat Pulses, get more Protien", price: 3.25, image: "ground chickpeas", category: .pulses),
        Product(name: "Peigon Peas", description: "Eat this and get Protein", price: 3.00, image: "peigon peas", category: .pulses),
        
    ]
    
    let bestSellingProducts = [
        Product(name: "Apple", description: "Fresh and Organic Apples\n Apple is a sweet and delicious fruit that is very healthy. It is also a good disease-fighter and we can eat it every day. The delicious taste and bright colour of the food make it even more appealing. Moreover, it is a versatile fruit which we can use in many dishes.", price: 1.99, image: "apple", category: .fruits),
        Product(name: "Milk", description: "Fresh Dairy Milk, Rich in Calcium", price: 2.50, image: "milk", category: .dairy),
        Product(name: "Chips", description: "Crispy Potato Chips", price: 1.99, image: "chips", category: .snacks),
        Product(name: "Chocolate", description: "Delicious Chocolate Bar", price: 1.99, image: "chocolate", category: .snacks),
        Product(name: "Cola", description: "Refreshing Soda", price: 1.99, image: "cola", category: .snacks)
    ]

    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var filteredProducts: [Product] {
        let filtered = products.filter { product in
            searchText.isEmpty || product.name.localizedCaseInsensitiveContains(searchText)
        }
        if let category = selectedCategory {
            return filtered.filter { $0.category == category }
        }
        return filtered
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    
                    // Banner Image with Translucency
                    ZStack {
                        Image("banner") //  Ensure you have "banner" in Assets
                            .resizable()
                            .scaledToFill()
                            .frame(height: 150)
                            .ignoresSafeArea(edges: .all)

                        HStack {
            
                        }
                        .padding(.horizontal)
                        .padding(.top, 50) //  Adjust for safe area
                    }
                    .padding()
                    
                    Spacer()
                    
                    Spacer()

                
                    // Profile Image & Search Bar in One Line
                    HStack {
                        Spacer()
                        
                        // Search Bar
                        
                        SearchBar(text: $searchText)
                            .frame(width: 380) //  Adjust width to fit inline
                    
                            .padding(.horizontal)
                        }
                 
                        

                    // Offer Banner Section
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            OfferBanner(title: "Super Sale!", subtitle: "Up to 50% off on selected items", image: "sale")
                            OfferBanner(title: "Fresh Deals", subtitle: "Get the best organic products", image: "freshdeal")
                        }
                        .padding(.horizontal)
                    }
                    .padding(.top)
                    
                    // Categories Filter
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(Category.allCases, id: \.self) { category in
                                CategoryButton(
                                    category: category,
                                    isSelected: selectedCategory == category,
                                    action: {
                                        selectedCategory = selectedCategory == category ? nil : category
                                    }
                                )
                            }
                        }
                        .padding(.horizontal)
                    }

                    // Hide "Best Selling" section when a category is selected
                    if selectedCategory == nil {
                        Text("Best Selling")
                            .font(.title2)
                            .bold()
                            .padding(.horizontal)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(bestSellingProducts, id: \.id) { product in
                                    NavigationLink(destination: ProductDetailView(product: product)) {
                                        ProductCard(product: product)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                        .padding(.vertical)
                    }

                    // Product Grid
                    Text("All products that you need!!!!")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(filteredProducts, id: \.id) { product in
                            NavigationLink(destination: ProductDetailView(product: product)) {
                                ProductCard(product: product) // ✅ Uses updated ProductCard with images
                            }
                        }
                    }
                    .padding()
                }
                .background(Color(.systemGray6))
            }
            .navigationBarHidden(true) //  Hide default navigation bar
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(CartManager())
    }
}
