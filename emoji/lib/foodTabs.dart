import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FoodTab extends StatefulWidget {
  const FoodTab({Key? key}) : super(key: key);

  @override
  _FoodTabState createState() => _FoodTabState();
}

class _FoodTabState extends State<FoodTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _buildListItem('Pizza', 3.0, '14', 'assets/pizza.png'),
          _buildListItem('Veg Hot Dog', 4.0, '6', 'assets/hotdog.png'),
          _buildListItem('Popcorn', 5.0, '4', 'assets/popcorn.png'),
          _buildListItem('Taco', 2.0, '4', 'assets/taco.png'),
        ],
      ),
    );
  }

  _buildListItem(String food, double rating, String price, String imgPath){
    return Padding(
      padding: EdgeInsets.all(17.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 210.0,
            child: Row(
              children: <Widget>[
                Container(
                  width: 75.0,
                  height: 75.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    color: Color(0xFFFFE3DF)
                  ),
                  child: Center(
                    child: Image.asset(imgPath, height: 50.0, width: 50.0),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      food,
                      style: GoogleFonts.notoSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                      ),
                    ),
                    RatingBar.builder(
                      initialRating: rating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemSize: 14.0,
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    Row(
                      children: <Widget>[
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
                        SizedBox(width: 3.0,),
                        Text(
                          'Ɖ'+ '1' + price,
                          style: GoogleFonts.notoSans(
                            fontSize: 12.0,
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.w600,
                            textStyle: TextStyle(
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          FloatingActionButton(
            onPressed: (){
              //TODO
            },
            heroTag: food,
            mini: true,
            child: Center(
              child: Icon(
                Icons.add,
              ),
            ),
            backgroundColor: Color(0xFFFE7D6A),
          ),
        ],
      )
    );
  }

}
