import 'package:flutter/material.dart';
import 'package:jobportal/UI/Screens/Profile/profile_viewmodel.dart';
import 'package:jobportal/UI/custom_widgets/profileTab.dart';
import 'package:jobportal/core/constants/colors.dart';
import 'package:jobportal/core/constants/text_style.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileViewModel(),
      child: Consumer<ProfileViewModel>(
        builder: (context, model, child) => SafeArea(
          child: Scaffold(
            backgroundColor: blueThemeColor,
            body: Padding(
              ///padding: const EdgeInsets.fromLTRB(25,30,25,0),
              padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///profile Text
                  Text(
                    "Profile",
                    style: colorBoldWhiteTextStyle,
                  ),

                  ///user info

                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      ///Image
                      ///ClipRRect which is means that image to clip krta ha,
                      ///this all do for a round image ,
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: FadeInImage.assetNetwork(
                          placeholder: "assets/images/Alamdar.jpg",
                          image: model.authService.userProfile.imageUrl!,
                          width: 55,
                          height: 55,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 26,
                      ),

                      ///Column of the user-name and the Email address
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${model.authService.userProfile.name}",
                            style: userNameTextStyle,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${model.authService.userProfile.email}",
                            style: userNameTextStyle.copyWith(
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                      /*Image(image: NetworkImage(
                  'https://www.facebook.com/photo/?fbid=1449842572025641&set=a.185869548422956&__cft__[0]=AZUGpdbFZrvuo10AEgxn6POAGi4QiqkNUHPr5sy01kVOo0gt5dShE_2lCJsSX3UG3pDhOGX5mbGopujYlOmT8CkklBZyA5aR_NYmxR57LpStIC84I1ALLk0O8XNxPidYT-Je7xUq5C7iKBVIMXNh20WN&__tn__=EH-R',
    
                ),
                height: 69,)*/
                    ],
                  ),
                  const SizedBox(
                    height: 29,
                  ),
                  Expanded(
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 25, right: 20, top: 53),
                      height: 10,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        ///means Where Column is used it's means that it value be in the Center
                        ///so here for log Out button used in the below we used here cross_axis_alignement
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProfileTab(
                              icon: Icons.add_to_home_screen, text: "Home"),
                          const Divider(
                            thickness: 1,
                          ),
                          ProfileTab(
                            icon: Icons.add_location,
                            text: "Manage Address",
                          ),
                          const Divider(
                            thickness: 1,
                          ),

                          ///this is used for a line diveded
                          ProfileTab(
                            icon: Icons.filter_frames,
                            text: "Update Information",
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          ProfileTab(
                            icon: Icons.star_half,
                            text: "Reviews",
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          GestureDetector(
                            onTap: () {
                              model.logout();
                            },
                            child: Text(
                              "Log Out",
                              style: userNameTextStyle.copyWith(
                                  color: blueThemeColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

            /*
          child: Column(
            ///Profile Screen
    
            ///Info
            ///User_Tab's
          ),
    */
          ),
        ),
      ),
    );
  }
}
