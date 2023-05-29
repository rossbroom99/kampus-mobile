import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconly/iconly.dart';
import 'package:kampus/app/domain/bloc/core/navigation/nav_bar_items.dart';
import 'package:kampus/app/domain/bloc/core/navigation/navigation_cubit.dart';
import 'package:kampus/app/presentation/features/groups/groups_screen.dart';
import 'package:kampus/app/presentation/features/matching/matching_screen.dart';
import 'package:kampus/app/presentation/features/events/events_screen.dart';
import 'package:kampus/app/presentation/features/messages/messages_screen.dart';
import 'package:kampus/app/presentation/features/profile/profile_screen.dart';
import 'package:kampus/app/presentation/theme.dart';
import 'package:sizer/sizer.dart';

class RootScreen extends StatefulWidget {
  static const String route = "/";

  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {
  int _selectedIndex = NavigationCubit.initialNavItem.index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: bottomNavBackgroundColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(7.w), topRight: Radius.circular(7.w))),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 2.8.h),
            child: BlocConsumer<NavigationCubit, NavigationState>(
              listener: (context, state) {
                setState(() {
                  _selectedIndex = state.index;
                });
              },
              builder: (context, state) {
                return GNav(
                  rippleColor: tabItemPillColor,
                  activeColor: Colors.black,
                  iconSize: 24,
                  padding:
                      EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.3.h),
                  gap: 1.5.w,
                  textSize: 5,
                  textStyle: TextStyle(
                      fontSize: 8.sp,
                      color: mutedTextColor,
                      fontWeight: FontWeight.w600),
                  duration: const Duration(milliseconds: 400),
                  backgroundColor: bottomNavBackgroundColor,
                  tabBackgroundColor: tabItemPillColor,
                  color: Colors.black,
                  tabs: const [
                    GButton(
                      icon: IconlyBroken.user_3,
                      iconColor: mutedTextColor,
                      iconActiveColor: primaryColor,
                      text: 'Groups',
                    ),
                    GButton(
                      icon: IconlyLight.search,
                      iconColor: mutedTextColor,
                      iconActiveColor: primaryColor,
                      text: 'Match',
                    ),
                    GButton(
                      icon: IconlyLight.calendar,
                      iconColor: mutedTextColor,
                      iconActiveColor: primaryColor,
                      text: 'Events',
                    ),
                    GButton(
                      icon: IconlyLight.chat,
                      iconColor: mutedTextColor,
                      iconActiveColor: primaryColor,
                      text: 'Messages',
                    ),
                    GButton(
                      icon: IconlyLight.user,
                      iconColor: mutedTextColor,
                      iconActiveColor: primaryColor,
                      text: 'Profile',
                    ),
                  ],
                  selectedIndex: _selectedIndex,
                  onTabChange: (index) {
                    BlocProvider.of<NavigationCubit>(context)
                        .navBarItemIndexChanged(index);
                  },
                );
              },
            ),
          ),
        ),
      ),
      body: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
        switch (state.navbarItem) {
          case NavbarItem.groups:
            return GroupsScreen();
          case NavbarItem.matching:
            return MatchingScreen();
          case NavbarItem.events:
            return const EventsScreen();
          case NavbarItem.messages:
            return MessagesScreen();
          case NavbarItem.profile:
            return ProfileScreen();
          default:
            return Container();
        }
      }),
    );
  }
}
