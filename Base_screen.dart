import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  PageController _pageController;
  int _page = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        curve: Curves.elasticOut,
        animationDuration: Duration(milliseconds: 1100),
        selectedIndex: _page,
        onItemSelected: (p) {
          _pageController.animateToPage(p,
              duration: Duration(milliseconds: 500), curve: Curves.ease);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              textAlign: TextAlign.center,
              icon: Icon(Icons.home),
              title: Text('Home'),
              activeColor: Colors.redAccent,
              inactiveColor: Colors.black),
          BottomNavyBarItem(
              textAlign: TextAlign.center,
              icon: Icon(Icons.chat_bubble_outline),
              title: Text('Chat'),
              activeColor: Colors.green,
              inactiveColor: Colors.black),
          BottomNavyBarItem(
              textAlign: TextAlign.center,
              icon: Icon(Icons.mail_outline),
              title: Text('Contato'),
              activeColor: Colors.black,
              inactiveColor: Colors.black),
          BottomNavyBarItem(
              textAlign: TextAlign.center,
              icon: Icon(Icons.person_outline),
              title: Text('MInha conta'),
              activeColor: Colors.blue,
              inactiveColor: Colors.black),
        ],
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (p) {
          setState(() {
            _page = p;
          });
        },
        controller: _pageController,
        children: <Widget>[
          Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.redAccent,
              title: Text('Home'),
              centerTitle: true,
            ),
            backgroundColor: Colors.redAccent,
          ),
          Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.yellow,
              title: Text('Chat'),
              centerTitle: true,
            ),
            backgroundColor: Colors.yellow,
          ),
          Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.green,
              title: Text('Email'),
              centerTitle: true,
            ),
            backgroundColor: Colors.green,
          ),
          Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.grey,
              title: Text('Minha Conta'),
              centerTitle: true,
            ),
            backgroundColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
