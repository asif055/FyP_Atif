import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobportal/UI/Screens/Home/home_viewmodel.dart';
import 'package:jobportal/UI/Screens/Job/job_post_screen.dart';
import 'package:jobportal/UI/custom_widgets/home__app_bar.dart';
import 'package:jobportal/UI/custom_widgets/job_list.dart';
import 'package:jobportal/UI/custom_widgets/search_card.dart';
import 'package:jobportal/UI/custom_widgets/tag_list.dart';
import 'package:jobportal/UI/custom_widgets/will_pop_scope.dart';
import 'package:provider/provider.dart';

class HomeScreenAplicant extends StatelessWidget {
  const HomeScreenAplicant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, model, child) => WillPopScope(
          onWillPop: () async {
            final status = await Get.dialog(
              const WillPopScopeDialog(),
            );

            /// In case user has chosen not to be kept logged in,
            /// he will get logged out of the app on exit.
            // if (status && !locator<AuthService>().isRememberMe) {
            //   await locator<AuthService>().logout();
            // }
            return status;
          },
          child: Scaffold(
            body: Stack(
              children: [
                Row(
                  children: [
                    Expanded(flex: 2, child: Container()),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.grey.withOpacity(0.1),
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeAppBar(userName: model.authService.userProfile.name!),
                      const SearchCard(),
                      TagList(),
                      model.loading
                          ? const CircularProgressIndicator.adaptive()
                          : JobList(),
                    ],
                  ),
                ),
              ],
            ),

            ///this is the location of the button which we place there
            // floatingActionButtonLocation:
            //     FloatingActionButtonLocation.centerDocked,

            ///this is the for the yellow plus button which show in the bottom of the nvigation bar\
            floatingActionButton:
                model.authService.userProfile.isInstitution ?? false
                    ? FloatingActionButton(
                        backgroundColor: Theme.of(context).accentColor,
                        elevation: 0,
                        onPressed: () {
                          Get.to(() => JobPostScreen());
                        },
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      )
                    : null,

            ///here we are doing the navigation works means which all the thing
            ///which are include in the navigation bar..

            bottomNavigationBar: Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: Theme.of(context).primaryColor,
                type: BottomNavigationBarType.fixed,
                items: const [
                  BottomNavigationBarItem(
                    label: 'Home',
                    icon: Icon(
                      Icons.home,
                      size: 20,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'Case',
                    icon: Icon(
                      Icons.cases_outlined,
                      size: 20,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'Chat',
                    icon: Icon(
                      Icons.chat_outlined,
                      size: 20,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'person',
                    icon: Icon(
                      Icons.person_outlined,
                      size: 20,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
