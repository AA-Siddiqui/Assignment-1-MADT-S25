// main_page.dart
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:assignment_1_q_1/pages/placeholder_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _pageController = PageController(initialPage: 0);
  int pageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: const [
          MainPage(),
          PlaceholderPage(),
          PlaceholderPage(),
          PlaceholderPage(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        shape: CircleBorder(),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [
          Icons.home,
          Icons.calendar_month,
          Icons.camera_alt,
          Icons.notifications,
        ],
        activeColor: Colors.deepPurple,
        inactiveColor: Colors.grey,
        backgroundColor: Color(0xFFE4E4E4),
        activeIndex: pageIndex,
        gapLocation: GapLocation.center,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 10 * 2,
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            // top: MediaQuery.of(context).size.height / 10,
            left: 20,
            right: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 12,
                    bottom: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(Icons.person),
                      ),
                      Text(
                        "Sabat Tarnak",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(Icons.message),
                      ),
                    ],
                  ),
                ),
                ItemPriceWidget(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Latest Products",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "View All",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 125,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              LatestProductItemWidget(
                                name: "Lorem Ipsum",
                                price: "28,000",
                                imageURL:
                                    "https://images.unsplash.com/photo-1584623572201-d0385667e46d?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Z3Jhc3MlMjBmaWVsZHxlbnwwfHwwfHx8MA%3D%3D",
                              ),
                              LatestProductItemWidget(
                                name: "Lorem Ipsum",
                                price: "4,200",
                              ),
                              LatestProductItemWidget(
                                name: "Lorem Ipsum",
                                price: "30,000",
                              ),
                              LatestProductItemWidget(
                                name: "Lorem Ipsum",
                                price: "2,000",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                PostWidget(
                  imageURL:
                      "https://cdn-icons-png.flaticon.com/512/6858/6858485.png",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PostWidget extends StatelessWidget {
  final String? imageURL;
  const PostWidget({
    super.key,
    this.imageURL,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: Colors.deepPurple,
                  width: 2,
                ),
                color: Colors.grey,
              ),
              child: imageURL != null
                  ? Image.network(
                      imageURL!,
                      fit: BoxFit.fitHeight,
                    )
                  : Icon(
                      Icons.person,
                      size: 50,
                    ),
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Martin Pamier",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Just now",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                  ),
                ),
                Text(
                    "Lorem Ipsum dolor sit amet, consectetur adipiscing elit."),
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.network(
                    "https://marialouisedesign.com/wp-content/uploads/2022/03/Baby-Chicks-15.jpg",
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.more_vert),
        ],
      ),
    );
  }
}

class LatestProductItemWidget extends StatelessWidget {
  final String name;
  final String price;
  final String? imageURL;

  const LatestProductItemWidget({
    super.key,
    required this.name,
    required this.price,
    this.imageURL,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            width: 75,
            height: 75,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(120),
              color: Colors.grey,
            ),
            child: imageURL != null
                ? Image.network(
                    imageURL!,
                    fit: BoxFit.fitHeight,
                  )
                : Icon(Icons.photo),
          ),
          Text(
            name,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          Text(
            price,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({
    super.key,
  });

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String value = "Today";
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      borderRadius: BorderRadius.circular(8),
      underline: Container(),
      value: value,
      items: [
        DropdownMenuItem(
          value: "Today",
          child: Text(
            "Today",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        DropdownMenuItem(
          value: "Yesterday",
          child: Text(
            "Yesterday",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ],
      onChanged: (String? newValue) {
        setState(() => value = newValue ?? "Today");
      },
    );
  }
}

class ItemPriceWidget extends StatelessWidget {
  const ItemPriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [BoxShadow(blurRadius: 4)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Items Price",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const DropDownWidget(),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PriceBoxItem(
                  price: "22,000",
                  icon: Icons.pets,
                ),
                PriceBoxItem(
                  price: "23,000",
                  icon: Icons.pets,
                ),
                PriceBoxItem(
                  price: "1,800",
                  icon: Icons.pets,
                ),
                PriceBoxItem(
                  price: "1,800",
                  icon: Icons.pets,
                ),
                PriceBoxItem(
                  price: "29,000",
                  icon: Icons.pets,
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InteractionButton(
                  icon: Icons.thumb_up,
                  text: "Like",
                ),
                InteractionButton(
                  icon: Icons.message_rounded,
                  text: "Message",
                ),
                InteractionButton(
                  icon: Icons.share,
                  text: "Share",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InteractionButton extends StatelessWidget {
  const InteractionButton({
    super.key,
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 2,
          ),
          child: Icon(
            icon,
            size: 18,
            color: Colors.grey,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class PriceBoxItem extends StatelessWidget {
  const PriceBoxItem({
    super.key,
    required this.icon,
    required this.price,
  });

  final IconData icon;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 193, 7, 0.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                size: 36,
              ),
            ),
          ),
          Text(
            price,
            style: TextStyle(
              color: const Color.fromARGB(255, 209, 157, 0),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
