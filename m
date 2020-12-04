Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C099E2CF057
	for <lists+kernel-janitors@lfdr.de>; Fri,  4 Dec 2020 16:07:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729365AbgLDPFZ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 4 Dec 2020 10:05:25 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:50606 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727620AbgLDPFY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 4 Dec 2020 10:05:24 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B4F3n54098506;
        Fri, 4 Dec 2020 15:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=WxTSnu5TP3hvWNt9vimBI6wVtqERDxWRqnVhEeqUeLg=;
 b=Y2VtV1CEFpwBE6+4UUmXJIcA2HOny9w5hk/iF4nv8QR75V6PtXe5d4YGGjjyZfFkmIso
 dR/T3CWpFtqpDv0SOxPXX09Krm0s0GZT9YyN7Tt4JpOVoReHv2SaIG2eECvj7LYIXBQ2
 XIKDL7QUcVNrZiWgBcBiKiPviMFD76+KkxnAaXZXwfHV6FkwtxzNTzSS1EE8HeeZZ86B
 8fSVQoaOpJHcr6zV+lw+ZbLmo0+LSx9mfZtr+LXu5t+uE8IcWyFYJiV5cFgehfGOm/i/
 uegbsN4PyBqTvTidrHd4ymS0s+m8oAWGwtZQDmhDYS/Z+OQi8lHtpqr3Keea0xFBlGbY zw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 353dyr3ma8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 04 Dec 2020 15:04:38 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B4F0HKK019533;
        Fri, 4 Dec 2020 15:04:37 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 3540f3e05w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 04 Dec 2020 15:04:37 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B4F4aBN012659;
        Fri, 4 Dec 2020 15:04:36 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 04 Dec 2020 07:04:35 -0800
Date:   Fri, 4 Dec 2020 18:04:30 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Adam.Ward.opensource@diasemi.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] regulator: da9121: Add device variant regmaps
Message-ID: <X8pP/pZAj6W7/YfP@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9824 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 suspectscore=3 bulkscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012040087
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9824 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0
 clxscore=1015 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=3 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012040088
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Adam Ward,

The patch c860476b9e3a: "regulator: da9121: Add device variant
regmaps" from Nov 30, 2020, leads to the following static checker
warning:

	drivers/regulator/da9121-regulator.c:869 da9121_check_device_type()
	error: uninitialized symbol 'name'.

drivers/regulator/da9121-regulator.c
   811  static int da9121_check_device_type(struct i2c_client *i2c, struct da9121 *chip)
   812  {
   813          u32 device_id;
   814          u8 chip_id = chip->variant_id;
   815          u32 variant_id;
   816          u8 variant_mrc, variant_vrc;
   817          char *type;
   818          const char *name;
                ^^^^^^^^^^^^^^^^

   819          bool config_match = false;
   820          int ret = 0;
   821  
   822          ret = regmap_read(chip->regmap, DA9121_REG_OTP_DEVICE_ID, &device_id);
   823          if (ret < 0) {
   824                  dev_err(chip->dev, "Cannot read device ID: %d\n", ret);
   825                  goto error;
   826          }
   827  
   828          ret = regmap_read(chip->regmap, DA9121_REG_OTP_VARIANT_ID, &variant_id);
   829          if (ret < 0) {
   830                  dev_err(chip->dev, "Cannot read variant ID: %d\n", ret);
   831                  goto error;
   832          }
   833  
   834          if (device_id != DA9121_DEVICE_ID) {
   835                  dev_err(chip->dev, "Invalid device ID: 0x%02x\n", device_id);
   836                  ret = -ENODEV;
   837                  goto error;
   838          }
   839  
   840          variant_vrc = variant_id & DA9121_MASK_OTP_VARIANT_ID_VRC;
   841  
   842          switch (variant_vrc) {
   843          case DA9121_VARIANT_VRC:
   844                  type = "DA9121/DA9130";
   845                  config_match = (chip_id == DA9121_TYPE_DA9121_DA9130);
   846                  break;
   847          case DA9220_VARIANT_VRC:
   848                  type = "DA9220/DA9132";
   849                  config_match = (chip_id == DA9121_TYPE_DA9220_DA9132);
   850                  break;
   851          case DA9122_VARIANT_VRC:
   852                  type = "DA9122/DA9131";
   853                  config_match = (chip_id == DA9121_TYPE_DA9122_DA9131);
   854                  break;
   855          case DA9217_VARIANT_VRC:
   856                  type = "DA9217";
   857                  config_match = (chip_id == DA9121_TYPE_DA9217);
   858                  break;
   859          default:
   860                  type = "Unknown";
   861                  break;
   862          }
   863  
   864          dev_info(chip->dev,
   865                   "Device detected (device-ID: 0x%02X, var-ID: 0x%02X, %s)\n",
   866                   device_id, variant_id, type);
   867  
   868          if (!config_match) {
   869                  dev_err(chip->dev, "Device tree configuration '%s' does not match detected device.\n", name);
                                                                                                               ^^^^
"name" is never set.  What did you want it to be?

   870                  ret = -EINVAL;
   871                  goto error;
   872          }
   873  
   874          variant_mrc = (variant_id & DA9121_MASK_OTP_VARIANT_ID_MRC)
   875                          >> DA9121_SHIFT_OTP_VARIANT_ID_MRC;
   876  
   877          if ((device_id == DA9121_DEVICE_ID) &&
   878              (variant_mrc < DA9121_VARIANT_MRC_BASE)) {
   879                  dev_err(chip->dev,
   880                          "Cannot support variant MRC: 0x%02X\n", variant_mrc);
   881                  ret = -EINVAL;
   882          }
   883  error:
   884          return ret;
   885  }

regards,
dan carpenter
