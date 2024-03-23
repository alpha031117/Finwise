// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:vhack_finwise_app/utils/global_variables.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {

  final List<String> firstList = [ 
    'Name and contact details, such as, name, email address, postal address, and phone number.',
    'Account credentials, such as, passwords and other security information for authentication and access.',
    'Usage information, such as, behavioral information about how you navigate without out Services and which preferences, interest, etc. Other information shared by you through our website.',
    'Computer, device and connection information, such as, IP address, browser type, operating system, platform type, device type, and connection type.',
  ];

  final List<String> secondList = [
    'Direct interactions, such as, when you register for our Services, upload content, email and contact us',
    'Automated Tracking Technologies, such as cookies, web logs, and internet tags collecting information automatically about your interaction with our services.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Terms & Conditions',
          style: TextStyle(
            fontFamily: GlobalVariables.titleFont().fontFamily,
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: GlobalVariables.tertiaryColor,
            letterSpacing: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding( 
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 40),
          child: Container(
            width: 900,
            child: Column( 
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ 
                paragraphText('Welcome to FinWise (the "Site"). This Site is a service made available by FinWise Inc. By accessing the Site, its content, information, products and services ("Materials"), you agree to the following terms of use ("Terms of Use"). These Terms of Use constitute a legal agreement ("Agreement") between you and FInWise. Please read them carefully before using the Site. By using the Site, you are acknowledging that you have read and understood these Terms of Use and agree to be legally bound by them. If you do not agree with these Terms of Use, please do not use the Site.'),
                SizedBox(height: 30),
                titleText('INTELLECTUAL PROPERTY RIGHTS'),
                SizedBox(height: 30),
                paragraphText('You agree that the Materials and the Site are protected by copyright, trademarks, or other proprietary rights owned by FinWise or its licensors. You are not allowed to use the Site and the Materials other than permitted in this Agreement or explicitly permitted in writing by FinWise in a separate agreement.'),
                SizedBox(height: 30),
                titleText('LIMITED LICENSE TO USE THE SITE'),
                SizedBox(height: 30),
                paragraphText('FinWise grants you, as user of this Site, a non-exclusive, non-transferable, revocable, limited license to access and use this Site and the Materials. We may terminate the license at any time for any reason and, in any such case, may delete without notice to you any data or information that you provided.'),
                SizedBox(height: 30),
                titleText('LIMITATIONS OF USE'),
                SizedBox(height: 30),
                paragraphText('The Materials on this Site are for your personal use only. You shall not commercially use the Materials, for example, by selling or making the Materials available to the public. Further, you may not reproduce, amend, reverse engineer, disassemble, sublicense, or create derivative works from the Materials. Please contact us, if you want to request permission for any specific use of our Site or Materials and we will consider your request. Furthermore, you shall not use any network monitoring or discovery software to determine the site architecture, or extract information about usage, individual identities, or users. You shall not use Materials in any way that harms FinWise, our employees, directors or other representatives, our participating rightsholders or users, or any other third party. You shall not use the Site or Materials in any way that is unlawful or harms any other person or entity.'),
                SizedBox(height: 30),
                titleText('NO FINANCIAL ADVICE'),
                SizedBox(height: 30),
                paragraphText('The Materials are not intended to and do not constitute financial advice. We do not warrant or guarantee the accuracy completeness, or adequacy of the Materials. Your use of the Materials on this Site or of any materials linked to from this Site is at your risk.'),
                SizedBox(height: 30),
                titleText('LINKING TO THIS SITE'),
                SizedBox(height: 30),
                paragraphText('You are welcome to link to the pages of this Site provided that (1) you do not remove or obscure, by framing or otherwise, any portion of the page that you are linking to, the Terms of Use, the copyright notice, or other notices on this Site, and (2) you discontinue providing links to this Site if requested by us.'),
                SizedBox(height: 30),
                titleText('LICENSE OF CONTENT PROVIDED BY YOU'),
                SizedBox(height: 30),
                paragraphText('By uploading content and information to this Site you grant, and you warrant that you are entitled to grant, to FinWise a non-exclusive, perpetual, worldwide, royalty-free, irrevocable licence to use the content and information. This licence includes but is not limited to the right to use, reproduce, distribute, modify, adapt, publish, exploit, make available to the public, translate, sublicence and create derivative works from the content in any form, medium, or technology now known or later developed. For clarification, ownership rights in the content and information you provided will be retained. You agree that you shall have no recourse against FinWise for any alleged or actual infringement, or other violation of any proprietary right in your communications to us or any other content or information you upload or submit to this Site.'),
                SizedBox(height: 30),
                titleText('NO SOLICITATION'),
                SizedBox(height: 30),
                paragraphText('You agree that you will not upload or distribute on or through this Site any content or material containing any advertising, promotion, solicitation for goods, services or funds or solicitation for others without the express written permission of FinWise. Notwithstanding the foregoing, in any interactive areas of this Site, where appropriate (1) you may list your name, address and email address, and your own Web site\'s URL, and (2) you may recommend third party Web sites, goods or services so long as you have no financial interest in and receive no direct or indirect benefit from such recommended Web site, product or service or its recommendation. In no event may any person or entity solicit anyone with content retrieved from this Site.'),
                SizedBox(height: 30),
                titleText('DISCLAIMER'),
                SizedBox(height: 30),
                paragraphText('This Site and Materials are provided on an "as is, as available, with all faults" basis. FinWise expressly disclaims all warranties, including the warranties of merchantability, fitness for a particular purpose, and non-infringement. FinWise disclaims all responsibility for any loss, injury, claim, liability or damage of any kind resulting from, arising out of or in any way related to (1) any errors in or omissions from this Site or Materials, including but not limited to technical inaccuracies and typographical errors, (2) any third party web sites, or any content therein, that are accessed directly or indirectly through links in this Site, including but not limited to any errors in or omissions therefrom, (3) the unavailability of this Site, the Materials, or any portion thereof, (4) your use of this Site or Materials, or (5) your use of any equipment or software in connection with this Site or Materials.'),
                SizedBox(height: 30),
                titleText('LIMITATION OF LIABILITY'),
                SizedBox(height: 30),
                paragraphText('FinWise is not liable for any loss, injury, claim, liability or damage of any kind resulting from your use of this Site, the Materials, the interactive areas of this Site or any facts or opinions appearing on or through an interactive area. FinWise is not liable for any direct, indirect, special, incidental, punitive or consequential damages of any kind whatsoever (including, without limitation, attorneys\' fees) in any way due to, resulting from or arising in connection with (1) the use of or inability to use this Site or the Materials, (2) any materials on third party web sites, (3) any viruses or other disabling features that affect your access to or use of the service, (4) any incompatibility between this Site and the Materials on the one hand and any other service, software or hardware on the other hand, (5) any delays or failures you may have in initiating, conducting or completing any transmissions or transactions with FinWise or any other person in an accurate or timely manner, or (6) any claims for breach of contract, breach of warranty, guarantee or condition, strict liability, negligence or any other tort, all regardless of whether this remedy fully compensates you for any losses or whether FinWise knew or should have known about the possibility of damages. To the extent the foregoing limitation of liability is prohibited or fails of its essential purpose, FinWise\'s sole obligation to you for damages shall be limited to US\$100.00 or the amount you have paid us in the past 12 months. Some jurisdictions do not allow the exclusion or limitation of incidental, consequential or other damages, so the above limitations or exclusions may not apply to you. You agree that any claim related to these Terms of Use may not be brought more than one year after the earliest time that such claim may accrue, after which time such claim is permanently barred, whether made by you or by your lawful sucessors.'),
                SizedBox(height: 50),
              ]
            ),
          )
        ),
      )
    );
  }

  Text titleText(String text) {
    return Text(
      text,
      style: TextStyle( 
        fontFamily: GlobalVariables.textFont().fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
      ),
    );
  }

  Text paragraphText(String text) {
    return Text(
      text,
      style: TextStyle( 
        fontFamily: GlobalVariables.textFont().fontFamily,
        fontSize: 12,
        color: Colors.grey[800],
        letterSpacing: 1,
        height: 1.7,
      ),
    );
  }
}