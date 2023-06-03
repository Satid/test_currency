import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workmanager/workmanager.dart';

import '../../models/currency_list_model.dart';
import '../../models/currency_model.dart';
import '../../repositories/currency/currency_api.dart';
import '../../view_models/currency_view_model.dart';

import 'package:html/dom.dart' as htmlParser;

import '../../view_models/calculate_view_model.dart';

class CalculateView extends StatefulWidget {
  const CalculateView({Key? key}) : super(key: key);

  @override
  State<CalculateView> createState() => _CalculateViewState();
}

class _CalculateViewState extends State<CalculateView> {
  var filterViewModel = CalculateViewModel(currencyRepository: CurrencyAPI());

  var _textFieldCurrency = "Select Currency";
  var _textFieldRate = 0.0;
  final _textFieldValue = TextEditingController();
  var _textFieldReturn = 0.0;

  var format = NumberFormat("###,###,##0.000000000000", "en_US");

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _textFieldValue.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(filterViewModel.title),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 4),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    side: BorderSide(width: 1, color: Colors.grey),
                  ),
                  onPressed: () {
                    showCurrencyListBottom();
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 12, bottom: 12),
                    child: Row(children: [
                      Text(
                        _textFieldCurrency,
                        style: TextStyle(
                            fontFamily: 'Prompt',
                            color: Colors.black,
                            fontSize: 16),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey,
                      ),
                    ]),
                  )),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 4),
              child: TextFormField(
                controller: _textFieldValue,
                decoration: InputDecoration(
                  //prefixIcon: Icon(Icons.home_filled),
                  label: Text("Enter Amount",
                      style: TextStyle(color: Colors.grey, fontSize: 16)),
                  contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.all(5),
                  height: 67,
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: const BorderSide(width: 0.0, color: Colors.black),
                      ),
                      //color: Colors.white,
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            SizedBox(
                              width: 16,
                            ),
                            Text("BTC : ",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 16)),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                                "" +
                                    (_textFieldReturn == 0
                                        ? "-"
                                        : format.format(_textFieldReturn)) +
                                    " ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16)),
                            Spacer(),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      )),
                )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 8, right: 8),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    var getFieldValue = _textFieldValue.text.toString();
                    var getFieldRate = _textFieldRate.toString();
                    var getValue = double.parse(getFieldValue) /
                        double.parse(getFieldRate);
                    _textFieldReturn = getValue;
                  });
                },
                color: Colors.blueAccent,
                child: const Text(
                  'Calculate',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showCurrencyListBottom() {
    var size = MediaQuery.of(context).size;
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(width: 0.0, color: Colors.transparent),
              ),
              color: Colors.white,
              margin: EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: size.height - 600,
                    margin:
                        EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 4),
                    child: FutureBuilder<List<CurrencyListModel>>(
                      future: filterViewModel.fetchAllSelect(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<CurrencyListModel> list = snapshot.data!;
                          return ListView.separated(
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              CurrencyListModel currencyListModel = list[index];
                              return ListTile(
                                contentPadding: EdgeInsets.all(0.0),
                                title: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(currencyListModel.code.toString(),
                                            style: TextStyle(
                                                color: Color(0xff2C4F6B),
                                                fontSize: 16)),
                                        Spacer(),
                                        SizedBox(
                                          width: 8,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                  setState(() {
                                    _textFieldCurrency =
                                        currencyListModel.code.toString();
                                    _textFieldRate =
                                        currencyListModel.rateFloat;
                                  });
                                },
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Divider();
                            },
                          );
                        }
                        return Center(
                            child: SizedBox(
                          width: 40,
                          height: 40,
                          child: CircularProgressIndicator(
                            strokeWidth: 4,
                          ),
                        ));
                        // return Container( );
                        // return Container(
                        //   child: Image.asset('assets/images/ic_no_data.png',
                        //       height: 50, width: 50, fit: BoxFit.fitWidth),
                        // );
                      },
                    ),
                  ),
                ],
              ));
        });
  }
}
