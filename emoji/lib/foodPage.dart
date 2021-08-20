import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodPage extends StatefulWidget {
  final imgPath, food, price, heroTag;

  FoodPage({this.imgPath, this.food, this.price, this.heroTag});

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  var finalPrice = 0.0;
  var quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(17.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.menu,
                  color: Colors.black87,
                ),
                Stack(
                  children: [
                    Container(
                      height: 45.0,
                      width: 45.0,
                      color: Colors.transparent,
                    ),
                    Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFFE7D6A).withOpacity(0.3),
                            blurRadius: 6.0,
                            spreadRadius: 4.0,
                            offset: Offset(0.0, 4.0),
                          ),
                        ],
                        color: Color(0xFFFE7D6A),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        )
                      ),
                    ),
                    Positioned(
                      top: 1.0,
                      right: 4.0,
                      child: Container(
                        height: 12.0,
                        width: 12.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text('1',
                            style: GoogleFonts.notoSans(
                              fontSize: 7.0,
                              textStyle: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),
                          //count item
                          //TODO
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left:17.0),
            child: Text(
              widget.food.toString().toUpperCase(),
              style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w800,
                fontSize: 28.0,
              ),
            ),
          ),
          SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Hero(
                tag: widget.heroTag,
                child: Container(
                  height: 200.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.imgPath),
                      fit: BoxFit.cover
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15.0,),
              Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 45.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFFE7D56A).withOpacity(0.1),
                              blurRadius: 6.0,
                              spreadRadius: 6.0,
                              // offset x and y component
                              offset: Offset(5.0, 11.0),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.favorite_border_sharp,
                            color: Color(0xFFFE7D6A),
                            size: 25.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height:25.0),
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 45.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFFE7D56A).withOpacity(0.1),
                              blurRadius: 6.0,
                              spreadRadius: 6.0,
                              // offset x and y component
                              offset: Offset(5.0, 11.0),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.share_sharp,
                            color: Color(0xFFFE7D6A),
                            size: 25.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 70.0,
                width: 125.0,
                color: Colors.white38,
                child: Center(
                  child: Text(
                    'Ɖ' + (int.parse(widget.price)*quantity).toString(),
                    style: GoogleFonts.notoSans(
                      fontSize: 38.0,
                      color: Color(0xFF5E6166),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Container(
                height: 60.0,
                width: 225.0,
                decoration: BoxDecoration(
                  color: Color(0xFFFE7D6A),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                  ),
                ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 40.0,
                        width: 112.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        child: Row(
                         children: <Widget>[
                           IconButton(
                             onPressed: (){
                               setState(() {
                                 if(quantity==1){
                                   quantity = 1;
                                 }else {
                                   quantity = quantity - 1;
                                 }
                               });
                             },
                             iconSize: 17.0,
                             icon: Icon(
                                 Icons.remove,
                                 color: Color(0xFFFE7D6A),
                               ),
                           ),
                           Text(
                             quantity.toString(),
                             style: GoogleFonts.notoSans(
                               fontSize: 14.0,
                               color: Color(0xFFFE7D6A),
                               fontWeight: FontWeight.w400,
                             ),
                           ),
                           IconButton(
                             onPressed: (){
                               setState(() {
                                 quantity = quantity + 1;
                               });
                             },
                             iconSize: 17.0,
                             icon: Icon(
                               Icons.add,
                               color: Color(0xFFFE7D6A),
                             ),
                           ),
                         ],
                       ),
                     ),
                      InkWell(
                        onTap: (){
                          //TODO
                        },
                        child: Text(
                          "Add to Cart",
                          style: GoogleFonts.notoSans(
                            fontSize: 15.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                   ],
                 ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(17.0),
            child: Text(
              'Featured',
              style: GoogleFonts.notoSans(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            height: 225.0,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _buildListItem('1'),
                _buildListItem('2'),
              ],
            )
          ),
        ],
      ),
    );
  }

  _buildListItem(String colNumber){
    return Padding(
      padding: EdgeInsets.all(17.0),
      child: Column(
        children: <Widget>[
            _buildColumnItem('assets/sandwich.png', 'Sandwich', '6', Color(0xFFD7FADA)),
        ],
      ),
    );
  }

  _buildColumnItem(String imgPath, String food, String price, Color bgColor){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: 210.0,
          child: Row(
            children: <Widget>[
              Container(
                height: 75.0,
                width: 75.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  color: bgColor,
                ),
                child: Center(
                  child: Image.asset(imgPath, height: 50.0, width: 50.0),
                )
              ),
              SizedBox(width: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    food,
                    style: GoogleFonts.notoSans(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'Ɖ'+price,
                    style: GoogleFonts.notoSans(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      textStyle: TextStyle(
                        color: Color(0xFFF68D7F),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

}
