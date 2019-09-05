Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 637F7A9F05
	for <lists+kernel-janitors@lfdr.de>; Thu,  5 Sep 2019 11:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732683AbfIEJ6c (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 5 Sep 2019 05:58:32 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:36524 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731008AbfIEJ6c (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 5 Sep 2019 05:58:32 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x859sa5v183513;
        Thu, 5 Sep 2019 09:58:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=bRXTxFT7Sr9V0GfDBZ9vB+9b6J97Qt739cgUg+W3u6c=;
 b=QvsVtWILLcymGGKaWa0va9dOE2K6fI1xllPLP4yyNPhhnSR5q2FwhVIe3sWr4elaV5KR
 1DtsJWDO2bo3hdHqfmv61stpDO2Hho2++13bWRx6OjhO6cCLKNWvOV/x04mFWn6GgrWY
 nhbylxtDXi9sIys1QmQ7cn3tKkBfjggkEPpxqmDr8VRLACeQGvdmD9gLZiKDKeTG/R11
 KucUSj5Pqy7Dhhm8XqYuQf5SSK98YEwUnUNKudQ681oNzBbube3ypxZ8xyx2zXa+v9TU
 3AuCOsJdFYttGAMDfbj6JCoGqezD30iEYLA6g3ufxaga2qooEB9Qxd1rL3oRMK5OFJ+M /w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 2utyt8r3u1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 05 Sep 2019 09:58:27 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x859wOZ6040455;
        Thu, 5 Sep 2019 09:58:26 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 2usu52wbar-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 05 Sep 2019 09:58:24 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x859w0Pu015513;
        Thu, 5 Sep 2019 09:58:00 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 05 Sep 2019 02:58:00 -0700
Date:   Thu, 5 Sep 2019 12:57:54 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     valex@mellanox.com
Cc:     Alex Vesker <valex@mellanox.com>, kernel-janitors@vger.kernel.org
Subject: [bug report] net/mlx5: DR, Add Steering entry (STE) utilities
Message-ID: <20190905095754.GA26074@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9370 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=882
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909050101
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9370 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=949 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909050100
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Alex Vesker,

The patch 26d688e33f88: "net/mlx5: DR, Add Steering entry (STE)
utilities" from Aug 19, 2019, leads to the following static checker
warning:

	drivers/net/ethernet/mellanox/mlx5/core/steering/dr_ste.c:271 mlx5dr_ste_get_miss_addr()
	warn: potential shift truncation.  '0xff (0-255) << 26'

drivers/net/ethernet/mellanox/mlx5/core/steering/dr_ste.c
   267  u64 mlx5dr_ste_get_miss_addr(u8 *hw_ste)
   268  {
   269          u64 index =
   270                  (MLX5_GET(ste_rx_steering_mult, hw_ste, miss_address_31_6) |
   271                   MLX5_GET(ste_rx_steering_mult, hw_ste, miss_address_39_32) << 26);
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Smatch thinks this needs to be cast to u64.

   272  
   273          return index << 6;
   274  }

regards,
dan carpenter
