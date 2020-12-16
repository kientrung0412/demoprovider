import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo_provider/api/response/user/data_response.dart';
import 'package:demo_provider/cons/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemUser extends StatelessWidget {
  final DataResponse _dataResponse;
  final int _index;

  ItemUser(this._dataResponse, this._index);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: InkWell(
        onTap: onClickItem,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          margin: EdgeInsets.symmetric(vertical: 4),
          decoration: new BoxDecoration(
              color: grey,
              borderRadius: BorderRadiusDirectional.all(Radius.circular(5))),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                (_index + 1).toString() + ".",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Expanded(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    child: CachedNetworkImage(
                      imageUrl: _dataResponse.avatar,
                      memCacheHeight: 64,
                      memCacheWidth: 64,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: "Học sinh: ",
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                    text:
                                        '${_dataResponse.firstName + " " + _dataResponse.lastName}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ]),
                        ),
                        RichText(
                          text: TextSpan(
                              text: "Mã học sinh: ",
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                    text: '${_dataResponse.id}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ]),
                        ),
                        RichText(
                          text: TextSpan(
                            text: "Email: " + _dataResponse.email,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
              Container(
                margin: EdgeInsets.only(left: 8),
                child: InkWell(
                  onTap: onClickChat,
                  child: Icon(
                    Icons.message_rounded,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      secondaryActions: [
        IconSlideAction(
          caption: 'More',
          color: Colors.black45,
          icon: Icons.more_horiz,
          onTap: onClickMore(),
        ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: onClickDelete(),
        ),
      ],
    );
  }

  onClickItem() {}

  onClickChat() {}

  onClickDelete() {}

  onClickMore() {}
}
