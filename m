Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA33275340
	for <lists+kernel-janitors@lfdr.de>; Wed, 23 Sep 2020 10:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgIWIdB (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 23 Sep 2020 04:33:01 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:40788 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgIWIdB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 23 Sep 2020 04:33:01 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08N8Shb2108840;
        Wed, 23 Sep 2020 08:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=NdXDzPdjbfkaULNKbSWYA1LbQygF53AGsX+jS6bcmYs=;
 b=k77NYtKg3nNRzgM7+tlEDwtNYdlHE+Urg9at7ZfO1hQAEhAJRtKzH4iMdrbfjxsV3gKr
 XeOoDRDEhnBq43fAp7qrr3/uXWamQxtjvekjOJb5chsmCYlKZr9YW8v7NKRTwdETDiLL
 Q8eBstv16ac+deqOeVNn3h8YEIGDIpEwguvO38aeJ/xULvhKWKnJj9WJcLeBX0WaILFv
 6pg+BnvjBPQEXUMv0+s7GFeaLlSRZOfwR2mxl2rm2stZ3UP2Go8JK3beC1a3VeaPWkYs
 WD4qEGbGLzocySeSAQOBb6hVR7virCD0AjzwrkoRJ+gH0wV14dAB4B/HYMXK2cPpUXsP yw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 33ndnuh3qq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 23 Sep 2020 08:32:48 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08N8U1nh016306;
        Wed, 23 Sep 2020 08:32:47 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 33r28uu7qm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 23 Sep 2020 08:32:47 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08N8WghJ003938;
        Wed, 23 Sep 2020 08:32:46 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 23 Sep 2020 01:32:42 -0700
Date:   Wed, 23 Sep 2020 11:32:35 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>
Cc:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] soundwire: remove an unnecessary NULL check
Message-ID: <20200923083235.GB1454948@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9752 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009230069
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9752 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1011 impostorscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009230069
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "bus" pointer isn't NULL so the address to a non-zero offset in
middle of "bus" cannot be NULL.  Delete the NULL check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/soundwire/generic_bandwidth_allocation.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
index 6088775b67a5..fdc0db71360e 100644
--- a/drivers/soundwire/generic_bandwidth_allocation.c
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -342,15 +342,11 @@ static int sdw_select_row_col(struct sdw_bus *bus, int clk_freq)
 static int sdw_compute_bus_params(struct sdw_bus *bus)
 {
 	unsigned int max_dr_freq, curr_dr_freq = 0;
-	struct sdw_master_prop *mstr_prop = NULL;
+	struct sdw_master_prop *mstr_prop = &bus->prop;
 	int i, clk_values, ret;
 	bool is_gear = false;
 	u32 *clk_buf;
 
-	mstr_prop = &bus->prop;
-	if (!mstr_prop)
-		return -EINVAL;
-
 	if (mstr_prop->num_clk_gears) {
 		clk_values = mstr_prop->num_clk_gears;
 		clk_buf = mstr_prop->clk_gears;
-- 
2.28.0

