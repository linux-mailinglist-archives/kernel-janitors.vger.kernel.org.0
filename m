Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 936E212ED8
	for <lists+kernel-janitors@lfdr.de>; Fri,  3 May 2019 15:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbfECNMZ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 3 May 2019 09:12:25 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:53810 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726719AbfECNMZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 3 May 2019 09:12:25 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x43CxPwU115991;
        Fri, 3 May 2019 13:12:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=VGGMsTUess2E4yuxX2j3MKEs+0uPSz2RNZwEOrv3StE=;
 b=w2r4l8YHICpOnKcqqg/dLv4WkbIzNANMUu1c5P4DGUg/3bAk/5Ix4Zpvna8g27nXCLv7
 g6kzMon9xOw1tKsmdFQpQ7k7C2fYrFFZ4F9htpYjMzv7cebZoIu/DQQ/fdcAj0a9MEPk
 HZVJpi4TzIRvhRQSClQ4qMq25s4iZ0vvBhmxDMFKpmjqOmUPt91ggSWkQbyGKZXXGAPe
 iRCyC23DrDBN5OGTpsddy3Rq/aHAq41U9LwoxAn86U4hG2b5VBgJCUogUjJ0tAM8wUpO
 WzAfJ0QifcUJ+TguTC1QUDK8jMoHC6+maexO4I4zGH3ET5UOULdhc/4+EnuNqsd5GYh/ tg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 2s6xhypmyh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 03 May 2019 13:12:20 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x43D8oEd157832;
        Fri, 3 May 2019 13:10:20 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 2s7rtc9bsf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 03 May 2019 13:10:19 +0000
Received: from abhmp0022.oracle.com (abhmp0022.oracle.com [141.146.116.28])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x43DAIFv029900;
        Fri, 3 May 2019 13:10:18 GMT
Received: from mwanda (/196.104.111.181)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 03 May 2019 06:10:17 -0700
Date:   Fri, 3 May 2019 16:10:11 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     biju.das@bp.renesas.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] phy: renesas: phy-rcar-gen2: Add support for r8a77470
Message-ID: <20190503131010.GJ29695@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9245 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905030082
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9245 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905030082
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Biju Das,

The patch b7187e001a10: "phy: renesas: phy-rcar-gen2: Add support for
r8a77470" from Apr 10, 2019, leads to the following static checker
warning:

	drivers/phy/renesas/phy-rcar-gen2.c:403 rcar_gen2_phy_probe()
	warn: array off by one? 'data->select_value[channel_num]'

drivers/phy/renesas/phy-rcar-gen2.c
   262  static const u32 pci_select_value[][PHYS_PER_CHANNEL] = {
   263          [0]     = { USBHS_UGCTRL2_USB0SEL_PCI, USBHS_UGCTRL2_USB0SEL_HS_USB },
   264          [2]     = { USBHS_UGCTRL2_USB2SEL_PCI, USBHS_UGCTRL2_USB2SEL_USB30 },

This select array has three elements.

   265  };
   266  
   267  static const u32 usb20_select_value[][PHYS_PER_CHANNEL] = {
   268          { USBHS_UGCTRL2_USB0SEL_USB20, USBHS_UGCTRL2_USB0SEL_HS_USB20 },

But this one only has two.

   269  };
   270  
   271  static const struct rcar_gen2_phy_data rcar_gen2_usb_phy_data = {
   272          .gen2_phy_ops = &rcar_gen2_phy_ops,
   273          .select_value = pci_select_value,
   274  };
   275  
   276  static const struct rcar_gen2_phy_data rz_g1c_usb_phy_data = {
   277          .gen2_phy_ops = &rz_g1c_phy_ops,
   278          .select_value = usb20_select_value,
   279  };

[ snip ]

   382          for_each_child_of_node(dev->of_node, np) {
   383                  struct rcar_gen2_channel *channel = drv->channels + i;
   384                  u32 channel_num;
   385                  int error, n;
   386  
   387                  channel->of_node = np;
   388                  channel->drv = drv;
   389                  channel->selected_phy = -1;
   390  
   391                  error = of_property_read_u32(np, "reg", &channel_num);
   392                  if (error || channel_num > 2) {
                                     ^^^^^^^^^^^^^^^
The code seems to assume they all have 3 elements

   393                          dev_err(dev, "Invalid \"reg\" property\n");
   394                          return error;
   395                  }
   396                  channel->select_mask = select_mask[channel_num];
   397  
   398                  for (n = 0; n < PHYS_PER_CHANNEL; n++) {
   399                          struct rcar_gen2_phy *phy = &channel->phys[n];
   400  
   401                          phy->channel = channel;
   402                          phy->number = n;
   403                          phy->select_value = data->select_value[channel_num][n];
                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Smatch warning.

   404  
   405                          phy->phy = devm_phy_create(dev, NULL,
   406                                                     data->gen2_phy_ops);
   407                          if (IS_ERR(phy->phy)) {
   408                                  dev_err(dev, "Failed to create PHY\n");
   409                                  return PTR_ERR(phy->phy);
   410                          }
   411                          phy_set_drvdata(phy->phy, phy);
   412                  }
   413  
   414                  i++;
   415          }

regards,
dan carpenter
