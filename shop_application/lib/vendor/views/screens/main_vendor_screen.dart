import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_application/vendor/views/screens/earnings_screen.dart';
import 'package:shop_application/vendor/views/screens/edit_product_screen.dart';
import 'package:shop_application/vendor/views/screens/upload_screen.dart';
import 'package:shop_application/vendor/views/screens/vendor_logout_screen.dart';
import 'package:shop_application/vendor/views/screens/vendor_order_screen.dart';

class MainVendorScreen extends StatefulWidget {
  const MainVendorScreen({super.key});

  @override
  State<MainVendorScreen> createState() => _MainVendorScreenState();
}

class _MainVendorScreenState extends State<MainVendorScreen> {
  // ignore: unused_field
  int _pageIndex = 0;

  // ignore: unused_field
  List<Widget> _pages = [
    EarningsScreen(),
    UploadScreen(),
    EditProductScreen(),
    VendorOrderScreen(),
    VendorLogoutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _pageIndex,
          onTap: (value) {
            setState(() {
              _pageIndex = value;
            });
          },
          //type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.yellow.shade900,
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.money_dollar),
              label: 'EARNINGS',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.upload),
              label: 'UPLOAD',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.edit),
              label: 'EDIT',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.shopping_cart),
              label: 'ORDER',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout),
              label: 'LOG OUT',
            ),
          ]),
      body: _pages[_pageIndex],
    );
  }
}
