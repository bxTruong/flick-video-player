import 'package:flutter/material.dart';

import '../model/feature_model.dart';

class SettingSheet extends StatefulWidget {
  final List<FeatureModel> featureList;

  const SettingSheet({Key? key, this.featureList = const []}) : super(key: key);

  @override
  State<SettingSheet> createState() => _SettingSheetState();
}

class _SettingSheetState extends State<SettingSheet> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 8),
        shrinkWrap: true,
        itemBuilder: _itemBuilder,
        separatorBuilder: _separatorBuilder,
        itemCount: widget.featureList.length);
  }

  Widget _itemBuilder(BuildContext context, int index) => InkWell(
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(widget.featureList[index].icon, color: Colors.black54, size: 24,),
                const SizedBox(width: 12),
                Expanded(
                    child: Text(widget.featureList[index].name,
                        maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.subtitle1,))
              ],
            )),
        onTap: () => widget.featureList[index].onPressFeature.call(),
      );

  Widget _separatorBuilder(BuildContext context, int index) =>
      Container(margin: EdgeInsets.symmetric(horizontal: 16),height: 1, color: Colors.black12);
}
