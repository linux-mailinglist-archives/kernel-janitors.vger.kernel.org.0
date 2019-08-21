Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B6879734F
	for <lists+kernel-janitors@lfdr.de>; Wed, 21 Aug 2019 09:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727526AbfHUH0l (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 21 Aug 2019 03:26:41 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:35998 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727063AbfHUH0l (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 21 Aug 2019 03:26:41 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7L7Nspo070721;
        Wed, 21 Aug 2019 07:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=xtE3r87dsQIsQBrlpyCcO1lYO+gni0U5XvQ4HzR8+uQ=;
 b=I9WrZyHNws0DGPinzjG8mN2BKFxM9hELWGT4d509jp00fhJ0/ntXfXysg+BAlUgkFore
 Wn1ax732SakISkwR0Wu51NJN1pnmcCUr6FF1KJ1gIpT/PJkAam5LCshHNpXQz49IWXUJ
 ql6q2c4g0KINSSBIDSWCMPGEHGDzTP4/Hc1RQYw300bNifEYgh7qy0nmKupteWYytxwZ
 oaJ/v0FaAuJvrDZQB2MRtAGWYcYmRKsCGNW4iV8Us/1zNpW1H1KN5ocQfhrfBIuO4Usl
 CkXX/gkgLS2PPntmNft/+Uk4uy/b8HwoB1xPOradDFtpLATsDiQlkH6e7hRNnpIRjv/d hw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 2ue90tkmmx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 21 Aug 2019 07:26:39 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7L7Nkbr155916;
        Wed, 21 Aug 2019 07:26:39 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 2ug269p08b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 21 Aug 2019 07:26:39 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x7L7Qcup006449;
        Wed, 21 Aug 2019 07:26:38 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 21 Aug 2019 00:26:37 -0700
Date:   Wed, 21 Aug 2019 10:26:31 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     dragan.cvetic@xilinx.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] misc: xilinx_sdfec: Add ability to configure turbo
Message-ID: <20190821072631.GK26957@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9355 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=854
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908210080
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9355 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=910 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908210080
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Dragan Cvetic,

The patch 6f86ed820178: "misc: xilinx_sdfec: Add ability to configure
turbo" from Jul 27, 2019, leads to the following static checker
warning:

	drivers/misc/xilinx_sdfec.c:428 xsdfec_set_turbo()
	warn: 0xfff is larger than 8 bits

drivers/misc/xilinx_sdfec.c
   417
   418          if (turbo.alg >= XSDFEC_TURBO_ALG_MAX)
   419                  return -EINVAL;
   420
   421          if (turbo.scale > XSDFEC_TURBO_SCALE_MAX)
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Here we ensure that turbo scale is a u8 which is <= 0xf.

   422                  return -EINVAL;
   423
   424          /* Check to see what device tree says about the FEC codes */
   425          if (xsdfec->config.code == XSDFEC_LDPC_CODE)
   426                  return -EIO;
   427
   428          turbo_write = ((turbo.scale & XSDFEC_TURBO_SCALE_MASK)
                                              ^^^^^^^^^^^^^^^^^^^^^^^
So this 0xfff is not required and sort of confusing.

   429                         << XSDFEC_TURBO_SCALE_BIT_POS) |
                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^
We shift it 8 bits.

   430                        turbo.alg;
   431          xsdfec_regwrite(xsdfec, XSDFEC_TURBO_ADDR, turbo_write);
   432          return err;
   433  }
   434
   435  static int xsdfec_get_turbo(struct xsdfec_dev *xsdfec, void __user *arg)
   436  {
   437          u32 reg_value;
   438          struct xsdfec_turbo turbo_params;
   439          int err;
   440
   441          if (xsdfec->config.code == XSDFEC_LDPC_CODE)
   442                  return -EIO;
   443
   444          memset(&turbo_params, 0, sizeof(turbo_params));
   445          reg_value = xsdfec_regread(xsdfec, XSDFEC_TURBO_ADDR);
   446
   447          turbo_params.scale = (reg_value & XSDFEC_TURBO_SCALE_MASK) >>
   448                               XSDFEC_TURBO_SCALE_BIT_POS;

Then, when we're reading it, we do (reg & 0xfff >> 8) so people would
think the result can be 0xff instead of just 0xf.

   449          turbo_params.alg = reg_value & 0x1;
   450
   451          err = copy_to_user(arg, &turbo_params, sizeof(turbo_params));
   452          if (err)
   453                  err = -EFAULT;
   454
   455          return err;
   456  }

regards,
dan carpenter
