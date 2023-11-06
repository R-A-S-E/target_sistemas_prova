import 'package:flutter/material.dart';

class TodoTileWidget extends StatelessWidget {
  const TodoTileWidget({
    super.key,
    required this.title,
    required this.onTapEdit,
    required this.onTapDelete,
  });

  final String title;
  final VoidCallback onTapEdit;
  final VoidCallback onTapDelete;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: onTapEdit,
                  icon: const Icon(
                    Icons.edit,
                    size: 32,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: onTapDelete,
                  icon: const Icon(
                    Icons.cancel,
                    size: 32,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ],
        ),
        const Divider(
          endIndent: 8,
          indent: 8,
          height: 2,
          thickness: 2,
        )
      ],
    );
  }
}
