Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D99B1A0EA8
	for <lists+kernel-janitors@lfdr.de>; Tue,  7 Apr 2020 15:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728596AbgDGNwH (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 7 Apr 2020 09:52:07 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:60140 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728555AbgDGNwG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Apr 2020 09:52:06 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 037DnEie126801;
        Tue, 7 Apr 2020 13:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=LTemuXVcxiP+E5rF8MW+cgeBnhsznaHzqC1/ipxlPpg=;
 b=n78TvpYmJH2ni47fnbbhPXhiuPrFNIJ9en/O1DSqSIXED+oG1SnpIDSVNlhglcAEEtlO
 u4yVz9vja2KoJnho4kTgLu+TK03uScvWVLhGfPLiYpuXwaXt3pXza3/6DuUKRiXW5FRD
 H1FIDQSzkBIohVX6lQqo3XySpcTBxBWOCxfliDVUN4XPzhJtY13emTTnz16kJqZjEmQQ
 VovBiAde+FBgWPPaiD86D15y2A/HD6ge0VbUzuPJ324AQesXalvJFUfqRsK2emjAiY36
 cTNNdYUYHGVqj1/YOkLcxBhdKcxe3JKRarvcMjZmqtm1388ANGDZnFzy60OasL8EvbBz VQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 306jvn523r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 07 Apr 2020 13:52:02 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 037DpVck058533;
        Tue, 7 Apr 2020 13:52:01 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 30741eaxvb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 07 Apr 2020 13:52:01 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 037DpxBV026418;
        Tue, 7 Apr 2020 13:51:59 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 07 Apr 2020 06:51:59 -0700
Date:   Tue, 7 Apr 2020 16:51:53 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     vladimir.oltean@nxp.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: dsa: sja1105: Add support for the SGMII port
Message-ID: <20200407135153.GA109191@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9583 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3 phishscore=0
 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004070121
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9583 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=3
 mlxlogscore=999 mlxscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1011 malwarescore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004070120
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Vladimir Oltean,

The patch ffe10e679cec: "net: dsa: sja1105: Add support for the SGMII
port" from Mar 20, 2020, leads to the following static checker
warning:

	drivers/net/dsa/sja1105/sja1105_main.c:1693 sja1105_static_config_reload()
	warn: bitwise AND condition is false here

drivers/net/dsa/sja1105/sja1105_main.c
  1680  
  1681          if (sja1105_supports_sgmii(priv, SJA1105_SGMII_PORT)) {
  1682                  bool an_enabled = !!(bmcr & BMCR_ANENABLE);
  1683  
  1684                  sja1105_sgmii_pcs_config(priv, an_enabled, false);
  1685  
  1686                  if (!an_enabled) {
  1687                          int speed = SPEED_UNKNOWN;
  1688  
  1689                          if (bmcr & BMCR_SPEED1000)
  1690                                  speed = SPEED_1000;
  1691                          else if (bmcr & BMCR_SPEED100)
  1692                                  speed = SPEED_100;
  1693                          else if (bmcr & BMCR_SPEED10)
                                                ^^^^^^^^^^^^
This is zero so the condition can never be true.

  1694                                  speed = SPEED_10;
  1695  
  1696                          sja1105_sgmii_pcs_force_speed(priv, speed);
  1697                  }
  1698          }
  1699  out:
  1700          mutex_unlock(&priv->mgmt_lock);
  1701  
  1702          return rc;

regards,
dan carpenter
