import 'package:flutter/material.dart';
import 'filter_button.dart';
import 'wine_category_card.dart';

class WineShopScreen extends StatefulWidget {
  const WineShopScreen({Key? key}) : super(key: key);

  @override
  _WineShopScreenState createState() => _WineShopScreenState();
}

class _WineShopScreenState extends State<WineShopScreen> {
  final List<Map<String, dynamic>> wines = const [
    {
      'name': 'Ocane Bozzovich Beneventano Blanco IGT',
      'type': 'Red wine (Italy)',
      'price': '23,256,596',
      'available': true,
      'score': 94,
      'imageUrl': 'https://tmarchettico.com/wp-content/uploads/Bozzovich-Rosso-e1579285248153-325x1024.png',
    },
    {
      'name': '2021 Petit Chablis - Passy le Clou',
      'type': 'White wine (France)',
      'price': '23,256,596',
      'available': true,
      'score': 89,
      'imageUrl': 'https://www.thedrinksbusiness.com/content/uploads/2023/05/PETIT-CHABLIS-DOMAINE-PASSY-LE-CLOU-2020-640x176.png',
    },
    {
      'name': 'Philippe Fontaine Champagne Brut Rosé',
      'type': 'Sparkling wine (France)',
      'price': '23,256,596',
      'available': false,
      'score': 92,
      'imageUrl': 'https://freedombev.com/wp-content/uploads/2023/09/champange-distributor-north-carolina.jpg.webp',
    },
    {
      'name': '2021 Cicada\'s Song Rosé',
      'type': 'Rosé wine (France)',
      'price': '23,256,596',
      'available': true,
      'score': 90,
      'imageUrl': 'https://cdn.shopify.com/s/files/1/0286/0586/files/FullSizeRender_e9f65bc8-d3be-4706-8749-233f06d0072e.heic?v=1697629225',
    },
  ];

  List<Map<String, dynamic>> favoriteWines = [];
  String searchText = '';
  String selectedFilter = '';

  void _onFilterButtonPressed(String filterType) {
    setState(() {
      selectedFilter = filterType;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredWines = wines.where((wine) {
      return wine['name'].toLowerCase().contains(searchText.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Donnerville Drive", style: TextStyle(fontSize: 16)),
            Text(
              "4 Donnerville Hall, Donnerville Drive",
              style: TextStyle(fontSize: 12, color: Colors.grey[400]),
            ),
          ],
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                  child: const Text(
                    '1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: const InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
            ),
            const SizedBox(height: 20),
            // Filter buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilterButton(
                  label: 'Type',
                  isSelected: selectedFilter == 'Type',
                  onPressed: () => _onFilterButtonPressed('Type'),
                ),
                FilterButton(
                  label: 'Style',
                  isSelected: selectedFilter == 'Style',
                  onPressed: () => _onFilterButtonPressed('Style'),
                ),
                FilterButton(
                  label: 'Countries',
                  isSelected: selectedFilter == 'Countries',
                  onPressed: () => _onFilterButtonPressed('Countries'),
                ),
                FilterButton(
                  label: 'Grape',
                  isSelected: selectedFilter == 'Grape',
                  onPressed: () => _onFilterButtonPressed('Grape'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Shop wines by
            const Text(
              "Shop wines by",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Wine categories
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                WineCategoryCard(
                  label: 'Red Wines',
                  imageUrl: 'https://www.thespruceeats.com/thmb/N9TEoqtQz-R9zkjMXM8I530sj30=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/red-wine-is-poured-into-a-glass-from-a-bottle--light-background--1153158143-98320451802c485cb6d7b5437c7fd60a.jpg',
                  count: 10,
                ),
                WineCategoryCard(
                  label: 'White Wines',
                  imageUrl: 'https://res.cloudinary.com/hz3gmuqw6/image/upload/c_fill,q_auto,w_750/f_auto/what-is-a-dry-white-wine-php6LebyJ ',
                  count: 8,
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Wine list
            Expanded(
              child: ListView.builder(
                itemCount: filteredWines.length,
                itemBuilder: (context, index) {
                  final wine = filteredWines[index];
                  final isFavorite = favoriteWines.contains(wine);

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Imaginea produsului
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                              image: DecorationImage(
                                image: NetworkImage(wine['imageUrl']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        wine['name'],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        wine['type'],
                                        style: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Price: ${wine['price']}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Critic Score: ${wine['score']}/100',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    // Disponibilitate
                                    Text(
                                      wine['available'] ? 'Available' : 'Unavailable',
                                      style: TextStyle(
                                        color: wine['available'] ? Colors.green : Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    // Butonul pentru favorite
                                    IconButton(
                                      icon: Icon(
                                        isFavorite ? Icons.favorite : Icons.favorite_border,
                                        color: isFavorite ? Colors.red : null,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (isFavorite) {
                                            favoriteWines.remove(wine);
                                          } else {
                                            favoriteWines.add(wine);
                                          }
                                        });
                                      },
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}