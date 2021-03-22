import 'package:currency_convertor_app/model/CardModel.dart';
import 'package:currency_convertor_app/model/RecentTransactionModel.dart';
import 'package:currency_convertor_app/ui/ConvertCurrencyPage.dart';
import 'package:currency_convertor_app/utils/ImagePaths.dart';
import 'package:currency_convertor_app/utils/Strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height / 3;
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      _height = MediaQuery.of(context).size.height / 3.2;
    } else {
      _height = 250.0;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          Strings.DASHBOARD,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              child: CircleAvatar(
                radius: 20,
                backgroundImage: ExactAssetImage(ImagePaths.ALVIN),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.blue,
                  width: 2.0,
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: _height,
                  child: PageView(
                    controller: _controller,
                    children: [
                      _page(CardModel(
                          name: "Alvin", cardNumber: "**** **** **** 1234")),
                      _page(CardModel(
                          name: "Gold", cardNumber: "**** **** **** 1234")),
                      _page(CardModel(
                          name: "Asic", cardNumber: "**** **** **** 1234")),
                    ],
                  ),
                ),
                SmoothPageIndicator(
                    controller: _controller,
                    // PageController
                    count: 3,
                    effect: WormEffect(
                        spacing: 5,
                        dotHeight: 10,
                        dotWidth: 10,
                        dotColor: Colors.grey,
                        activeDotColor: Colors.blue),
                    // your preferred effect
                    onDotClicked: (index) => _controller.animateToPage(index,
                        duration: Duration(seconds: 1),
                        curve: Curves.fastOutSlowIn)),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              Strings.BALANCE,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              Strings.CURRENCY,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "14,324.23",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              Strings.USD,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          Strings.ACTIONS,
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Button(
                              name: Strings.TRANSFER,
                              onPressed: () {},
                            ),
                          ),
                          Expanded(
                            child: Button(
                              name: Strings.CONVERT,
                              onPressed: () {
                                setState(() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ConvertCurrencyPage()),
                                  );
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: Button(
                              name: Strings.PAY_BILLS,
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          Strings.RECENT_TRANSACTIONS,
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        height: 200,
                        margin: EdgeInsets.only(bottom: 10),
                        child: ListView.builder(
                          itemCount: _listOfRecentTransactionModel().length,
                          itemBuilder: (context, index) =>
                              _recentTransactionItem(
                                  _listOfRecentTransactionModel()[index]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _page(CardModel model) {
    return Card(
      margin: const EdgeInsets.all(20),
      elevation: 10,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      ImagePaths.FLOWER,
                      height: 80,
                      width: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Image(
                        image: AssetImage(ImagePaths.CARD),
                        height: 30,
                        width: 30,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      model.name,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Image(
                        image: AssetImage(ImagePaths.MASTER_CARD),
                        height: 20,
                        width: 20,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  model.cardNumber,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _recentTransactionItem(RecentTransactionModel model) {
    var startTwoLetter = model.name.toString().substring(0, 2).toUpperCase();

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    color: model.bgcolor,
                    borderRadius: BorderRadius.all(Radius.circular(2))),
                child: Center(
                  child: Text(
                    startTwoLetter,
                    style: TextStyle(
                        color: model.txtcolor, fontWeight: FontWeight.bold),
                  ),
                )),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(
                model.name,
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Text(
            model.amount,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  List<RecentTransactionModel> _listOfRecentTransactionModel() {
    return [
      RecentTransactionModel(
          name: "Payment",
          amount: "12345.55",
          txtcolor: Colors.white,
          bgcolor: Colors.lightBlue),
      RecentTransactionModel(
          name: "Payment",
          amount: "12345.55",
          txtcolor: Colors.orange,
          bgcolor: Colors.orange[300]),
      RecentTransactionModel(
          name: "Payment",
          amount: "12345.55",
          txtcolor: Colors.green,
          bgcolor: Colors.lightGreenAccent),
      RecentTransactionModel(
          name: "Payment",
          amount: "12345.55",
          txtcolor: Colors.white,
          bgcolor: Colors.lightBlue),
      RecentTransactionModel(
          name: "Payment",
          amount: "12345.55",
          txtcolor: Colors.orange,
          bgcolor: Colors.orange[300]),
      RecentTransactionModel(
          name: "Payment",
          amount: "12345.55",
          txtcolor: Colors.green,
          bgcolor: Colors.lightGreenAccent),
      RecentTransactionModel(
          name: "Payment",
          amount: "12345.55",
          txtcolor: Colors.white,
          bgcolor: Colors.lightBlue),
      RecentTransactionModel(
          name: "Payment",
          amount: "12345.55",
          txtcolor: Colors.orange,
          bgcolor: Colors.orange[300]),
      RecentTransactionModel(
          name: "Payment",
          amount: "12345.55",
          txtcolor: Colors.green,
          bgcolor: Colors.lightGreenAccent),
      RecentTransactionModel(
          name: "Payment",
          amount: "12345.55",
          txtcolor: Colors.white,
          bgcolor: Colors.lightBlue),
      RecentTransactionModel(
          name: "Payment",
          amount: "12345.55",
          txtcolor: Colors.orange,
          bgcolor: Colors.orange[300]),
      RecentTransactionModel(
          name: "Payment",
          amount: "12345.55",
          txtcolor: Colors.green,
          bgcolor: Colors.lightGreenAccent)
    ];
  }
}

class Button extends StatelessWidget {
  var name;
  GestureTapCallback onPressed;

  Button({required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        onPressed: onPressed,
        elevation: 0,
        child: Text(
          name,
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        color: Colors.lightBlue[50],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
