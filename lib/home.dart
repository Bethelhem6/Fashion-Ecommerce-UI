// ignore_for_file: must_be_immutable

import 'package:ecommerce_ui/detail_screen.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatelessWidget {
  List<String> images = [
    "assets/image3.jpg",
    "assets/image1.jpeg",
    "assets/image2.png",
    "assets/image4.jpeg",
    "assets/image5.jpg",
    "assets/image6.jpg",
  ];

  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
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
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _CategoryChip(label: "New Arrival", isSelected: true),
                    _CategoryChip(label: "2024 Women"),
                    _CategoryChip(label: "Lagos Fashion"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: MasonryGridView.builder(
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                ),
                itemCount: 6, // Number of items
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailPage(image: images[index % images.length],)));
                    },
                    child: _FashionItem(
                      imageUrl: images[index % images.length],
                      name: index == 0
                          ? "Pink Culottes"
                          : index == 1
                              ? "Sokoto Eko"
                              : index % 2 == 0
                                  ? "Yellow Top"
                                  : "Traditional Attire",
                      price: index == 0
                          ? "\$200.11"
                          : index == 1
                              ? "\$252.95"
                              : "\$150.00",
                      index: index, // Pass the index
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:FloatingNavbar(
            onTap: (int val) {
              //returns tab id which is user tapped
            },
            padding: const EdgeInsets.symmetric(vertical: 2),
            margin: const EdgeInsets.all(0),
            selectedBackgroundColor: Colors.orange,
            currentIndex: 0,
            borderRadius: 20,
            items: [
              FloatingNavbarItem(icon: Icons.home, title: 'Home'),
              FloatingNavbarItem(icon: Icons.favorite_outline, title: 'Favorite'),
              FloatingNavbarItem(icon: Icons.shopping_cart_outlined, title: 'Cart'),
              FloatingNavbarItem(icon: Icons.person_2_outlined, title: 'Profile'),
            
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
       
      ),
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
  final int index; // Add index to differentiate items

  const _FashionItem({
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: 150 +
                      (index % 3) * 50, // More noticeable height variations
                  width: double.infinity,
                ),
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
                    ),
                    const SizedBox(height: 4),
                    Text(
                      price,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              padding: const EdgeInsets.all(3),
              child: const Icon(Icons.favorite_outline),
            ),
          )
        ],
      ),
    );
  }
}
