import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //da Following> app top bar filling
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 245, 235, 235),
        elevation: 0,
        title:
            //following> allign image on right side
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          // following> this is the burgermenu icon
          Icon(
            Icons.menu,
            color: Color.fromARGB(234, 80, 153, 31),
            size: 30,
          ),
          //Following> this is the container for the profile image and the call to the image
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/images/avatar.JPG')),
          )
        ]),
      ),
      body: Container(
        child: const Text('This is home screen'),
      ),
    );
  }
}
