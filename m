Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E3BFDA817
	for <lists+kernel-janitors@lfdr.de>; Thu, 17 Oct 2019 11:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408462AbfJQJMk (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 17 Oct 2019 05:12:40 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:58054 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408451AbfJQJMj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 17 Oct 2019 05:12:39 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9H93ugn068229;
        Thu, 17 Oct 2019 09:12:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=Zrwqg2bLXgsav5RbPkzHmjIiiQ7AKGewzLzk8pHVAxU=;
 b=QI5e57E+HaKyYh//wP9cMvuKgbEn0cAlW2jqkKwDRen6u7svp+dclF2hUgpZkKQeFxyK
 SO9uYymR5P2lm+MekkTrNcU4kZ4j4vtQPTk17cB7hpIzbaM3VURDH3vEXIFmH09CpLoL
 PrR/0t16CdF37Cf8r6gqaG4jQCBFDNOKu8jIMvupeelJYdj37YXCAFsuJC4ocrGpTXgG
 zL5XWQ6N+V3buE0piuz9d7rK8gQm75TmekIPi+SeJhcI33J4NGJhgtzJfPYZEnJQW3nn
 IOQLx+bWqA7hChaQkK2Ai6lcqoalTcoNKCYp6v5kvE93nGygt4ydVHAv/MXtmUJg9KdG WA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 2vk68uvyg9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Oct 2019 09:12:29 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9H98RXO077953;
        Thu, 17 Oct 2019 09:12:29 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 2vp3bk9pac-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Oct 2019 09:12:29 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x9H9CPgp032685;
        Thu, 17 Oct 2019 09:12:26 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 17 Oct 2019 09:12:25 +0000
Date:   Thu, 17 Oct 2019 12:12:16 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Rex Zhu <rex.zhu@amd.com>, Jim Qu <Jim.Qu@amd.com>
Cc:     Evan Quan <evan.quan@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdgpu/vi: silence an uninitialized variable warning
Message-ID: <20191017091216.GA31278@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9412 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910170082
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9412 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910170082
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Smatch complains that we need to initialized "*cap" otherwise it can
lead to an uninitialized variable bug in the caller.  This seems like a
reasonable warning and it doesn't hurt to silence it at least.

drivers/gpu/drm/amd/amdgpu/vi.c:767 vi_asic_reset_method() error: uninitialized symbol 'baco_reset'.

Fixes: 425db2553e43 ("drm/amdgpu: expose BACO interfaces to upper level from PP")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/powerplay/amd_powerplay.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/powerplay/amd_powerplay.c b/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
index 83196b79edd5..f4ff15378e61 100644
--- a/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
+++ b/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
@@ -1421,6 +1421,7 @@ static int pp_get_asic_baco_capability(void *handle, bool *cap)
 {
 	struct pp_hwmgr *hwmgr = handle;
 
+	*cap = false;
 	if (!hwmgr)
 		return -EINVAL;
 
-- 
2.20.1

