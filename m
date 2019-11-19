Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1DB101950
	for <lists+kernel-janitors@lfdr.de>; Tue, 19 Nov 2019 07:22:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726783AbfKSGW4 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 19 Nov 2019 01:22:56 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:33892 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbfKSGW4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 19 Nov 2019 01:22:56 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAJ69Eev164700;
        Tue, 19 Nov 2019 06:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=9lMAVdZmqunEHTeR9Pw/bm04VjeAmoiSeFOuzg5AcY0=;
 b=Oj9NWZuXFka/ED1tW8BuZewvbADre30J82Kb6hLw0zXdzfNr+UWcv1LHFJf3zqUjkpqE
 ldqLFOlJ43Kfdoc+dPfeRyE3plwHcG6IBAoYvXPTPx6dx2fr0N1iczaVXwERUSwOe/ER
 mKkTddtq1MJ+NrbyyEE+sp6lbEKx+pGqeAhfDlx0jdFipfRsoOQ0VQVawvcG1FKiXl+x
 LmNnkvQNCSIEXF3eRKOMPUR4LJRPdV7hXl100IzAA6beODscAapY0c8968xgL63cTcNo
 Y5PfDIqZtdnkNom3HunCHmjK22BWoMVN+emlrL2OOPEi5N282On1CI4+1YmfshFtoifU FA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 2wa8htmtrd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 19 Nov 2019 06:22:47 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAJ68tBu105722;
        Tue, 19 Nov 2019 06:22:46 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 2wbxm3r2b0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 19 Nov 2019 06:22:46 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xAJ6MiKr032082;
        Tue, 19 Nov 2019 06:22:44 GMT
Received: from kili.mountain (/41.210.141.188)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 18 Nov 2019 22:22:44 -0800
Date:   Tue, 19 Nov 2019 09:22:32 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     rui_feng@realsil.com.cn
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] misc: rtsx: Add support for RTS5261
Message-ID: <20191118064150.ambybsbmnx4treko@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9445 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=841
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911190057
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9445 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=906 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911190057
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Rui Feng,

The patch c0e5f4e73a71: "misc: rtsx: Add support for RTS5261" from
Oct 21, 2019, leads to the following static checker warning:

	drivers/misc/cardreader/rts5261.c:667 rts5261_pci_switch_clock()
	warn: impossible condition '(n > 396) => (0-255 > 396)'

drivers/misc/cardreader/rts5261.c
   657          pcr_dbg(pcr, "Internal SSC clock: %dMHz (cur_clock = %d)\n",
   658                  clk, pcr->cur_clock);
   659  
   660          if (clk == pcr->cur_clock)
   661                  return 0;
   662  
   663          if (pcr->ops->conv_clk_and_div_n)
   664                  n = (u8)pcr->ops->conv_clk_and_div_n(clk, CLK_TO_DIV_N);
   665          else
   666                  n = (u8)(clk - 4);
                        ^^^^^^^^^^^^^^^^^

   667          if ((clk <= 4) || (n > 396))
                                   ^^^^^^^
A u8 can only go up to 255.

   668                  return -EINVAL;
   669  
   670          mcu_cnt = (u8)(125/clk + 3);
   671          if (mcu_cnt > 15)
   672                  mcu_cnt = 15;
   673  

regards,
dan carpenter
