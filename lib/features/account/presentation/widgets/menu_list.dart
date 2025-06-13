// Menu List Item Widget
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jumia_clone/features/account/presentation/widgets/section_header.dart';

class MenuListItem extends StatelessWidget {
  final IconData? icon;
  final String title;
  final VoidCallback? onTap;
  final bool showTrailingArrow;

  const MenuListItem({
    super.key,
    this.icon,
    required this.title,
    this.onTap,
    this.showTrailingArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                if (icon != null) ...[
                  Icon(
                    icon,
                    color: Theme.of(context).iconTheme.color,
                    size: Theme.of(context).iconTheme.size,
                  ),
                  const SizedBox(width: 16),
                ],
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: icon == null ? 8 : 0),
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                if (showTrailingArrow)
                  Icon(
                    Icons.chevron_right,
                    color: Theme.of(context).iconTheme.color,
                    size: Theme.of(context).iconTheme.size,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
