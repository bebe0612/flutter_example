import 'package:flutter/material.dart';
import 'package:reactive_dashboard_app/core/settings/responsive.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
        Text(
          "베베소프트",
          style: Theme.of(context).textTheme.headline6,
        ),
        if (!Responsive.isMobile(context)) Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        // Expanded(child: SearchField()),
        ProfileCard(),
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.0),
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 16.0 / 2,
      ),
      decoration: BoxDecoration(
        color: Colors.pink,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Container(
            width: 20,
            color: Colors.pinkAccent,
          ),
          if (!Responsive.isMobile(context))
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0 / 2),
              child: Text("Angelina Joli"),
            ),
          Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}

// class SearchField extends StatelessWidget {
//   const SearchField({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       decoration: InputDecoration(
//         hintText: "Search",
//         fillColor: secondaryColor,
//         filled: true,
//         border: OutlineInputBorder(
//           borderSide: BorderSide.none,
//           borderRadius: const BorderRadius.all(Radius.circular(10)),
//         ),
//         suffixIcon: InkWell(
//           onTap: () {},
//           child: Container(
//             padding: EdgeInsets.all(defaultPadding * 0.75),
//             margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
//             decoration: BoxDecoration(
//               color: primaryColor,
//               borderRadius: const BorderRadius.all(Radius.circular(10)),
//             ),
//             child: SvgPicture.asset("assets/icons/Search.svg"),
//           ),
//         ),
//       ),
//     );
//   }
// }
