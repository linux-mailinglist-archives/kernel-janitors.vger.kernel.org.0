Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 355E5F10F9
	for <lists+kernel-janitors@lfdr.de>; Wed,  6 Nov 2019 09:23:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729951AbfKFIXw (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 6 Nov 2019 03:23:52 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:33040 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729878AbfKFIXw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 6 Nov 2019 03:23:52 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA68Nlwk067932;
        Wed, 6 Nov 2019 08:23:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=GCHPXfPhGoQdg8O2xrqgpRQIysOWEyaCFxEeUaBDnMI=;
 b=BX6ep0LQQQ2yfrJL8Sj8mJr1f4N9dpp47mKt4I8IcdGRXx+dNSohFQXn7fW73NYTpBNU
 8WjSWaim260+8iJtmrHWv5GnI8p+HAanUkrpSZEvJ3xslPjtHVy3TH+Py+5kyrAojrSL
 BWvyndGaPws5SIgTrVzSlNXu0oBO/0C9qqv6U26B97nmATnSLcCM0mofq98K9oBr7Mqm
 5PlAWAUPhjBwMABy5TfhalojKGGgyiZTQRHzte6ZyMx/1ZgyHW8GlZLR0zoZmmUQxQY5
 +t7Vwr+5q2gNjrH9xTnqpOohroLd+5Z2L4AqVxhyA6ICESxrN4A/eYs0GkOenNyh8wtA ig== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 2w11rq472k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 06 Nov 2019 08:23:47 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA68NYli156954;
        Wed, 6 Nov 2019 08:23:44 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 2w35pqgwhb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 06 Nov 2019 08:23:40 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xA68NZkR018673;
        Wed, 6 Nov 2019 08:23:35 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 06 Nov 2019 00:23:34 -0800
Date:   Wed, 6 Nov 2019 11:23:29 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     ioana.ciornei@nxp.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] dpaa2-eth: add MAC/PHY support through phylink
Message-ID: <20191106082329.GA32733@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9432 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=663
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1911060088
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9432 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=749 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1911060088
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Ioana Ciornei,

The patch 719479230893: "dpaa2-eth: add MAC/PHY support through
phylink" from Oct 31, 2019, leads to the following static checker
warning:

	drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c:55 dpaa2_mac_get_if_mode()
	warn: always true condition '(if_mode >= 0) => (0-u32max >= 0)'

drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c
    44  static int dpaa2_mac_get_if_mode(struct device_node *node,
    45                                   struct dpmac_attr attr)
    46  {
    47          phy_interface_t if_mode;
    48          int err;
    49  
    50          err = of_get_phy_mode(node, &if_mode);
    51          if (!err)
    52                  return if_mode;
    53  
    54          if_mode = phy_mode(attr.eth_if);
    55          if (if_mode >= 0)
                    ^^^^^^^^^^^^
This enum is unsigned so the condition is always true.

    56                  return if_mode;
    57  
    58          return -ENODEV;
    59  }

regards,
dan carpenter
