Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41D4A173600
	for <lists+kernel-janitors@lfdr.de>; Fri, 28 Feb 2020 12:27:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725805AbgB1L1Z (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 28 Feb 2020 06:27:25 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:35290 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbgB1L1Z (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 28 Feb 2020 06:27:25 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01SBN0QS161068;
        Fri, 28 Feb 2020 11:27:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=iWquBMixnct7EFJGF5lepliEFniGoLrKh3Bytkxqn0k=;
 b=IoooCwill+D8Jp9J9Rto9NnSLOGsjYs/3p+j2Fv89E188MHINZ2hPVL/F3uB4ccvRNJ/
 fn5N5uHo4/ajFeC5as2q5cZ6M4e1fqwXkwXP+RHq6f1kpoL/qFcC7HPRqqGmwDKC8E2x
 cLF/mKzIglI0GEKEbZafkN3+lJh+JyuUQ+A6Wv/jZmRdjpeiJSllWfOKCVnW8FcDpswd
 kWFbU07UH/Kdq/bdbqj6knOaOLGZ+WrNSxsJNUFbPUbwmu54Rrx+ont+6hMiPhka0hzJ
 hKbFKTFcVjtX16zcT+PPJamhjS2byCwWvZnhKHfGOCKK7JVqobmwc8BbNNGU8LAq2VDA PQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 2ydct3j8b8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 28 Feb 2020 11:27:20 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01SBIBcU192982;
        Fri, 28 Feb 2020 11:27:19 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 2ydj4qgv5q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 28 Feb 2020 11:27:19 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 01SBRI1g012575;
        Fri, 28 Feb 2020 11:27:18 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 28 Feb 2020 03:27:17 -0800
Date:   Fri, 28 Feb 2020 14:27:09 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     yanivr@broadcom.com, Ariel Elior <aelior@marvell.com>
Cc:     Sudarsana Kalluru <skalluru@marvell.com>,
        GR-everest-linux-l2@marvell.com, kernel-janitors@vger.kernel.org
Subject: [bug report] bnx2x: Add Warpcore support for 578xx
Message-ID: <20200228112709.6ailvgxaq7nymz4m@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9544 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 adultscore=0 malwarescore=0 mlxlogscore=836 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002280095
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9544 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 phishscore=0 mlxlogscore=878 mlxscore=0 suspectscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002280095
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Yaniv Rosner,

The patch 3c9ada227c56: "bnx2x: Add Warpcore support for 578xx" from
Jun 14, 2011, leads to the following static checker warning:

	drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c:5638 bnx2x_link_settings_status()
	warn: assigning (-22) to unsigned variable

drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c
  5614  static u8 bnx2x_link_settings_status(struct bnx2x_phy *phy,
               ^^
This is a u8.  My understanding is that the function returns 1 on
success and 0 on failure?

  5615                                       struct link_params *params,
  5616                                       struct link_vars *vars)
  5617  {
  5618          struct bnx2x *bp = params->bp;
  5619  
  5620          u16 gp_status, duplex = DUPLEX_HALF, link_up = 0, speed_mask;
  5621          int rc = 0;
  5622  
  5623          /* Read gp_status */
  5624          CL22_RD_OVER_CL45(bp, phy,
  5625                            MDIO_REG_BANK_GP_STATUS,
  5626                            MDIO_GP_STATUS_TOP_AN_STATUS1,
  5627                            &gp_status);
  5628          if (gp_status & MDIO_GP_STATUS_TOP_AN_STATUS1_DUPLEX_STATUS)
  5629                  duplex = DUPLEX_FULL;
  5630          if (gp_status & MDIO_GP_STATUS_TOP_AN_STATUS1_LINK_STATUS)
  5631                  link_up = 1;
  5632          speed_mask = gp_status & GP_STATUS_SPEED_MASK;
  5633          DP(NETIF_MSG_LINK, "gp_status 0x%x, is_link_up %d, speed_mask 0x%x\n",
  5634                         gp_status, link_up, speed_mask);
  5635          rc = bnx2x_get_link_speed_duplex(phy, params, vars, link_up, speed_mask,
  5636                                           duplex);
  5637          if (rc == -EINVAL)
  5638                  return rc;
                        ^^^^^^^^^
This is -22 cast to u8 (success?).  The problem is that the
bnx2x_get_link_speed_duplex() function only return -EINVAL and zero.

  5639  
  5640          if (gp_status & MDIO_GP_STATUS_TOP_AN_STATUS1_LINK_STATUS) {
  5641                  if (SINGLE_MEDIA_DIRECT(params)) {
  5642                          vars->duplex = duplex;
  5643                          bnx2x_flow_ctrl_resolve(phy, params, vars, gp_status);
  5644                          if (phy->req_line_speed == SPEED_AUTO_NEG)
  5645                                  bnx2x_xgxs_an_resolve(phy, params, vars,
  5646                                                        gp_status);
  5647                  }
  5648          } else { /* Link_down */
  5649                  if ((phy->req_line_speed == SPEED_AUTO_NEG) &&
  5650                      SINGLE_MEDIA_DIRECT(params)) {
  5651                          /* Check signal is detected */
  5652                          bnx2x_check_fallback_to_cl37(phy, params);
  5653                  }
  5654          }
  5655  
  5656          /* Read LP advertised speeds*/
  5657          if (SINGLE_MEDIA_DIRECT(params) &&
  5658              (vars->link_status & LINK_STATUS_AUTO_NEGOTIATE_COMPLETE)) {
  5659                  u16 val;
  5660  
  5661                  CL22_RD_OVER_CL45(bp, phy, MDIO_REG_BANK_CL73_IEEEB1,
  5662                                    MDIO_CL73_IEEEB1_AN_LP_ADV2, &val);
  5663  
  5664                  if (val & MDIO_CL73_IEEEB1_AN_ADV2_ADVR_1000M_KX)
  5665                          vars->link_status |=
  5666                                  LINK_STATUS_LINK_PARTNER_1000TFD_CAPABLE;
  5667                  if (val & (MDIO_CL73_IEEEB1_AN_ADV2_ADVR_10G_KX4 |
  5668                             MDIO_CL73_IEEEB1_AN_ADV2_ADVR_10G_KR))
  5669                          vars->link_status |=
  5670                                  LINK_STATUS_LINK_PARTNER_10GXFD_CAPABLE;
  5671  
  5672                  CL22_RD_OVER_CL45(bp, phy, MDIO_REG_BANK_OVER_1G,
  5673                                    MDIO_OVER_1G_LP_UP1, &val);
  5674  
  5675                  if (val & MDIO_OVER_1G_UP1_2_5G)
  5676                          vars->link_status |=
  5677                                  LINK_STATUS_LINK_PARTNER_2500XFD_CAPABLE;
  5678                  if (val & (MDIO_OVER_1G_UP1_10G | MDIO_OVER_1G_UP1_10GH))
  5679                          vars->link_status |=
  5680                                  LINK_STATUS_LINK_PARTNER_10GXFD_CAPABLE;
  5681          }
  5682  
  5683          DP(NETIF_MSG_LINK, "duplex %x  flow_ctrl 0x%x link_status 0x%x\n",
  5684                     vars->duplex, vars->flow_ctrl, vars->link_status);
  5685          return rc;
                       ^^
This rc is always zero (failure/link down?).

  5686  }

regards,
dan carpenter
