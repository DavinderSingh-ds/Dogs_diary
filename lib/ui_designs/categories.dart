import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 200,
          width: 330,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/dog5.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'For More Info.',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Times New Roman',
            fontSize: 25.0,
            shadows: [
              Shadow(
                blurRadius: 1,
                offset: Offset(1, 1),
                color: Colors.blue,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Contact Us',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Times New Roman',
            fontSize: 15.0,
          ),
        ),
        Text(
          'Email : davindersingh00743@gmail.com',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Times New Roman',
            fontSize: 15.0,
          ),
        ),
      ],
    );
  }
}
