// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProductDetailPage extends StatefulWidget {
  String image;
  String title;

  ProductDetailPage({super.key, required this.image, required this.title});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      widget.image,
                      height: 400,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      top: 20,
                      left: 10,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * .9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Container(
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                padding: const EdgeInsets.all(5),
                                child: const Icon(Icons.arrow_back_ios,
                                    color: Colors.black),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Container(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  padding: const EdgeInsets.all(3),
                                  child: const Icon(Icons.more_vert,
                                      color: Colors.black),
                                )),
                          ],
                        ),
                      ))
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'dye \nlab',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        isFavourite = !isFavourite;
                        setState(() {});
                      },
                      child: Icon(
                          isFavourite ? Icons.favorite : Icons.favorite_border,
                          color: Colors.red)),
                ],
              )
                  .animate()
                  .fadeIn(duration: 300.ms, delay: const Duration(seconds: 1))
                  .slideX(begin: 0.2, end: 0),
              const SizedBox(height: 4),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    '\$200.11',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              )
                  .animate()
                  .fadeIn(duration: 300.ms, delay: const Duration(seconds: 1))
                  .slideX(begin: 0.2, end: 0),
              const SizedBox(height: 4),
              const Text(
                'Eko Collection',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              )
                  .animate()
                  .fadeIn(duration: 300.ms, delay: const Duration(seconds: 1))
                  .slideX(begin: 0.2, end: 0),
              const SizedBox(height: 16),
              const Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  Icon(Icons.star_half, color: Colors.amber, size: 20),
                  SizedBox(width: 8),
                  Text(
                    '4.5',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              )
                  .animate()
                  .fadeIn(duration: 300.ms, delay: const Duration(seconds: 1))
                  .slideX(begin: 0.2, end: 0),
              const SizedBox(height: 16),
              Text(
                'Elevate your style with this exquisite 2-piece African wear, featuring vibrant, bold prints and expertly tailored designs...',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              )
                  .animate()
                  .fadeIn(duration: 300.ms, delay: const Duration(seconds: 1))
                  .slideX(begin: 0.2, end: 0),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 125,
                    vertical: 16,
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Add to cart',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
