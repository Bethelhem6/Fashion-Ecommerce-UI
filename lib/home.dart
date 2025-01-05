// ignore_for_file: must_be_immutable

import 'package:ecommerce_ui/detail_screen.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = ["New Arrival", "2024 Women", "Lagos Fashion"];

  List<Map<String, String>> allImages = [
    {
      "image": "assets/image1.jpeg",
      "title": "Pink Culottes",
      "price": "\$200.11",
      "category": "New Arrival"
    },
    {
      "image": "assets/image2.png",
      "title": "Sokoto Eko",
      "price": "\$252.95",
      "category": "New Arrival"
    },
    {
      "image": "assets/image3.jpg",
      "title": "Yellow Top",
      "price": "\$150.00",
      "category": "New Arrival"
    },
    {
      "image": "assets/image4.jpeg",
      "title": "Traditional Attire",
      "price": "\$180.00",
      "category": "New Arrival"
    },
    {
      "image": "assets/image13.jpeg",
      "title": "Yellow Top",
      "price": "\$300.00",
      "category": "New Arrival"
    },
    {
      "image": "assets/image5.jpg",
      "title": "Modern Gown",
      "price": "\$220.50",
      "category": "New Arrival"
    },
    {
      "image": "assets/image6.jpg",
      "title": "Elegant Dress",
      "price": "\$300.00",
      "category": "New Arrival"
    },
    {
      "image": "assets/image7.jpg",
      "title": "Modern Gown",
      "price": "\$220.50",
      "category": "New Arrival"
    },
    {
      "image": "assets/image1.jpeg",
      "title": "Pink Culottes",
      "price": "\$200.11",
      "category": "Lagos Fashion"
    },
    {
      "image": "assets/image2.png",
      "title": "Sokoto Eko",
      "price": "\$252.95",
      "category": "Lagos Fashion"
    },
    {
      "image": "assets/image3.jpg",
      "title": "Yellow Top",
      "price": "\$150.00",
      "category": "Lagos Fashion"
    },
    {
      "image": "assets/image4.jpeg",
      "title": "Traditional Attire",
      "price": "\$180.00",
      "category": "Lagos Fashion"
    },
    {
      "image": "assets/image13.jpeg",
      "title": "Elegant Dress",
      "price": "\$300.00",
      "category": "2024 Women"
    },
    {
      "image": "assets/image5.jpg",
      "title": "Modern Gown",
      "price": "\$220.50",
      "category": "2024 Women"
    },
    {
      "image": "assets/image6.jpg",
      "title": "Elegant Dress",
      "price": "\$300.00",
      "category": "2024 Women"
    },
    {
      "image": "assets/image7.jpg",
      "title": "Modern Gown",
      "price": "\$220.50",
      "category": "2024 Women"
    },
  ];

  List<Map<String, String>> filteredImages = [];
  String selectedCategory = "New Arrival";
  @override
  void initState() {
    super.initState();
    _filterImages();
  }

  void _filterImages() {
    setState(() {
      if (selectedCategory == "New Arrival") {
        filteredImages = allImages
            .where((image) => image['category'] == "New Arrival")
            .toList();
      } else if (selectedCategory == "2024 Women") {
        filteredImages = allImages
            .where((image) => image['category'] == "2024 Women")
            .toList();
      } else if (selectedCategory == "Lagos Fashion") {
        filteredImages = allImages
            .where((image) => image['category'] == "Lagos Fashion")
            .toList();
      }
    });
  }

  // Remaining build() method and other widgets remain unchanged

  int _currentIndex = 0;
  List<String> favorites = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon:
                const Icon(Icons.notifications_none_sharp, color: Colors.black),
            onPressed: () {},
          ),
        ],
        leading: const Icon(Icons.apps_rounded),
      ),
      drawer: const Drawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Most Popular\nAfrican styles!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((category) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = category;
                        _filterImages();
                      });
                    },
                    child: _CategoryChip(
                      label: category,
                      isSelected: selectedCategory == category,
                    ),
                  );
                }).toList(),
              ),
            )
                .animate(delay: 400.ms)
                .shimmer(duration: const Duration(seconds: 1) - 200.ms),
            const SizedBox(height: 16),
            Expanded(
              child: MasonryGridView.builder(
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                ),
                itemCount: filteredImages.length, // Number of items
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                itemBuilder: (context, index) {
                  final image = filteredImages[index];
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetailPage(
                                      title: image['title']!,
                                      image: image['image']!,
                                    )));
                      },
                      child: _FashionItem(
                        imageUrl: image['image']!,
                        name: image['title']!,
                        price: image['price']!,
                        isFavorite: favorites.contains(image['image']!),
                        onFavoriteToggle: () {
                          setState(() {
                            if (favorites.contains(image['image']!)) {
                              favorites.remove(image['image']!);
                            } else {
                              favorites.add(image['image']!);
                            }
                          });
                        },
                      ));
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: FloatingNavbar(
        borderRadius: 30,
        itemBorderRadius: 30,
        selectedBackgroundColor: Colors.orange,
        padding: const EdgeInsets.symmetric(vertical: 5),
        margin: const EdgeInsets.all(0),
        selectedItemColor: Colors.white,
        iconSize: 20,
        onTap: (int val) {
          setState(() {
            _currentIndex = val;
          });
        },
        currentIndex: _currentIndex,
        items: [
          FloatingNavbarItem(
            icon: _currentIndex == 0 ? Icons.home : Icons.home_outlined,
            title: 'Home',
          ),
          FloatingNavbarItem(
              icon: _currentIndex == 1 ? Icons.favorite : Icons.favorite_border,
              title: 'Favorite'),
          FloatingNavbarItem(
              icon: _currentIndex == 2
                  ? Icons.shopping_cart
                  : Icons.shopping_cart_outlined,
              title: 'Cart'),
          FloatingNavbarItem(
              icon: _currentIndex == 3 ? Icons.person : Icons.person_outline,
              title: 'Profile'),
        ],
      ),
      // bottomNavigationBar: SalomonBottomBar(
      //   unselectedItemColor: Colors.grey,
      //   selectedItemColor: Colors.orange,
      //   currentIndex: _currentIndex,
      //   onTap: (i) => setState(() => _currentIndex = i),
      //   items: [
      //     SalomonBottomBarItem(
      //       icon: Icon(_currentIndex == 0 ? Icons.home : Icons.home_outlined),
      //       title: const Text("Home"),
      //     ),
      //     SalomonBottomBarItem(
      //       icon: Icon(
      //           _currentIndex == 1 ? Icons.favorite : Icons.favorite_border),
      //       title: const Text("Likes"),
      //     ),
      //     SalomonBottomBarItem(
      //       icon: Icon(_currentIndex == 2
      //           ? Icons.shopping_cart
      //           : Icons.shopping_cart_outlined),
      //       title: const Text("Search"),
      //     ),
      //     SalomonBottomBarItem(
      //       icon:
      //           Icon(_currentIndex == 3 ? Icons.person : Icons.person_outline),
      //       title: const Text("Profile"),
      //     ),
      //   ],
      // ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const _CategoryChip({required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected ? Colors.orange : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _FashionItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const _FashionItem({
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            )
                .animate()
                .animate(delay: 400.ms)
                .shimmer(duration: const Duration(seconds: 1) - 200.ms)
                .flip(),
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: onFavoriteToggle,
                child: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  padding: const EdgeInsets.all(3),
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_outline,
                    color: isFavorite ? Colors.red : Colors.black,
                  ),
                ),
              ),
            )
                .animate()
                .fadeIn(duration: 300.ms, delay: const Duration(seconds: 1))
                .slideX(begin: 0.2, end: 0),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                    color: Colors.grey[500],
                    fontWeight: FontWeight.normal,
                    fontSize: 14),
                overflow: TextOverflow.ellipsis,
              )
                  .animate()
                  .fadeIn(duration: 300.ms, delay: const Duration(seconds: 1))
                  .slideX(begin: 0.2, end: 0),
              const SizedBox(height: 4),
              Text(
                price,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              )
                  .animate()
                  .fadeIn(duration: 300.ms, delay: const Duration(seconds: 1))
                  .slideX(begin: 0.2, end: 0),
            ],
          ),
        ),
      ],
    );
  }
}
