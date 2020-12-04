Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 029A92CF023
	for <lists+kernel-janitors@lfdr.de>; Fri,  4 Dec 2020 15:59:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388319AbgLDO6P (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 4 Dec 2020 09:58:15 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:59388 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388259AbgLDO6P (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 4 Dec 2020 09:58:15 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B4Enf8W064652;
        Fri, 4 Dec 2020 14:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=KtAzk/SjtGg6cuZ5XNzn0KXUckw2hOjqQnE6W8l2AVk=;
 b=L960D1wZJz2J/w+HzKZaaViu4Ce8lOZip7Q1PlPLyNBGjwlisyLNmBw8bSwVXrETWIKd
 D7z28rQhTVUkGBSYwuwgJALhUdEtGDDHpLh7dxwTYe1yRK6sS6ty5sdoGmBtAwkyfiDc
 UVEWx/ylNWLjuIE4yPDAO0nTtLmFZDWPQt0KdRtdMGlFMFNoIIcGF+G1cGf2zDQtAQ0p
 dSBkS2zdbGzUPqYPUxl9xrT8c2vyzC3Agjsp7w1UegRXdC+ulJSQjxpzKqwOJLrq5Rjv
 HK6TgbETKQLgKI+RXXBKbJVRFhWO9L9RdWh2bqfMyKp3tXkgcXyDgfiwYazu1ITlX5Ex ng== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 353dyr3k60-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 04 Dec 2020 14:57:30 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B4EpUK9061197;
        Fri, 4 Dec 2020 14:57:30 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 3540g3s6qh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 04 Dec 2020 14:57:30 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B4EvTDK022958;
        Fri, 4 Dec 2020 14:57:29 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 04 Dec 2020 06:57:28 -0800
Date:   Fri, 4 Dec 2020 17:57:23 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Adam.Ward.opensource@diasemi.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] regulator: da9121: Add support for device variants via
 devicetree
Message-ID: <X8pOUyVj5Q8iQYJI@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9824 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=3
 phishscore=0 mlxlogscore=999 adultscore=0 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012040086
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9824 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0
 clxscore=1011 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=3 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012040086
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Adam Ward,

The patch 46c413d5bb23: "regulator: da9121: Add support for device
variants via devicetree" from Nov 30, 2020, leads to the following
static checker warning:

	drivers/regulator/da9121-regulator.c:383 da9121_of_parse_cb()
	warn: array off by one? 'da9121_matches[pdata->num_buck]'

drivers/regulator/da9121-regulator.c
   348  static int da9121_of_parse_cb(struct device_node *np,
   349                                  const struct regulator_desc *desc,
   350                                  struct regulator_config *config)
   351  {
   352          struct da9121 *chip = config->driver_data;
   353          struct da9121_pdata *pdata;
   354          struct gpio_desc *ena_gpiod;
   355  
   356          if (chip->pdata == NULL) {
   357                  pdata = devm_kzalloc(chip->dev, sizeof(*pdata), GFP_KERNEL);
   358                  if (!pdata)
   359                          return -ENOMEM;
   360          } else {
   361                  pdata = chip->pdata;
   362          }
   363  
   364          pdata->num_buck++;
   365  
   366          if (pdata->num_buck > variant_parameters[chip->variant_id].num_bucks) {
                                    ^^
Smatch is complaining that this sort of looks like it should be >=
instead of >.  This looks true to me as well, but I'm not positive
enough to actually send a patch.  :P

   367                  dev_err(chip->dev, "Error: excessive regulators for device\n");
   368                  return -ENODEV;
   369          }
   370  
   371          ena_gpiod = fwnode_gpiod_get_index(of_fwnode_handle(np), "enable", 0,
   372                                                  GPIOD_OUT_HIGH |
   373                                                  GPIOD_FLAGS_BIT_NONEXCLUSIVE,
   374                                                  "da9121-enable");
   375          if (!IS_ERR(ena_gpiod))
   376                  config->ena_gpiod = ena_gpiod;
   377  
   378          if (variant_parameters[chip->variant_id].num_bucks == 2) {
   379                  uint32_t ripple_cancel;
   380                  uint32_t ripple_reg;
   381                  int ret;
   382  
   383                  if (of_property_read_u32(da9121_matches[pdata->num_buck].of_node,
                                                                ^^^^^^^^^^^^^^^
We know that .num_bucks is 2 here so if ->num_buck is == to that then
this is one element beyond the end of the array.

   384                                  "dlg,ripple-cancel", &ripple_cancel)) {
   385                          if (pdata->num_buck > 1)
   386                                  ripple_reg = DA9xxx_REG_BUCK_BUCK2_7;
   387                          else
   388                                  ripple_reg = DA9121_REG_BUCK_BUCK1_7;
   389  
   390                          ret = regmap_update_bits(chip->regmap, ripple_reg,
   391                                  DA9xxx_MASK_BUCK_BUCKx_7_CHx_RIPPLE_CANCEL,
   392                                  ripple_cancel);
   393                          if (ret < 0)

regards,
dan carpenter
