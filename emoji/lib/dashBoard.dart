import 'package:emoji/foodTabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'foodPage.dart';


class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> with SingleTickerProviderStateMixin{

  late TabController tabController;

  @override
  void initState(){
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }

  @override
  _buildListItem(String food, String imgPath,  String price, Color bgColor, Color txtColor) {
    return Padding(
      padding: EdgeInsets.only(left: 17.0),
      child: InkWell(
          onTap: () {
            //todo
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => FoodPage(heroTag: food, food: food, imgPath: imgPath, price: price)
            ));
          },
          child: Container(
            height: 175.0,
            width: 150.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: bgColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: food,
                  child: Container(
                    height: 75.0,
                    width: 75.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Image.asset(imgPath, height: 50.0, width: 50.0),
                    ),
                  ),
                ),
                SizedBox(height: 25.0),
                Text(
                  food,
                  style: GoogleFonts.notoSans(
                    fontSize: 17.0,
                    color: txtColor,
                  ),
                ),
                Text(
                  'Ɖ'+price,
                  style: GoogleFonts.notoSans(
                    fontSize: 17.0,
                    color: txtColor,
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.menu,
                  color: Colors.black87,
                ),
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius:  6.0,
                        spreadRadius: 4.0,
                        offset: Offset(0.0, 3.0)
                      )
                    ],
                    color: Color(0xFFC6E7FE),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/tuxedo.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            )
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              'SEARCH THE',
              style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w800,
                fontSize: 24.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              'FOODS',
              style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w800,
                fontSize: 24.0,
              ),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0,right: 16.0),
            child: Container(
              padding: EdgeInsets.only(left: 6.0),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: GoogleFonts.notoSans(
                    fontSize: 12.0,
                  ),
                  border: InputBorder.none,
                  fillColor: Colors.grey.withOpacity(0.6),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: EdgeInsets.only(left:18.0),
            child: Text(
              'Recommended',
              style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _buildListItem('Burger', 'assets/burger.png', '11', Color(0xFFFFE9C6), Color(0xFFDA9551)),
                _buildListItem('Donuts', 'assets/doughnut.png', '10', Color(0xFFD7FADA), Color(0xFF56CC7E)),
                _buildListItem('Fries', 'assets/fries.png', '8', Color(0xFFC2E3FE), Color(0xFF6A8CAA)),
              ],
            ),
          ),
          SizedBox(height: 10.0,),
          Padding(
            padding: EdgeInsets.only(left: 17.0),
            child: TabBar(
              controller: tabController,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black87,
              unselectedLabelColor: Colors.grey.withOpacity(0.2),
              labelStyle: GoogleFonts.notoSans(
                fontSize: 15.0,
                fontWeight: FontWeight.w700,
              ),
              unselectedLabelStyle: GoogleFonts.notoSans(
                fontSize: 13.0,
                fontWeight: FontWeight.w500,
              ),
              tabs: [
                Tab(
                  child: Text("Featured"),
                ),
                Tab(
                  child: Text("Favourites"),
                ),
                Tab(
                  child: Text("Combo"),
                ),
                Tab(
                  child: Text("Specials"),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 450.0,
            child: TabBarView(
              controller: tabController,
              children: [
                FoodTab(),
                FoodTab(),
                FoodTab(),
                FoodTab(),
              ],
            ),
          ),
        ],
      ),
    );

  }
}
