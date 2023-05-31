import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/api_service.dart';

class CurrencyPage extends StatefulWidget {
  const CurrencyPage({Key? key}) : super(key: key);

  @override
  State<CurrencyPage> createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  @override
  Widget build(BuildContext context) {
    //final overlay = LoadingOverlay.of(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      //appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                    alignment: AlignmentDirectional.center,
                    child: Image(
                        width: 260,
                        alignment: AlignmentDirectional.center,
                        image: AssetImage('assets/images/logo_kontin.png'))),
                SizedBox(
                  height: 55,
                ),
                TextFormField(
                  // controller: userNameController,
                  style: TextStyle(
                    fontFamily: 'Prompt',
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    labelText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    prefixIcon: Icon(Icons.account_circle),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  // controller: passwordController,
                  style: TextStyle(
                    fontFamily: 'Prompt',
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    prefixIcon: Icon(Icons.lock_rounded),
                    suffixIcon: Icon(Icons.remove_red_eye),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        print('Forgotted Password!');
                      },
                      child: Text(
                        'ลืม Password ?',
                        style: TextStyle(
                          fontFamily: 'Prompt',
                          color: Colors.black.withOpacity(0.4),
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: MaterialButton(
                    onPressed: () async {
                      // _timerLoad?.cancel();
                      // EasyLoadingIndicatorType.pulse;
                      // await EasyLoading.show(
                      //   status: 'Loading...',
                      //   maskType: EasyLoadingMaskType.custom,
                      // );

                      // try {
                      //   var result = await ApiService().getLogin(
                      //       userNameController.text, passwordController.text);
                      //   final SharedPreferences prefs = await _prefs;
                      //   if (result.userName != "") {
                      //     await prefs.setString('userId', result.userId);
                      //     await prefs.setInt('companyId', result.companyId);
                      //     await prefs.setString(
                      //         'companyName', result.companyName);
                      //     await prefs.setString('userName', result.userName);
                      //     await prefs.setString('address', result.address);
                      //     await prefs.setString('email', result.email);
                      //     await prefs.setString(
                      //         'imageProfile', result.imageProfile);
                      //     await prefs.setString('tel', result.tel);
                      //     Future.delayed(Duration.zero, () {
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => const NavigationPage()),
                      //       );
                      //     });
                      //   }
                      // } on Exception catch (_) {
                      //   EasyLoading.showError('User or Password In Correct !');
                      // }
                    },
                    // async {
                    //   await overlay
                    //       .during(Future.delayed(const Duration(seconds: 2)));
                    // },
                    color: Colors.blue,
                    child: Text(
                      'เข้าสู่ระบบ',
                      style: TextStyle(
                        fontFamily: 'Prompt',
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
