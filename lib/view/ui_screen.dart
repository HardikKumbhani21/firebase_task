import 'package:flutter/material.dart';

class UIScreen extends StatefulWidget {
  const UIScreen({Key? key}) : super(key: key);

  @override
  State<UIScreen> createState() => _UIScreenState();
}

class _UIScreenState extends State<UIScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  bool selected = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: height * 0.07,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: height * 0.150,
                  width: height * 0.150,
                  decoration: BoxDecoration(
                    color: Colors.teal.shade200,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Image.network(
                        "https://cdn-icons-png.flaticon.com/128/924/924915.png",
                        height: height * 0.1),
                  ),
                ),
                Positioned(right: -220, child: Icon(Icons.close)),
                Positioned(
                    right: -15,
                    top: -10,
                    child: Image.network(
                      "https://cdn-icons-png.flaticon.com/128/8358/8358886.png",
                      height: height * 0.050,
                    )),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              "Anton Jr.",
              style: TextStyle(
                color: Colors.black,
                fontSize: height * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: height * 0.00500,
            ),
            Row(
              children: [
                Text(
                  "Creative director at",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: width * 0.0450,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "@ui8.net",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: width * 0.0450,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.00600,
            ),
            Text(
              "A desiginer that keens Simplicity and usability",
              style: TextStyle(
                color: Colors.grey,
                fontSize: width * 0.0450,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  onPressed: () {},
                  color: Colors.indigo,
                  height: height * 0.070,
                  minWidth: width * 0.03,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Book class  ",
                          style: TextStyle(
                              fontSize: width * 0.0450,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: height * 0.02,
                        child: VerticalDivider(
                          color: Colors.grey,
                          width: 2,
                          thickness: 2,
                        ),
                      ),
                      Text("  \$1,300.00",
                          style: TextStyle(
                            fontSize: width * 0.0450,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      selected = !selected;
                    });
                  },
                  color: selected ? Colors.grey : Colors.indigo,
                  height: height * 0.070,
                  minWidth: width * 0.320,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: selected
                      ? Text("Follow",
                          style: TextStyle(
                            fontSize: width * 0.0450,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ))
                      : Text("Follwing",
                          style: TextStyle(
                              fontSize: width * 0.0450,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            Container(
              height: height * 0.1,
              width: width * 0.5,
              child: TabBar(
                labelStyle: TextStyle(color: Colors.black),
                tabs: [
                  Tab(
                    icon: null,
                    text: "a",
                  ),
                  Tab(
                    icon: null,
                    text: "b",
                  ),
                  Tab(
                    icon: null,
                    text: "c",
                  ),
                  Expanded(
                      child: TabBarView(controller: tabController, children: [
                    Column(
                      children: [
                        Text("trs;i"),
                      ],
                    ),
                    Column(
                      children: [
                        Text("trs;i"),
                      ],
                    ),
                    Column(
                      children: [
                        Text("trs;i"),
                      ],
                    ),
                  ])),
                ],
                controller: tabController,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
