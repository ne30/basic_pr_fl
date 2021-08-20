import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'quizPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quiz home",
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var lang = ["C++","C", "Python", "Java", "Dart"];
  var langDescription = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut diam justo, eleifend nec sem ut, vehicula interdum risus. Pellentesque ut neque vitae diam feugiat aliquet. Sed neque lacus, imperdiet a maximus non, pharetra id ligula. Pellentesque molestie interdum metus, quis luctus neque faucibus id. Aenean scelerisque sagittis ex nec porttitor. Fusce bibendum dolor vitae viverra vulputate. Duis quis ex nec nibh efficitur pulvinar sit amet lacinia mi. Pellentesque iaculis pretium porta. Integer ut mi velit. Maecenas ornare commodo hendrerit. Nunc interdum, ante sed efficitur sodales, dolor velit ullamcorper magna, id tempus magna dolor viverra risus. Donec massa dui, facilisis eu varius ut, consectetur a mi. Vivamus gravida cursus arcu at ultrices. In vel rhoncus dui. ",
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut diam justo, eleifend nec sem ut, vehicula interdum risus. Pellentesque ut neque vitae diam feugiat aliquet. Sed neque lacus, imperdiet a maximus non, pharetra id ligula. Pellentesque molestie interdum metus, quis luctus neque faucibus id. Aenean scelerisque sagittis ex nec porttitor. Fusce bibendum dolor vitae viverra vulputate. Duis quis ex nec nibh efficitur pulvinar sit amet lacinia mi. Pellentesque iaculis pretium porta. Integer ut mi velit. Maecenas ornare commodo hendrerit. Nunc interdum, ante sed efficitur sodales, dolor velit ullamcorper magna, id tempus magna dolor viverra risus. Donec massa dui, facilisis eu varius ut, consectetur a mi. Vivamus gravida cursus arcu at ultrices. In vel rhoncus dui. ",
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut diam justo, eleifend nec sem ut, vehicula interdum risus. Pellentesque ut neque vitae diam feugiat aliquet. Sed neque lacus, imperdiet a maximus non, pharetra id ligula. Pellentesque molestie interdum metus, quis luctus neque faucibus id. Aenean scelerisque sagittis ex nec porttitor. Fusce bibendum dolor vitae viverra vulputate. Duis quis ex nec nibh efficitur pulvinar sit amet lacinia mi. Pellentesque iaculis pretium porta. Integer ut mi velit. Maecenas ornare commodo hendrerit. Nunc interdum, ante sed efficitur sodales, dolor velit ullamcorper magna, id tempus magna dolor viverra risus. Donec massa dui, facilisis eu varius ut, consectetur a mi. Vivamus gravida cursus arcu at ultrices. In vel rhoncus dui. ",
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut diam justo, eleifend nec sem ut, vehicula interdum risus. Pellentesque ut neque vitae diam feugiat aliquet. Sed neque lacus, imperdiet a maximus non, pharetra id ligula. Pellentesque molestie interdum metus, quis luctus neque faucibus id. Aenean scelerisque sagittis ex nec porttitor. Fusce bibendum dolor vitae viverra vulputate. Duis quis ex nec nibh efficitur pulvinar sit amet lacinia mi. Pellentesque iaculis pretium porta. Integer ut mi velit. Maecenas ornare commodo hendrerit. Nunc interdum, ante sed efficitur sodales, dolor velit ullamcorper magna, id tempus magna dolor viverra risus. Donec massa dui, facilisis eu varius ut, consectetur a mi. Vivamus gravida cursus arcu at ultrices. In vel rhoncus dui. ",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut diam justo, eleifend nec sem ut, vehicula interdum risus. Pellentesque ut neque vitae diam feugiat aliquet. Sed neque lacus, imperdiet a maximus non, pharetra id ligula. Pellentesque molestie interdum metus, quis luctus neque faucibus id. Aenean scelerisque sagittis ex nec porttitor. Fusce bibendum dolor vitae viverra vulputate. Duis quis ex nec nibh efficitur pulvinar sit amet lacinia mi. Pellentesque iaculis pretium porta. Integer ut mi velit. Maecenas ornare commodo hendrerit. Nunc interdum, ante sed efficitur sodales, dolor velit ullamcorper magna, id tempus magna dolor viverra risus. Donec massa dui, facilisis eu varius ut, consectetur a mi. Vivamus gravida cursus arcu at ultrices. In vel rhoncus dui. "];

  List<Color> boxColors = [Colors.blue, Colors.cyan, Colors.grey ,Colors.blueGrey, Colors.teal];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SingleChildScrollView(
            child: ListView.builder(
                // scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: lang.length,
                itemBuilder: (BuildContext context, int index){
                  return new Container(
                    padding: EdgeInsets.all(30.0),
                    child: InkWell(
                      onTap: (){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => GetJson()));
                      },
                      child: SizedBox(
                        child: DecoratedBox(
                          decoration:   BoxDecoration(
                              color: boxColors[index],
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(18.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  lang[index],
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  langDescription[index],
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.fade,
                                  maxLines: 3,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
            ),
          ),
        ],
      ),
    );
  }
}
