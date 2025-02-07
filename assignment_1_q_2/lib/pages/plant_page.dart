// plant_page.dart
import 'package:assignment_1_q_2/widget/likeable_button.dart';
import 'package:flutter/material.dart';

class PlantPage extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;
  const PlantPage({
    super.key,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Details",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LikeableButton(
              color: Color(0x9D504E4E),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              "https://figandfreya.com/cdn/shop/products/ficuselasticaburgundy4figandfreya_ceac6ad8-ef53-4ac4-aff7-fe77b5e01382.png?v=1629403627&width=1800",
              fit: BoxFit.fitHeight,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Regular Price: \$$price",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CounterWidget(),
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas vestibulum facilisis suscipit. Suspendisse elementum lacus tortor, sed mollis leo scelerisque vitae. Sed consectetur ut metus vel mattis.",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            FilledButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF329e60),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Center(child: Text("Buy Now")),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({
    super.key,
  });

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _count = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF329e60),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            setState(() {
              _count++;
            });
          },
          icon: Icon(Icons.add),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            _count.toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        IconButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF329e60),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            setState(() {
              if (_count == 1) return;
              _count--;
            });
          },
          icon: Icon(Icons.remove),
        ),
      ],
    );
  }
}
