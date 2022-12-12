import 'package:flutter/material.dart';
import 'package:jobportal/UI/custom_widgets/search_app_bar.dart';
import 'package:jobportal/UI/custom_widgets/search_input.dart';
import 'package:jobportal/UI/custom_widgets/search_option.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(flex: 2, child: Container()),
              Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.grey.withOpacity(0.1),
                  )),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SearchAppBar(),
              SearchInput(),
              Searchoption(),

              ///Here i'm Wraping this iteam because there are problem we face on this page

              // Expanded(child: SearchList()),
            ],
          )
        ],
      ),
    );
  }
}
