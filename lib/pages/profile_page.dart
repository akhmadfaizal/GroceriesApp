import 'package:flutter/material.dart';
import 'package:groceries_app/constants/constants.dart';
import 'package:groceries_app/data/profile_api.dart';
import 'package:groceries_app/data/profile_model.dart';
import 'package:groceries_app/widgets/card_widgets.dart';
import 'package:groceries_app/widgets/image_widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<DataProfile> dataProfile;
  @override
  void initState() {
    super.initState();
    ProfileApi profileApi = ProfileApi();
    dataProfile = profileApi.fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: greenColor,
          title: Text(
            "Profile",
          ),
        ),
        body: FutureBuilder<DataProfile?>(
            future: dataProfile,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Container(
                      height: 150.0,
                      width: MediaQuery.of(context).size.width,
                      color: borderColorSecond.withOpacity(0.7),
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            bottom: -60,
                            child: Column(
                              children: [
                                imageProfile(
                                    img: snapshot
                                        .data!.results![0].picture!.medium!,
                                    radius: 60),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  '${snapshot.data!.results![0].name!.title} ${snapshot.data!.results![0].name!.first} ${snapshot.data!.results![0].name!.last}',
                                  style: titleStyleCard,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 120,
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: profilePadding,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(borderRadiusProfileEdge),
                            topRight: Radius.circular(borderRadiusProfileEdge),
                          ),
                          color: borderColorSecond.withOpacity(0.7),
                        ),
                        child: ListView(
                          children: [
                            customCardProfile(
                              text:
                                  '${snapshot.data!.results![0].login!.username}',
                              icon: FaIcon(
                                FontAwesomeIcons.idCard,
                              ),
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            customCardProfile(
                              text: '${snapshot.data!.results![0].email}',
                              icon: FaIcon(FontAwesomeIcons.envelope),
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            customCardProfile(
                              text: '${snapshot.data!.results![0].phone}',
                              icon: FaIcon(FontAwesomeIcons.phone),
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            customCardProfile(
                              text:
                                  '${snapshot.data!.results![0].location!.street!.name} ${snapshot.data!.results![0].location!.street!.number}',
                              icon: FaIcon(FontAwesomeIcons.addressBook),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const Center(
                  child: CircularProgressIndicator(
                color: greenColor,
              ));
            }));
  }
}
