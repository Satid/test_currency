import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workmanager/workmanager.dart';

import '../../models/currency_model.dart';
import '../../repositories/currency/currency_api.dart';
import '../../view_models/currency_view_model.dart';

import 'package:html/dom.dart' as htmlParser;

class CurrencyView extends StatefulWidget {
  const CurrencyView({Key? key}) : super(key: key);

  @override
  State<CurrencyView> createState() => _CurrencyViewState();
}

class _CurrencyViewState extends State<CurrencyView> {
  var currencyViewModel = CurrencyViewModel(currencyRepository: CurrencyAPI());
  static const snackBar = SnackBar(
    content: Text('Yay! A SnackBar!'),
  );

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @pragma('vm:entry-point')
  void callbackDispatcher() {
    Workmanager().executeTask((task, inputData) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return Future.value(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currencyViewModel.title),
      ),
      body: Center(
        child: FutureBuilder<CurrencyModel>(
          future: currencyViewModel.fetchAll(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              var data = snapshot.data;
              var format = NumberFormat("###,###,###.000", "en_US");
              if (data != null) {
                //return  Text(posts.chartName.toString());
                return Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Container(
                          padding: const EdgeInsets.all(8),
                          height: 80,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(
                                    width: 0.0, color: Colors.grey),
                              ),
                              color: Colors.white,
                              child: InkWell(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(data.bpi.usd.code.toString() + " : ",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 16)),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                        "" +
                                            format.format(
                                                data.bpi.usd.rateFloat) +
                                            " " +
                                            htmlParser.DocumentFragment.html(
                                                    data.bpi.usd.symbol)
                                                .outerHtml,
                                        style: TextStyle(
                                            fontFamily: 'Prompt',
                                            color: Colors.grey,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.all(8),
                          height: 80,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(
                                    width: 0.0, color: Colors.grey),
                              ),
                              color: Colors.white,
                              child: InkWell(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(data.bpi.gbp.code.toString() + " : ",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 16)),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                        "" +
                                            format.format(
                                                data.bpi.gbp.rateFloat) +
                                            " " +
                                            htmlParser.DocumentFragment.html(
                                                    data.bpi.gbp.symbol)
                                                .outerHtml,
                                        style: TextStyle(
                                            fontFamily: 'Prompt',
                                            color: Colors.grey,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.all(8),
                          height: 80,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(
                                    width: 0.0, color: Colors.grey),
                              ),
                              color: Colors.white,
                              child: InkWell(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(data.bpi.eur.code.toString() + " : ",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 16)),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                        "" +
                                            format.format(
                                                data.bpi.eur.rateFloat) +
                                            " " +
                                            htmlParser.DocumentFragment.html(
                                                    data.bpi.eur.symbol)
                                                .outerHtml,
                                        style: TextStyle(
                                            fontFamily: 'Prompt',
                                            color: Colors.grey,
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
                  ],
                );
                //return Container();
              }
              return const Text("");
            }
          },
        ),
      ),
    );
  }
}
