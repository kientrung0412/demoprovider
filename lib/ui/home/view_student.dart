import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo_provider/api/response/user/data_response.dart';
import 'package:demo_provider/cons/custom_deco.dart';
import 'package:demo_provider/cons/custom_edge.dart';
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
        onTap: () => onClickItem(context),
        child: Container(
          padding: CustomEdge.edgeHorizontal8Vertical12,
          margin: CustomEdge.edgeVertical4,
          decoration: CustomDeco.borderR5BgGreyFF,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                (_index + 1).toString() + ".",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Expanded(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: CustomEdge.edgeHorizontal12,
                    child: CachedNetworkImage(
                      imageUrl: _dataResponse.avatar,
                      height: 64,
                      width: 64,
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
              InkWell(
                onTap: onClickChat,
                child: Container(
                  padding: CustomEdge.edgeLeft8,
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
          onTap: onClickMore,
        ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: onClickDelete,
        ),
      ],
    );
  }

  onClickItem(BuildContext ctx) {
    Navigator.pushNamed(ctx, "hi");
  }

  onClickChat() {}

  onClickDelete() {}

  onClickMore() {}
}
