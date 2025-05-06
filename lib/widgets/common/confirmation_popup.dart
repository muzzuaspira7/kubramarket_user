import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kubramarket_user/core/constants/colors.dart';
import 'package:kubramarket_user/widgets/common/apptext_widget.dart';
import 'package:kubramarket_user/widgets/common/button_widget.dart';

class ReusableConfirmDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final String confirmText;
  final String cancelText;

  const ReusableConfirmDialog({
    required this.title,
    required this.message,
    required this.onConfirm,
    required this.onCancel,
    this.confirmText = "Remove",
    this.cancelText = "Cancel",
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
              child: Row(
                children: [
                  Expanded(
                    child: AppText(text: title, color: AppColor.white, fontSize: 16.sp, fontWeight: FontWeight.w400,)
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: 
                    Container(
                      decoration: BoxDecoration(
                      color: AppColor.primary,

                        border: Border.all(color: AppColor.white, width: 1.3),
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Icon(Icons.close, color: Colors.white, size: 18.sp,),
                      )),
                  
                  ),
                ],
              ),
            ),
          ),
          // Message
          Padding(
            padding: EdgeInsets.only(top: 35.h, left: 35.w, right: 35.w), 
            child: 
          
            AppText(text: message, fontSize: 16.sp, fontWeight: FontWeight.w400, 
            textAlign: TextAlign.center,
            maxLines: 2,
            color: AppColor.black,),
          ),
          // Buttons
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NormalButton(
                  height: 30,
                  width: 88,
                  text: confirmText, color: AppColor.primary, fontSize: 13, onPressed: onConfirm,),
                const SizedBox(width: 16),
                 NormalButton(
                  isOutlineButton: true,
                  height: 30,
                  width: 88,
                  text: cancelText, color: AppColor.primary, fontSize: 13, onPressed: onConfirm,),
            
              ],
            ),
          ),
        ],
      ),
    );
  }
}
