import 'package:colon/views/bookpage.dart';
import 'package:colon/views/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {

      return MaterialApp(
          home: DefaultTabController(
            length: 2,
        child: Scaffold(
          bottomNavigationBar: menu(),

          body: TabBarView(
                  children: [

                    Container(child:  BookPage(),),

                    Container(child: ProfilePage()),

                  ],
                ),
          ),
          ),
        );



  }

  Widget menu() {
    return Container(
      color: Colors.grey[900].withOpacity(0.90),
      width: 60,
      height: 60,
      child: TabBar(
        labelColor: Color(0xFF399df8),
        unselectedLabelColor: Colors.white,
        tabs: [
          Tab(
            child: (Text("Books",style:TextStyle(fontSize: 8))),
            icon:  Icon( LineIcons.book,),),
          Tab(
            child: (Text("Profile",style:TextStyle(fontSize: 8))),
            icon: Icon( LineIcons.user,),),
        ],
      ),
    );
  } }