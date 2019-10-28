Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8170EE7075
	for <lists+kernel-janitors@lfdr.de>; Mon, 28 Oct 2019 12:32:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388481AbfJ1LcI (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 28 Oct 2019 07:32:08 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:50992 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729660AbfJ1LcI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 28 Oct 2019 07:32:08 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9SBTJxa172748;
        Mon, 28 Oct 2019 11:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=fukucREF7pYggcV7oRENtQG7JbnXIcqJV4wHW6vqwwE=;
 b=PdXuUP5BvgA0vBmM8sCHvLOqeCR+zpMwspKdL/Uy0PLSDZBGJxEwYpXNGLR84Sk5HN/l
 728h5ftahMY4wa4H/sB7dCvCmzAce5PKnD19A6HU1/e6R9P+KIJJ2hHHy4vGthyjojaU
 fqiAztZ8Ak/pnb+rOHklq6XFiQ4ryH1ohEBX+kggXy4sb3GccgdgZ+VvpjY/vbLsPntb
 5B4AqlACNVkb6vexgfkxjZMU6mbYgqaoJDfAY29Y1caKlz4CQrjstRhXgqem1Vyo8LON
 /EKeDj/GUd2agcOVGbaU4wDXHkfjKMSAi3wJZx0Lf274HMGiENcQjszJ8arwh9fTiRy5 tw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 2vve3q1d0x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 28 Oct 2019 11:32:05 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9SBSZkw087882;
        Mon, 28 Oct 2019 11:32:05 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 2vvymyf5kc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 28 Oct 2019 11:32:05 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x9SBW4xI000858;
        Mon, 28 Oct 2019 11:32:04 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 28 Oct 2019 04:32:04 -0700
Date:   Mon, 28 Oct 2019 14:31:58 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     epomozov@marvell.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: aquantia: add basic ptp_clock callbacks
Message-ID: <20191028113158.GA32279@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9423 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=6 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=734
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910280117
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9423 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=6 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=812 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910280117
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Egor Pomozov,

The patch 910479a9f793: "net: aquantia: add basic ptp_clock
callbacks" from Oct 22, 2019, leads to the following static checker
warning:

	drivers/net/ethernet/aquantia/atlantic/aq_ptp.c:1208 aq_ptp_init()
	warn: 'clock' is an error pointer or valid

drivers/net/ethernet/aquantia/atlantic/aq_ptp.c
  1203          spin_lock_init(&aq_ptp->ptp_ring_lock);
  1204  
  1205          aq_ptp->ptp_info = aq_ptp_clock;
  1206          aq_ptp_gpio_init(&aq_ptp->ptp_info, &mbox.info);
  1207          clock = ptp_clock_register(&aq_ptp->ptp_info, &aq_nic->ndev->dev);
  1208          if (!clock || IS_ERR(clock)) {
  1209                  netdev_err(aq_nic->ndev, "ptp_clock_register failed\n");
  1210                  err = PTR_ERR(clock);
  1211                  goto err_exit;

This is a false positive in Smatch but the code is still problematic.

The issue is that ptp_clock_register() returns error pointers if there
is an error and it returns NULL if the clock is disabled in the config.
If "clock" is NULL then this code returns PTR_ERR(NULL) which is
success but so that's a bug.

The question is, is it really realistic for people to run this hardware
without a ptp clock?  If so then we should allow it instead of erroring
out here when clock is NULL.  If not then we should enforce that in the
Kconfig instead of waiting until runtime.

  1212          }
  1213          aq_ptp->ptp_clock = clock;
  1214          aq_ptp_tx_timeout_init(&aq_ptp->ptp_tx_timeout);
  1215  
  1216          atomic_set(&aq_ptp->offset_egress, 0);
  1217          atomic_set(&aq_ptp->offset_ingress, 0);
  1218  

regards,
dan carpenter
