import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LipSlay',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Colors.pinkAccent,
      ),
      home: MyBottomNavigationBar(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> images = [
    'images/slider/1948121663.png',
    'images/slider/1948121663.png',
    'images/slider/1948121663.png',
  ];

  final List<Category> categories = [
    Category(
      title: 'Bleach & Threading',
      image: 'images/category/Bleach.png',
    ),
    Category(
      title: 'Facial',
      image: 'images/category/Facial.png',
    ),
    Category(
      title: 'Hair',
      image: 'images/category/Hair.png',
    ),
    Category(
      title: 'Henna',
      image: 'images/category/Henna.png',
    ),
    Category(
      title: 'Makeup',
      image: 'images/category/Makup.png',
    ),
    Category(
      title: 'Manicure-Pedicure',
      image: 'images/category/Manicure.png',
    ),
    Category(
      title: 'Henna',
      image: 'images/category/Henna.png',
    ),
    Category(
      title: 'Makeup',
      image: 'images/category/Makup.png',
    ),
    Category(
      title: 'Manicure-Pedicure',
      image: 'images/category/Manicure.png',
    ),
  ];

  final List<OfferProduct> offerProducts = [
    OfferProduct(
      name: 'Anti Acne Facial',
      image: 'images/product/1693666565.png',
      rating: 4.5,
      price: '\AED149.00',
      duration: '45 MINS',
    ),
    OfferProduct(
      name: 'Asta Berry Gold Facial',
      image: 'images/product/1693662703.png',
      rating: 4.0,
      price: '\AED99.00',
      duration: '45 MINS',
    ),
    OfferProduct(
      name: 'Asta Berry Whitening Facial',
      image: 'images/product/1693663354.png',
      rating: 4.8,
      price: '\AED99.00',
      duration: '45 MINS',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('LipSlay Home Services'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
                items: images.map((assetPath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            assetPath,
                            fit: BoxFit.cover,
                            width: 1000.0,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckBookingPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
              ),
              child: Text(
                'Check Booking',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            SizedBox(height: 20.0),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryPage(
                          category: categories[index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage(categories[index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        color: Colors.transparent,
                        child: Text(
                          categories[index].title,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Offers',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    height: 200.0,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: offerProducts.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: OfferProductCard(
                            offerProduct: offerProducts[index],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Container(
        color: Colors.pinkAccent,
        child: Center(
          child: Text(
            'Search Page Content',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Container(
        color: Colors.pinkAccent,
        child: Center(
          child: Text(
            'Cart Page Content',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: Container(
        color: Colors.pinkAccent,
        child: Center(
          child: Text(
            'Wishlist Page Content',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class CheckBookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Booking'),
      ),
      body: Center(
        child: Text('Check Booking Page Content'),
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text(
            'Menu Page Content',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class Category {
  final String title;
  final String image;

  Category({
    required this.title,
    required this.image,
  });
}

class OfferProduct {
  final String name;
  final String image;
  final double rating;
  final String price;
  final String duration;

  OfferProduct({
    required this.name,
    required this.image,
    required this.rating,
    required this.price,
    required this.duration,
  });
}

class OfferProductCard extends StatelessWidget {
  final OfferProduct offerProduct;

  OfferProductCard({required this.offerProduct});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductViewPage(product: offerProduct),
          ),
        );
      },
      child: Container(
        width: 200.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
              child: Image.asset(
                offerProduct.image,
                width: 200.0,
                height: 120.0,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    offerProduct.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      SizedBox(width: 4.0),
                      Text(offerProduct.rating.toString()),
                    ],
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Price: ${offerProduct.price}',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Text('Duration: ${offerProduct.duration}'),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Book Now
                        },
                        child: Text('Book Now'),
                      ),
                      IconButton(
                        onPressed: () {
                          // Add to Wishlist
                        },
                        icon: Icon(Icons.favorite_border),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductViewPage extends StatelessWidget {
  final OfferProduct product;

  ProductViewPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Center(
        child: Text('${product.name} View Page Content'),
      ),
    );
  }
}

class CategoryPage extends StatelessWidget {
  final Category category;

  CategoryPage({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: Text('${category.title} Page Content'),
      ),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    CartPage(),
    WishlistPage(),
    CheckBookingPage(),
    MenuPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.pinkAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Colors.pinkAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
            backgroundColor: Colors.pinkAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Wishlist',
            backgroundColor: Colors.pinkAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
            backgroundColor: Colors.pinkAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
            backgroundColor: Colors.pinkAccent,
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.pinkAccent,
      ),
    );
  }
}
