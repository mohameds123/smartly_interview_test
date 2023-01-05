import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:movies/Store/presentation/screens/cart_screen.dart';
import 'package:movies/Store/presentation/screens/home_screen.dart';
import 'package:movies/Store/presentation/screens/payment_screen.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AppLayout> {
  late PageController _pageController;
  int selectedIndex = 0;
  bool _colorful = false;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  void onButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(selectedIndex,
        duration: const Duration(milliseconds: 400), curve: Curves.easeOutQuad);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: _listOfWidget,
            ),
          ),
        ],
      ),

      bottomNavigationBar: SlidingClippedNavBar(
        backgroundColor: Colors.grey.shade900,
        onButtonPressed: onButtonPressed,
        iconSize: 30,
        activeColor:  HexColor('AC8027'),
        selectedIndex: selectedIndex,
        inactiveColor: Colors.white,
        barItems: <BarItem>[
          BarItem(
            icon: Icons.home_filled,
            title: 'Home',
          ),
          BarItem(
            icon: Icons.payment_rounded,
            title: 'Payment',
          ),
          BarItem(
            icon: Icons.shopping_cart,
            title: 'Cart',
          ),
        ],
      ),
    );
  }
}

// icon size:24 for fontAwesomeIcons
// icons size: 30 for MaterialIcons

List<Widget> _listOfWidget = <Widget>[
 const HomeScreen(),
  const PayMentScreen(),
  CartScreen(),
];