import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';


class HomeScreenHeader extends StatefulWidget {
  @override
  _HomeScreenHeaderState createState() => _HomeScreenHeaderState();
}

class _HomeScreenHeaderState extends State<HomeScreenHeader> {

  bool menuOpen = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 15,right: 15, bottom: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [


          Container(
            width: 80,
            height: 50,
            // color: Colors.red,
            child: GestureDetector(
              child: FlareActor(
                'assets/flare/menu.flr',
                fit: BoxFit.cover,
                // snapToEnd: true,
                animation: menuOpen ? 'open': 'close',
              ),
              onTap: (){
                setState(() {
                  menuOpen = !menuOpen;
                });
              },
            ),
          ),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Text("Location"),
          //     Row(
          //       children: [
          //         IconButton(
          //           icon: Icon(Icons.location_on, color: kPrimaryColor),
          //         ),
          //         SizedBox(
          //           width: 145.0,
          //           child: Text(
          //             "Egypt, Cairo, RedSea Gov",
          //             overflow: TextOverflow.ellipsis,
          //           ),
          //         ),
          //       ],
          //     ),
          //
          //   ],
          // ),
          CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text(
                'MA',
                style: TextStyle(color: Colors.white),
              )
          ),
        ],

      ),
    );
  }
}
