import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final Color backgroundColor;
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      backgroundColor: Colors.red,
      items:[
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/home.png',width: 24,height: 24,),
           label: "Home"),
       BottomNavigationBarItem(
        icon: Image.asset('assets/images/cart.png',width: 24,height: 24,), label: "product"),
        BottomNavigationBarItem(
        icon: Image.asset('assets/images/refund.png',width: 24,height: 24,), label: "refund"),
        BottomNavigationBarItem(
        icon: Image.asset('assets/images/transaction_history.png',width: 24,height: 24,), label: "transaction list"),
   BottomNavigationBarItem(
    icon: Image.asset('assets/images/person.png',width: 24,height: 24,), label: "My Profile"),
      ],
      onTap: onTap,
        selectedItemColor: Colors.white, // Color of the selected item
        unselectedItemColor: Colors.white54, // Color of unselected items
        showUnselectedLabels: true, // Show unselected labels
    );
  }
}
