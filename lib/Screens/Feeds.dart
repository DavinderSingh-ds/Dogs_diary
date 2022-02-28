import 'package:flutter/material.dart';
import 'package:flutter_slimy_card/flutter_slimy_card.dart';

class Feeds extends StatefulWidget {
  const Feeds({Key? key}) : super(key: key);

  @override
  _FeedsState createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            color: Colors.amber,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 7,
                right: 7,
                top: 5,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(6),
                  ),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                FlutterSlimyCard(
                                  topCardHeight: 160,
                                  bottomCardHeight: 120,
                                  cardWidth: 180,
                                  topCardWidget: topWidget(),
                                  bottomCardWidget: bottomWidget(),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                FlutterSlimyCard(
                                  topCardHeight: 160,
                                  bottomCardHeight: 120,
                                  cardWidth: 180,
                                  topCardWidget: topWidget(),
                                  bottomCardWidget: bottomWidget(),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            FlutterSlimyCard(
                              topCardHeight: 160,
                              bottomCardHeight: 120,
                              cardWidth: 180,
                              topCardWidget: topWidget(),
                              bottomCardWidget: bottomWidget(),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FlutterSlimyCard(
                              topCardHeight: 160,
                              bottomCardHeight: 120,
                              cardWidth: 180,
                              topCardWidget: topWidget(),
                              bottomCardWidget: bottomWidget(),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FlutterSlimyCard(
                              topCardHeight: 160,
                              bottomCardHeight: 120,
                              cardWidth: 180,
                              topCardWidget: topWidget(),
                              bottomCardWidget: bottomWidget(),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FlutterSlimyCard(
                              topCardHeight: 160,
                              bottomCardHeight: 120,
                              cardWidth: 180,
                              topCardWidget: topWidget(),
                              bottomCardWidget: bottomWidget(),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

topWidget() {
  return Container(
    child: SafeArea(
      child: Column(
        children: [
          Container(
              height: 75, child: Image(image: AssetImage('images/dogu.jpg'))),
          SizedBox(
            height: 5,
          ),
          Text(
            'A Dog',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    ),
  );
}

bottomWidget() {
  return Container(
    margin: EdgeInsets.only(top: 5),
    child: Column(
      children: [
        SizedBox(height: 10),
        Flexible(
            child: Text(
          'A Dog is an animal which people can used to Time Pass. Some Dogs are used for Work. Say Hello to a Funny Dog',
          style: TextStyle(color: Colors.white),
        ))
      ],
    ),
  );
}
