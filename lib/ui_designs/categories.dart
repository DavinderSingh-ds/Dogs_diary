import 'package:dog_app/database/database.dart';
import 'package:dog_app/model/signup_table.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  var _databaseprovider;

  late Future<List<signUpModel>> signUpdetailList;

  void initState() {
    super.initState();
    _databaseprovider = Databaseprovider.instance;
    refreshData();
  }

  refreshData() {
    setState(() {
      getUserData();
    });
  }

  getUserData() {
    setState(() {
      signUpdetailList = _databaseprovider.getAllsignUpdetail();
      print('Data from categoryList $signUpdetailList');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(0xff22453294),
          borderRadius: BorderRadius.circular(10),
        ),
        child: FutureBuilder(
          future: signUpdetailList,
          builder: (BuildContext context,
              AsyncSnapshot<List<signUpModel>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  signUpModel signupmodelli = snapshot.data![index];

                  return Card(
                    child: Column(
                      children: [
                        Text(signupmodelli.userName),
                      ],
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Please Wait.....'),
                    SizedBox(height: 30),
                    CircularProgressIndicator(),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
