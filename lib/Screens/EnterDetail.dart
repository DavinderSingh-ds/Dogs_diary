import 'package:dog_app/Database/Database.dart';
import 'package:dog_app/Database/DogsTable.dart';
import 'package:flutter/material.dart';

class EnterDetail extends StatefulWidget {
  EnterDetail({
    Key? key,
    required this.title,
    this.newexpenseModel,
    this.buttonName,
  }) : super(key: key);
  final String title;
  final DogModel? newexpenseModel;
  final String? buttonName;

  @override
  _EnterDetailState createState() => _EnterDetailState();
}

class _EnterDetailState extends State<EnterDetail> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _colorController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  GlobalKey _formKey = GlobalKey();

  final _databaseProvider = Databaseprovider.instance;

  DateTime selectedDate = DateTime.now();
  var pickedDate;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dog Detail'),
      ),
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 20, right: 10, left: 10, bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.blueAccent,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25,
                      bottom: 10,
                    ),
                    child: Text(
                      'ADD DETAIL OF DOG',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Times New Roman',
                        shadows: [
                          Shadow(
                            blurRadius: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _nameController,
                            textInputAction: TextInputAction.next,
                            validator: (s) {
                              if (s!.isEmpty) {
                                return 'Enter the name of dog First';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Dog Name',
                              hintText: 'Enter Name Of Dog',
                              icon: Icon(Icons.pets_rounded),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _colorController,
                            textInputAction: TextInputAction.next,
                            validator: (s) {
                              if (s!.isEmpty) {
                                return 'Enter the dog color First';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Dog Color',
                              hintText: 'Enter Color Of Dog',
                              icon: Icon(Icons.color_lens),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _amountController,
                            textInputAction: TextInputAction.next,
                            validator: (s) {
                              if (s!.isEmpty) {
                                return 'Enter the age of dog First';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Dog Age',
                              hintText: 'Enter the Age of Dog',
                              icon: Icon(Icons.add_reaction),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _descriptionController,
                            textInputAction: TextInputAction.next,
                            validator: (des) {
                              if (des!.isEmpty) {
                                return 'Enter the breed of dog First';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Dog Breed',
                              hintText: 'Enter Breed of Dog',
                              icon: Icon(Icons.whatshot_rounded),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _dateController,
                            textInputAction: TextInputAction.next,
                            validator: (des) {
                              if (des!.isEmpty) {
                                return 'Enter extra description please';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Description',
                              hintText: 'Enter extra info of Dog',
                              icon: Icon(Icons.description),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MaterialButton(
                            color: Colors.blue,
                            child: Text(
                              widget.buttonName != null
                                  ? widget.buttonName!
                                  : 'Save',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              final FormState? formm =
                                  _formKey.currentState as FormState?;
                              if (formm!.validate()) {
                                print(
                                    'Expense is ${_amountController.text.toString()}');
                                final newexpensess = DogModel(
                                  dogAge: _amountController.text.toString(),
                                  dogBreed:
                                      _descriptionController.text.toString(),
                                  dogName: _nameController.text.toString(),
                                  date: _dateController.text.toString(),
                                  dogColor: _colorController.text.toString(),
                                );

                                if (_amountController.text
                                    .toString()
                                    .isNotEmpty) {
                                  var catId = _databaseProvider
                                      .addTransaction(newexpensess);
                                  print('${catId.toString()}');
                                }
                                if (widget.newexpenseModel != null) {
                                  newexpensess.id = widget.newexpenseModel!.id;
                                  _databaseProvider
                                      .updateTransaction(newexpensess);
                                }
                                Navigator.pop(context);
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
