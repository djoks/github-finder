import 'package:flutter/material.dart';
import 'package:github_finder/models/user.dart';
import 'package:github_finder/widgets/user_list_item.dart';

class UserList extends StatelessWidget {
  final String query;
  final int? recordCount;
  final List<User>? users;

  const UserList(
      {super.key,
      required this.query,
      required this.recordCount,
      required this.users});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
              child: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: [
                    const TextSpan(text: 'Showing '),
                    TextSpan(
                      text: '$recordCount results ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(text: 'of '),
                    TextSpan(
                      text: query,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )),
          if (users != null && users!.isNotEmpty)
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: users?.length,
                itemBuilder: (context, index) {
                  return UserListItem(user: users![index]);
                },
              ),
            )
          else
            const Text('No users to display.'),
        ],
      ),
    );
  }
}
