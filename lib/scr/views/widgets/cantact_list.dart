import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_marketing/scr/bloc/personal_info_bloc.dart';
import '../pages/login.dart';
import '/scr/models/personal_information.dart';
import '/scr/views/pages/details_of_item.dart';

class PersonalInfoTile extends StatefulWidget {
  final PersonalInfoItem infoItem;

  const PersonalInfoTile({Key? key, required this.infoItem}) : super(key: key);

  @override
  PersonalInfoTileState createState() => PersonalInfoTileState();
}

class PersonalInfoTileState extends State<PersonalInfoTile> {
  bool _isDone = false;

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<PersonalInfoBloc>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 227, 227, 227), width: 2),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailsItemPage(item: widget.infoItem)),
            ).then((_) => bloc.loadPersonalInfoItems());
          },
          child: Padding(
            padding:const EdgeInsets.symmetric(vertical: 4, horizontal: 18),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.infoItem.name,
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                '${widget.infoItem.companyName}   ${widget.infoItem.post}',
                                style: const TextStyle(fontSize: 14),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding:const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.notifications, color: Colors.white, size: 20),
                              const SizedBox(width: 4),
                              Text(
                                widget.infoItem.notificationTag,
                                style:const TextStyle(color: Colors.white, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                  Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: _isDone ? const Color.fromARGB(255, 245, 255, 245) : const Color.fromARGB(255, 246, 246, 246),
                        border: Border.all(color: _isDone ? Colors.green : Colors.grey, width: 1.4),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.done, color: _isDone ? Colors.green : Colors.grey),
                        onPressed: () {
                          setState(() {
                            _isDone = !_isDone;
                          });
                        },
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          const Icon(Icons.event_note,
              size: 30, color: Colors.black), // アイコンを追加
          const SizedBox(width: 8.0), // アイコンとテキストの間にスペースを追加
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class ToDebugPage extends StatelessWidget {
  const ToDebugPage({super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginPage()));
        },
        child: const Text('*debug* tap this to login page',
            style: TextStyle(color: Colors.red, fontSize: 20)));
  }
}
