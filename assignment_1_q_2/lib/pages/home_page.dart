// home_page.dart
import 'package:assignment_1_q_2/pages/plant_page.dart';
import 'package:assignment_1_q_2/widget/likeable_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text("LOL"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What Kinds \nOf Plants You Want",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    enabledBorder: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.mic),
                    labelText: "Search",
                    labelStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
            SelectableButtonRow(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PlantCardWidget(
                            name: "Ficus",
                            price: "12",
                            imageUrl:
                                "https://figandfreya.com/cdn/shop/products/ficuselasticaburgundy4figandfreya_ceac6ad8-ef53-4ac4-aff7-fe77b5e01382.png?v=1629403627&width=1800",
                          ),
                          PlantCardWidget(
                            name: "Cactus",
                            price: "12",
                            imageUrl:
                                "https://figandfreya.com/cdn/shop/products/ficuselasticaburgundy4figandfreya_ceac6ad8-ef53-4ac4-aff7-fe77b5e01382.png?v=1629403627&width=1800",
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PlantCardWidget(
                            name: "Samantha",
                            price: "12",
                            imageUrl:
                                "https://figandfreya.com/cdn/shop/products/ficuselasticaburgundy4figandfreya_ceac6ad8-ef53-4ac4-aff7-fe77b5e01382.png?v=1629403627&width=1800",
                          ),
                          PlantCardWidget(
                            name: "Alovera",
                            price: "12",
                            imageUrl:
                                "https://figandfreya.com/cdn/shop/products/ficuselasticaburgundy4figandfreya_ceac6ad8-ef53-4ac4-aff7-fe77b5e01382.png?v=1629403627&width=1800",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlantCardWidget extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;
  final String type;

  const PlantCardWidget({
    super.key,
    required this.name,
    required this.price,
    required this.imageUrl,
    this.type = "Indoor",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width / 2.5,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF329e60),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                type,
                style: TextStyle(
                  color: Colors.white54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              LikeableButton(),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlantPage(
                    name: name,
                    price: price,
                    imageUrl: imageUrl,
                  ),
                ),
              );
            },
            child: SizedBox(
              height: 125,
              child: Image.network(
                imageUrl,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Price: $price\$",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(22, 255, 255, 255),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class SelectableButtonRow extends StatefulWidget {
  const SelectableButtonRow({
    super.key,
  });

  @override
  State<SelectableButtonRow> createState() => _SelectableButtonRowState();
}

class _SelectableButtonRowState extends State<SelectableButtonRow> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            setState(() {
              _selectedIndex = 0;
            });
          },
          child: Text(
            "All",
            style: TextStyle(
              color: _selectedIndex == 0 ? Colors.greenAccent : Colors.grey,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              _selectedIndex = 1;
            });
          },
          child: Text(
            "Small",
            style: TextStyle(
              color: _selectedIndex == 1 ? Colors.greenAccent : Colors.grey,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              _selectedIndex = 2;
            });
          },
          child: Text(
            "Medium",
            style: TextStyle(
              color: _selectedIndex == 2 ? Colors.greenAccent : Colors.grey,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              _selectedIndex = 3;
            });
          },
          child: Text(
            "Hanging",
            style: TextStyle(
              color: _selectedIndex == 3 ? Colors.greenAccent : Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
