import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando/app/modules/home/widgets/footer/follow_us/widgets/social_networks.dart';
import 'package:localization/localization.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../utils/images/images.dart';
import '../../../../../utils/text_styles/text_styles.dart';
import '../footer_controller.dart';

class FollowUs extends StatefulWidget {
  const FollowUs({super.key});

  @override
  _FollowUsState createState() => _FollowUsState();
}

class _FollowUsState extends State<FollowUs> {
  final controller = Modular.get<FooterController>();
  @override
  void dispose() {
    Modular.dispose<FooterController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fontScale = controller.screen.fontScale(context);
    return Container(
      alignment: Alignment.topRight,
      width: 260 * fontScale,
      padding: const EdgeInsets.only(
        bottom: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset(
            ImageUrls.logoHorizontalBig,
            width: 300 * fontScale,
            height: 60 * fontScale,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 38 * fontScale),
          SelectableText(
            "footer_social_media".i18n(),
            style: TextStyles.roboto(
              16 * fontScale,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 13),
          SocialNetworks(fontScale),
          const SizedBox(height: 60),
          SelectableText(
            "footer_contact".i18n(),
            style: TextStyles.notoSans(24 * fontScale, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 13),
          SelectableText(
            'contato@flutterando.com.br',
            style: TextStyles.roboto(16 * fontScale, fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 45),
          InkWell(
            onTap: () async {
              await launchUrl(Uri.parse('https://f-team.dev/desenvolvimento'));
            },
            child: Text(
              'Powered by F-Team',
              style: TextStyles.roboto(16, fontWeight: FontWeight.bold),
            ),
          ),
          SelectableText(
            'Developed with Flutter Web',
            textAlign: TextAlign.right,
            style: TextStyles.roboto(16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 34),
          SelectableText(
            'Copyright © Flutterando 2024 - Todos os direitos reservados',
            style: TextStyles.roboto(9 * fontScale),
          )
        ],
      ),
    );
  }
}
