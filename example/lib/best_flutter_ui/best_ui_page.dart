import 'package:fair/fair.dart';
import 'package:flutter/material.dart';

@FairBinding()
class BestUiPage extends StatelessWidget {
  const BestUiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Best UI Demo'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            '旧版 Best UI 示例已从最小宿主中裁剪，'
            '当前仅保留 Fair 主链路验证能力。',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
