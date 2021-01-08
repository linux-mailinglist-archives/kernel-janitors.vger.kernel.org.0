Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD9DD2EF2EE
	for <lists+kernel-janitors@lfdr.de>; Fri,  8 Jan 2021 14:17:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbhAHNRY (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 8 Jan 2021 08:17:24 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:34944 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726205AbhAHNRY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 8 Jan 2021 08:17:24 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 108DF5N2079168;
        Fri, 8 Jan 2021 13:16:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=oqrN4/dFh/AfLdY1vdLZ5umbmgdxHFWXO6a4JWvieag=;
 b=YZQGnY4vAGuDg0BLK121Ubwa9mR9ngEYpLvUShHdigZo0UCsMbjXabCaJ4GFPzHdemLO
 2gu70ogjj5dKRb4eSXCZ5+k7SyYbb2QQAcEGtxKV4rQ0zDfVmBcYFxcCyRZaadMLRati
 id88hJCVCVfaVr7G6VSpv0Vuxfb+as46AvHriIafKeY2bEBhIVHMHPhus9WO6l8EW1Rh
 0C0A2Ejbz4qGoZtj6WYYEjNUYSIlCHgqSWE6CPRrrBmhH78hJ+ep0IdhixmnQnGA7EZC
 0p37PSyFUQX2R0zcQbBEOzx49Z7ULoVGN4f0xA7YZkQ5Bgkx+6peqvCAr/dBNdNNVqyz gQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 35wepmh0ej-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 08 Jan 2021 13:16:42 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 108DEV8s041685;
        Fri, 8 Jan 2021 13:16:41 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 35w3qvejgs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 08 Jan 2021 13:16:41 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 108DGeSe020567;
        Fri, 8 Jan 2021 13:16:41 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 08 Jan 2021 05:16:40 -0800
Date:   Fri, 8 Jan 2021 16:16:31 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kliteyn@nvidia.com
Cc:     kernel-janitors@vger.kernel.org, Saeed Mahameed <saeedm@nvidia.com>
Subject: [bug report] net/mlx5: DR, Move STEv0 setters and getters
Message-ID: <X/hbL24ZTflzKF09@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9857 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=817 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101080075
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9857 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 clxscore=1011 mlxlogscore=828
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101080075
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Yevgeny Kliteynik,

The patch 6b93b400aa88: "net/mlx5: DR, Move STEv0 setters and
getters" from Nov 19, 2020, leads to the following static checker
warning:

	drivers/net/ethernet/mellanox/mlx5/core/steering/dr_ste_v0.c:252 dr_ste_v0_get_miss_addr()
	warn: potential shift truncation.  '0xff (0-255) << 26'

drivers/net/ethernet/mellanox/mlx5/core/steering/dr_ste_v0.c
   248  static u64 dr_ste_v0_get_miss_addr(u8 *hw_ste_p)
   249  {
   250          u64 index =
   251                  (MLX5_GET(ste_rx_steering_mult, hw_ste_p, miss_address_31_6) |
   252                   MLX5_GET(ste_rx_steering_mult, hw_ste_p, miss_address_39_32) << 26);
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This is shifting a u32 value in the 0-255 range by << 26 which could
result in shift wrapping.  "index" is a u64 but ORing two u32 values
will result in a u32.

   253  
   254          return index << 6;
   255  }

regards,
dan carpenter
