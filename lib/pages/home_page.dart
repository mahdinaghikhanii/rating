import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:rating/data/products.dart';
import 'package:rating/pages/product_details_page.dart';

import '../data/categories.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color(0xff151617),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff151617),
        foregroundColor: Colors.white,
        leading:
            IconButton(onPressed: () {}, icon: const Icon(IconlyLight.search)),
        title: ActionChip(
          label: const Text("New Jersey"),
          shape: const StadiumBorder(),
          backgroundColor: const Color(0xff272b30),
          labelStyle: const TextStyle(color: Colors.white),
          avatar: const Icon(IconlyLight.location, color: Colors.white),
          side: const BorderSide(width: 0),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Badge(
              backgroundColor: theme.colorScheme.primary,
              alignment: const Alignment(1, -1.5),
              child: const Icon(IconlyLight.notification),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Find the best to rent",
                    style: theme.textTheme.headlineMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 90,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return Container(
                        height: double.maxFinite,
                        width: 90,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: category.color,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              category.image,
                              width: 50,
                            ),
                            Text(
                              category.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 15),
                    itemCount: categories.length,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height * 0.7),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Lease again",
                        style: theme.textTheme.titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Text("View all"),
                        label: const Icon(IconlyLight.arrowRight2, size: 20),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 220,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 16),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetailsPage(product: product),
                              ));
                        },
                        child: SizedBox(
                          width: 130,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // IMAGE
                              Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                width: double.maxFinite,
                                height: 130,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(product.image),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: IconButton.filledTonal(
                                          onPressed: () {},
                                          icon: const Icon(Icons.favorite),
                                          padding: EdgeInsets.zero,
                                          iconSize: 18,
                                        ),
                                      ),
                                      const Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(IconlyBold.star,
                                              size: 16,
                                              color: Colors.deepOrange),
                                          SizedBox(width: 4),
                                          Text("4.9")
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  product.name,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold),
                                      text: "\$${product.price}0",
                                    ),
                                    TextSpan(
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                              color: Colors.grey.shade600),
                                      text: " / hr",
                                    )
                                  ],
                                ),
                              )

                              // PRICE
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 15),
                    itemCount: products.length,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Available Now",
                        style: theme.textTheme.titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.secondaryContainer
                              .withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              margin: const EdgeInsets.only(right: 15),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Image.asset("assets/drill.png"),
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 4),
                                    child: Text(
                                      "Craftsman Cordless Drill",
                                      style: theme.textTheme.titleMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(IconlyBold.location, size: 16),
                                      const Text("4.0km"),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text("\$5.00 /hr"),
                                      ),
                                      Icon(IconlyBold.star,
                                          size: 16,
                                          color: theme.colorScheme.primary),
                                      Text(
                                        "4.9",
                                        style: TextStyle(
                                            color: theme.colorScheme.primary),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.favorite),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.category),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Padding(
                padding: EdgeInsets.only(right: 40),
                child: Icon(Icons.favorite_border)),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Padding(
                padding: EdgeInsets.only(left: 40),
                child: Icon(Icons.chat_bubble_outline_outlined)),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.profile),
            label: "Search",
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.primary.withOpacity(0.2),
              spreadRadius: 5,
            )
          ],
        ),
        child: FloatingActionButton(
          onPressed: () {},
          elevation: 0,
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
