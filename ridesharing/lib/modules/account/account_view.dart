import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridesharing/modules/account/page_item.dart';
import 'package:ridesharing/service/app_service.dart';

import '../../utils/ThemeUtils.dart';
import 'account_logic.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final AccountLogic logic = Get.put(AccountLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AccountLogic>(
        builder: (control) => Container(
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  height: 231,
                  padding: const EdgeInsets.only(left: 8),
                  decoration:
                      const BoxDecoration(color: ThemeUtils.defaultColor),
                  child: UserAccountsDrawerHeader(
                    margin: const EdgeInsets.only(bottom: 0, top: 20),
                    decoration: const BoxDecoration(
                      color: null,
                    ),
                    currentAccountPicture: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201508%2F15%2F20150815131712_fEyPM.jpeg&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1626755062&t=19b92e6f33ea5e9e14ced4975211ec90'),
                    ),

                    accountEmail: Text("email:${Get.find<AppService>().email.value}"), accountName: Obx(()=> Text("name:${Get.find<AppService>().name.value}")),
                  )),
              Expanded(child: MePageItem())
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<AccountLogic>();
    super.dispose();
  }
}
