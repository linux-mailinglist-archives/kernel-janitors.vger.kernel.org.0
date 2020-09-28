Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8962E27B386
	for <lists+kernel-janitors@lfdr.de>; Mon, 28 Sep 2020 19:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbgI1Rp0 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 28 Sep 2020 13:45:26 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:50694 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726328AbgI1Rp0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 28 Sep 2020 13:45:26 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08SHj0xW049170;
        Mon, 28 Sep 2020 17:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=GmJzsQiJa7WMJlXhRWurO8SiOX7Ik2Gbtdmr6BOo0VE=;
 b=pX1j3rbC3eWRHqY7v9JRsKkV8xg2d3dvHiK+7rFY/yxbxfHQAVlhOCdHJ9ooT2QObXIs
 4TvUAYEo0pxy4YOIDsZOEJnsaz1hRBJWD39LanmcbeLjisHMdgR0/tGy6Uw6js4LV+Gy
 yjmm3cE6cW2uxeG3MeiPNXOszD4S/LMV++T6BqVJP63ocugx9lo+h9jlUTaNO7Jc7k3L
 FtVzoPXCJxIgkn6GrUDqhfxWgciCHxtPwrpZg4QbwzwkkkPCqwQKcFoAUTloU0wxcA/o
 oNkGIw4/rshdBQ+jprjml9ACrVpf75f0Z2OH091tEVkqlJvVTpKizOxhQ6WdE72ABQcx zw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 33sx9mxdda-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 28 Sep 2020 17:45:22 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08SHilDK112434;
        Mon, 28 Sep 2020 17:45:21 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 33tf7km9v9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 28 Sep 2020 17:45:21 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08SHjL4E010496;
        Mon, 28 Sep 2020 17:45:21 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 28 Sep 2020 10:45:20 -0700
Date:   Mon, 28 Sep 2020 20:45:15 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     ioana.ciornei@nxp.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] dpaa2-mac: add PCS support through the Lynx module
Message-ID: <20200928174515.GB446603@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9758 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=866
 suspectscore=3 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009280138
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9758 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=872 suspectscore=3
 phishscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 clxscore=1011
 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009280138
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Ioana Ciornei,

The patch 94ae899b2096: "dpaa2-mac: add PCS support through the Lynx
module" from Sep 23, 2020, leads to the following static checker
warning:

	drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c:296 dpaa2_pcs_destroy()
	warn: variable dereferenced before check 'pcs' (see line 294)

drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c
   291  static void dpaa2_pcs_destroy(struct dpaa2_mac *mac)
   292  {
   293          struct lynx_pcs *pcs = mac->pcs;
   294          struct device *dev = &pcs->mdio->dev;
                                      ^^^^^^^^^
Dereference

   295  
   296          if (pcs) {
                    ^^^
Checked too late.  It looks like "pcs" can be NULL because I get a
warning in the caller as well.

  drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c:389 dpaa2_mac_connect()
  error: we previously assumed 'mac->pcs' could be null (see line 373)

   297                  lynx_pcs_destroy(pcs);
   298                  put_device(dev);
   299                  mac->pcs = NULL;
   300          }
   301  }

regards,
dan carpenter
