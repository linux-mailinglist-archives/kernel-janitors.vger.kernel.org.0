Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 741E1264041
	for <lists+kernel-janitors@lfdr.de>; Thu, 10 Sep 2020 10:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730178AbgIJIlr (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 10 Sep 2020 04:41:47 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:39936 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729521AbgIJIlG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 10 Sep 2020 04:41:06 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08A8YWZa147139;
        Thu, 10 Sep 2020 08:40:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=VwyrO5S93IC0Pg08gDilettOqDQHZ+UXQPo2yMgQ3q4=;
 b=C4A9pQ7NssR2h1dD5uxRQWeThVWEPWkJVcIDvPqadkebd3ajWOyrPUKRtFkC8jfrRQJM
 hZ+6VGRI04bquD3S+nSlpyBDlwx+S/hRQTDiLCP22+LYCQzy7pRLv3+QeZ+4HkIpGB8X
 5I71dMTskoKkmNXUBoj1Lzqjg6adLmrW6E27vf+n0kfKejfZ9ONFcZTPOhvJS3PEv4s3
 3nPDdLKYaLepYf8Ut2gEejZPA8laPXIccaJ5ROy7y8s75eI4Z00molCd2fz11TgMG66M
 v3UoDi+QCODaTaj6SL/q5Y2XSIwYefKqhnjTdmwsfTPzqqzIBKTDowHQiy6xsIzL30mm oA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 33c2mm6jqu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 10 Sep 2020 08:40:55 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08A8ZdTG059026;
        Thu, 10 Sep 2020 08:40:55 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 33dacmvnu6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 10 Sep 2020 08:40:55 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08A8esxe027245;
        Thu, 10 Sep 2020 08:40:54 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 10 Sep 2020 01:40:53 -0700
Date:   Thu, 10 Sep 2020 11:40:48 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     lkundrak@v3.sk
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] mfd: ene-kb3930: Add driver for ENE KB3930 Embedded
 Controller
Message-ID: <20200910084048.GA64765@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9739 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=654 malwarescore=0
 bulkscore=0 phishscore=0 adultscore=0 suspectscore=3 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009100080
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9739 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=2 clxscore=1011 mlxlogscore=653
 malwarescore=0 suspectscore=3 lowpriorityscore=2 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009100080
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Lubomir Rintel,

The patch 753bd752e181: "mfd: ene-kb3930: Add driver for ENE KB3930
Embedded Controller" from Jul 10, 2020, leads to the following static
checker warning:

	drivers/mfd/ene-kb3930.c:165 kb3930_probe()
	warn: 'ddata->off_gpios' can also be NULL

drivers/mfd/ene-kb3930.c
   152  
   153          ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
   154                                     ariel_ec_cells,
   155                                     ARRAY_SIZE(ariel_ec_cells),
   156                                     NULL, 0, NULL);
   157          if (ret)
   158                  return ret;
   159  
   160          if (of_property_read_bool(np, "system-power-controller")) {
   161                  ddata->off_gpios =
   162                          devm_gpiod_get_array_optional(dev, "off", GPIOD_IN);

The devm_gpiod_get_array_optional() function can return NULL in the
sitation where the optional array is not there.  It's not an error
because it's an optional thing, but there is also no valid pointer to
return.  So because it's not an error pointer, or a valid pointer then
it's NULL.

   163                  if (IS_ERR(ddata->off_gpios))
   164                          return PTR_ERR(ddata->off_gpios);
   165                  if (ddata->off_gpios->ndescs < 2) {
   166                          dev_err(dev, "invalid off-gpios property\n");
   167                          return -EINVAL;
   168                  }
   169          }
   170  
   171          if (ddata->off_gpios) {
   172                  register_restart_handler(&kb3930_restart_nb);
   173                  if (!pm_power_off)
   174                          pm_power_off = kb3930_pm_power_off;
   175          }
   176  
   177          return 0;

regards,
dan carpenter
