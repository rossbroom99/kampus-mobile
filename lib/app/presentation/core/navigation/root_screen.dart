import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:kampus/app/domain/bloc/core/navigation/nav_bar_items.dart';
import 'package:kampus/app/domain/bloc/core/navigation/navigation_cubit.dart';
import 'package:kampus/app/presentation/features/groups/groups_screen.dart';
import 'package:kampus/app/presentation/features/matching/matching_screen.dart';
import 'package:kampus/app/presentation/features/events/events_screen.dart';
import 'package:kampus/app/presentation/features/messages/messages_screen.dart';
import 'package:kampus/app/presentation/features/profile/profile_screen.dart';

class RootScreen extends StatefulWidget {
  static const String route = "/";

  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF19284d).withOpacity(1),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(35), topLeft: Radius.circular(35)),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BlocBuilder<NavigationCubit, NavigationState>(
              builder: (context, state) {
                return Theme(
                  data: Theme.of(context).copyWith(
                      canvasColor: Colors.transparent,
                      textTheme: Theme.of(context).textTheme),
                  child: BottomNavigationBar(
                    currentIndex: state.index,
                    backgroundColor: Colors.green,
                    fixedColor: Colors.green,
                    showUnselectedLabels: false,
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(
                            IconlyBroken.user_3,
                            color: Colors.white,
                          ),
                          label: "groups"),
                      BottomNavigationBarItem(
                          icon: Icon(
                            IconlyBroken.user_3,
                            color: Colors.white,
                          ),
                          label: ""),
                      BottomNavigationBarItem(
                          icon: Icon(
                            IconlyBroken.user_3,
                            color: Colors.white,
                          ),
                          label: ""),
                      BottomNavigationBarItem(
                          icon: Icon(
                            IconlyBroken.user_3,
                            color: Colors.white,
                          ),
                          label: ""),
                      BottomNavigationBarItem(
                          icon: Icon(
                            IconlyBroken.user_3,
                            color: Colors.white,
                          ),
                          label: ""),
                    ],
                    onTap: (index) {
                      if (index == 0) {
                        BlocProvider.of<NavigationCubit>(context)
                            .getNavBarItem(NavbarItem.groups);
                      } else if (index == 1) {
                        BlocProvider.of<NavigationCubit>(context)
                            .getNavBarItem(NavbarItem.matching);
                      } else if (index == 2) {
                        BlocProvider.of<NavigationCubit>(context)
                            .getNavBarItem(NavbarItem.events);
                      } else if (index == 3) {
                        BlocProvider.of<NavigationCubit>(context)
                            .getNavBarItem(NavbarItem.messages);
                      } else if (index == 4) {
                        BlocProvider.of<NavigationCubit>(context)
                            .getNavBarItem(NavbarItem.profile);
                      }
                    },
                  ),
                );
              },
            ),
          )),
      body: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
        if (state.navbarItem == NavbarItem.groups) {
          return GroupsScreen();
        } else if (state.navbarItem == NavbarItem.matching) {
          return MatchingScreen();
        } else if (state.navbarItem == NavbarItem.events) {
          return EventsScreen();
        } else if (state.navbarItem == NavbarItem.messages) {
          return MessagesScreen();
        } else if (state.navbarItem == NavbarItem.profile) {
          return ProfileScreen();
        }
        return Container();
      }),
    );
  }
}
