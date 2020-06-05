Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8BE61EF61E
	for <lists+kernel-janitors@lfdr.de>; Fri,  5 Jun 2020 13:06:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726941AbgFELGs (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 5 Jun 2020 07:06:48 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:33196 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbgFELGs (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 5 Jun 2020 07:06:48 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 055B23kS151281;
        Fri, 5 Jun 2020 11:06:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=I87mGo0NhGF+COh1OCIyKCVokzz/aryk9ikF2SqHshQ=;
 b=CnLH0OtnGGEAFZoF8ap+MhZ+d0TKj3jfhhu6AJ6y/mvL14Zv2TQMmCFvP4TOWmbEXWx5
 xWLCgqxR5vuwQQeHJKPK0mfrRsKMYnoPnA3JPH3PbikuG17zSxBWhUMb0rqxuRIyoKiy
 qiXdErkAyvNXJk9tHTmzHGAH6/0Y6OHYOPZlxByxo7k05gBqbys5wV06X4IuzOni1/if
 p/Iv78jggG01vUM90fQVl1AyhYCRze/EwubPl0BMxGpVLcWB0cJwwyk6uoYuY6DoJdB9
 Fzjs2Cx2V3qcg6sbjXdLmjLPF6hpPqYMlyu0TchzrzI3C/ffb9szAxBz4RHgerUR+GLK hw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 31f9242aup-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 05 Jun 2020 11:06:46 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 055B3QeQ029165;
        Fri, 5 Jun 2020 11:06:46 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 31f92sm2fu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 05 Jun 2020 11:06:46 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 055B6iMV014277;
        Fri, 5 Jun 2020 11:06:45 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 05 Jun 2020 04:06:44 -0700
Date:   Fri, 5 Jun 2020 14:06:34 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Stephen Hemminger <stephen@networkplumber.org>
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] [PATCH] chelsio: add support for other 10G boards
Message-ID: <20200605110634.GG978434@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9642 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 suspectscore=1 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006050085
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9642 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011 impostorscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0 bulkscore=0
 lowpriorityscore=0 cotscore=-2147483648 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=1 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006050085
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

[ Hey Stephen, I know this code is a million years old, but I figured
  it can't hurt to ask.  -dan ]

Hello Stephen Hemminger,

The patch f1d3d38af757: "[PATCH] chelsio: add support for other 10G
boards" from Dec 1, 2006, leads to the following static checker
warning:

	drivers/net/ethernet/chelsio/cxgb/subr.c:630 t1_link_start()
	warn: was shift intended here '(mac.adapter.params.nports < 2)'

drivers/net/ethernet/chelsio/cxgb/subr.c
   623  int t1_link_start(struct cphy *phy, struct cmac *mac, struct link_config *lc)
   624  {
   625          unsigned int fc = lc->requested_fc & (PAUSE_RX | PAUSE_TX);
                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
PAUSE_RX is BIT(0) and PAUSE_TX is BIT(1).

   626  
   627          if (lc->supported & SUPPORTED_Autoneg) {
   628                  lc->advertising &= ~(ADVERTISED_ASYM_PAUSE | ADVERTISED_PAUSE);
   629                  if (fc) {
   630                          if (fc == ((PAUSE_RX | PAUSE_TX) &
   631                                     (mac->adapter->params.nports < 2)))

This is a weird condition because (mac->adapter->params.nports < 2) is
0-1 so we could leave the (PAUSE_RX | PAUSE_TX) out:

		if (fc == (mac->adapter->params.nports < 2))

Obviously << 2 isn't intended because that would be equivalent of:

		if (rc == 0)

Maybe a cleaner way to write this would be:

			if ((fc == PAUSE_RX &&
			     mac->adapter->params.nports < 2) ||
			    fc == 0)

Or maybe that's just really weird looking...

   632                                  lc->advertising |= ADVERTISED_PAUSE;
   633                          else {
   634                                  lc->advertising |= ADVERTISED_ASYM_PAUSE;
   635                                  if (fc == PAUSE_RX)
   636                                          lc->advertising |= ADVERTISED_PAUSE;
   637                          }
   638                  }
   639                  phy->ops->advertise(phy, lc->advertising);
   640  
   641                  if (lc->autoneg == AUTONEG_DISABLE) {
   642                          lc->speed = lc->requested_speed;
   643                          lc->duplex = lc->requested_duplex;
   644                          lc->fc = (unsigned char)fc;
   645                          mac->ops->set_speed_duplex_fc(mac, lc->speed,
   646                                                        lc->duplex, fc);
   647                          /* Also disables autoneg */
   648                          phy->state = PHY_AUTONEG_RDY;
   649                          phy->ops->set_speed_duplex(phy, lc->speed, lc->duplex);
   650                          phy->ops->reset(phy, 0);
   651                  } else {
   652                          phy->state = PHY_AUTONEG_EN;
   653                          phy->ops->autoneg_enable(phy); /* also resets PHY */
   654                  }
   655          } else {
   656                  phy->state = PHY_AUTONEG_RDY;
   657                  mac->ops->set_speed_duplex_fc(mac, -1, -1, fc);
   658                  lc->fc = (unsigned char)fc;
   659                  phy->ops->reset(phy, 0);
   660          }
   661          return 0;
   662  }

regards,
dan carpenter
