import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo_provider/api/response/user/data_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemUser extends StatelessWidget {
  DataResponse _dataResponse;

  ItemUser(this._dataResponse);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CachedNetworkImage(
          imageUrl: _dataResponse.avatar,
          memCacheHeight: 64,
          memCacheWidth: 64,
        ),
        Expanded(child: child)
      ],
    );
  }
}
