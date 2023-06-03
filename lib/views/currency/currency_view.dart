import 'dart:async';
import 'dart:ffi';

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
  bool isRunning = true;

  static const snackBar = SnackBar(
    content: Text('Yay! A SnackBar!'),
  );
  //late int countTime = 0;

  void insertHistory() {
      setState(() {
        currencyViewModel.writeJsonFile();
        currencyViewModel.counter += 1;
      });
  }

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 60), (Timer timer) {
      if (!isRunning) {
        timer.cancel();
      }
      insertHistory();
    });
    super.initState();
  }

  @override
  void dispose() {
    isRunning = false;
    super.dispose();
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
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Text("${data.chartName}",
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 24)),
                              const Spacer(),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Container(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Text("Last Update : ${data.time.updated} ",
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 16)),
                              const Spacer(),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Container(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: Text("${data.disclaimer} ",
                                    maxLines: 3,
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 14)),
                              ),
                              const Spacer(),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Container(
                          padding: const EdgeInsets.all(5),
                          height: 65,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(
                                    width: 0.0, color: Colors.black),
                              ),
                              color: Colors.white,
                              child: InkWell(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text("${data.bpi.usd.code} : ",
                                        style: const TextStyle(
                                            color: Colors.grey, fontSize: 16)),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                        "${format.format(data.bpi.usd.rateFloat)} ${htmlParser.DocumentFragment.html(data.bpi.usd.symbol).outerHtml}",
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 16)),
                                    const Spacer(),
                                    const SizedBox(
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
                          padding: const EdgeInsets.all(5),
                          height: 65,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(
                                    width: 0.0, color: Colors.black),
                              ),
                              color: Colors.white,
                              child: InkWell(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text("${data.bpi.gbp.code} : ",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 16)),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                        "${format.format(data.bpi.gbp.rateFloat)} ${htmlParser.DocumentFragment.html(data.bpi.gbp.symbol).outerHtml}",
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 16)),
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
                          padding: EdgeInsets.all(5),
                          height: 65,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(
                                    width: 0.0, color: Colors.black),
                              ),
                              color: Colors.white,
                              child: InkWell(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text("${data.bpi.eur.code} : ",
                                        style: const TextStyle(
                                            color: Colors.grey, fontSize: 16)),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                        "${format.format(data.bpi.eur.rateFloat)} ${htmlParser.DocumentFragment.html(data.bpi.eur.symbol).outerHtml}",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 16)),
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
