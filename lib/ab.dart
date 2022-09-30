import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4FC3F7),
        elevation: 0,
        toolbarHeight: 80, // default is 56
        // toolbarOpacity: 0.5,
        leading: Icon(
          Icons.location_on,
          size: 20,
        ),
        leadingWidth: 90,
        title: Text('Los Angeles'),
        centerTitle: true,
        actions: [
          Icon(Icons.menu),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
          )
        ],
      ),
      backgroundColor: Color(0xFF4FC3F7),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Center(
                child: Image(
                  image: AssetImage(
                    "images/a.png",
                  ),
                  fit: BoxFit.contain,
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Text(
              " 33°",
              style: TextStyle(color: Colors.white, fontSize: 50),
            ),
            // SizedBox(
            //   height: 8,
            // ),
            Text(
              "Sunny",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 40,
            ),

            // Container(
            //   height: 50,
            //   width: 350,
            //   color: Colors.red,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Today",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    )),
                Padding(padding: EdgeInsets.only(left: 150)),
                Text(
                  "33°/25°",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Wednesday",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    )),
                Padding(padding: EdgeInsets.only(left: 100)),
                Text(
                  "33°/25°",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Thursday",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    )),
                Padding(padding: EdgeInsets.only(left: 123)),
                Text(
                  "33°/25°",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),

            Container(
              padding: EdgeInsets.only(right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "more",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.white,
                  ),
                ],
              ),
            )

            // ),
          ],
        ),
      ),
    );
  }
}
