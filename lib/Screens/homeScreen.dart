import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              // Add your onPressed callback here
            },
          ),
          title: Text(
            "Cattle Management",
            style: TextStyle(
              fontFamily: 'Jomolhari',
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.white,
                size: 25,
              ),
              onPressed: () {
                // Add your onPressed callback here
              },
            ),
          ],
        ),
        body: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          padding: const EdgeInsets.all(40.0),
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 70,
                      child: Image.asset(
                        "assets/images/cattlepic.png",
                      ),
                    ),
                    Text(
                      "Cattle",
                      style: TextStyle(fontFamily: 'Jomolhari', fontSize: 18),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(blurRadius: 10),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 70,
                      child: Image.asset(
                        "assets/images/cattlepic.png",
                      ),
                    ),
                    Text(
                      "Milk Record",
                      style: TextStyle(fontFamily: 'Jomolhari', fontSize: 18),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(blurRadius: 10),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 70,
                      child: Image.asset(
                        "assets/images/cattlepic.png",
                      ),
                    ),
                    Text(
                      "Events",
                      style: TextStyle(fontFamily: 'Jomolhari', fontSize: 18),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(blurRadius: 10),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 70,
                      child: Image.asset(
                        "assets/images/cattlepic.png",
                      ),
                    ),
                    Text(
                      "Transactions",
                      style: TextStyle(fontFamily: 'Jomolhari', fontSize: 18),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(blurRadius: 10),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 70,
                      child: Image.asset(
                        "assets/images/cattlepic.png",
                      ),
                    ),
                    Text(
                      "Farm Setup",
                      style: TextStyle(fontFamily: 'Jomolhari', fontSize: 18),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(blurRadius: 10),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 70,
                      child: Image.asset(
                        "assets/images/cattlepic.png",
                      ),
                    ),
                    Text(
                      "Report",
                      style: TextStyle(fontFamily: 'Jomolhari', fontSize: 18),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(blurRadius: 10),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: _navBar() // BottomNavigationBar(
        //   currentIndex: _currentIndex,
        //   //   backgroundColor: Theme.of(context).primaryColor,
        //   backgroundColor: Colors.white,
        //   items: [
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.home),
        //       label: 'Home',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.search),
        //       label: 'Search',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.person),
        //       label: 'Profile',
        //     ),
        //   ],
        //   onTap: (index) {
        //     setState(() {
        //       _currentIndex = index;
        //     });
        //   },
        // ),
        );
  }

  /* Widget _navBar() {
    return Container(
      height: 70,
      color: const Color(0xFF02B7C8),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
        child: Container(
          width: 300,
          height: 70,
          decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(200.0),
              // border: Border.all(color: const Color(0xFF02B7C8)),
              border: Border.all(color: Colors.white)),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }*/
  /* Widget _navBar() {
    return Container(
      height: 70,
      color: const Color(0xFF02B7C8),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left Icon (Add to Cart)
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  onPressed: () {
                    // Handle Add to Cart action
                  },
                ),
              ),
            ),
            // Add some space between icons
            // Center Icon (Home)
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    // Handle Home action
                  },
                ),
              ),
            ),
            // Add some space between icons
            // Right Icon (Settings)
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    // Handle Settings action
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }*/
  Widget _navBar() {
    return Container(
      height: 70,
      color: const Color(0xFF02B7C8),
      child: Padding(
          padding:
              const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
          child: Expanded(
              child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: const Color(0xFF02B7C8),
                    size: 30,
                  ),
                  onPressed: () {
                    // Handle Add to Cart action
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.home,
                    color: const Color(0xFF02B7C8),
                    size: 35,
                  ),
                  onPressed: () {
                    // Handle Add to Cart action
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: const Color(0xFF02B7C8),
                    size: 30,
                  ),
                  onPressed: () {
                    // Handle Add to Cart action
                  },
                ),
              ],
            ),
          ))),
    );
  }
}
