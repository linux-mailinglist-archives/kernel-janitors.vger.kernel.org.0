Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F3EC30B785
	for <lists+kernel-janitors@lfdr.de>; Tue,  2 Feb 2021 06:59:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231920AbhBBF5r (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 2 Feb 2021 00:57:47 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:53002 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231923AbhBBF5p (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 2 Feb 2021 00:57:45 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1125nUUr119900;
        Tue, 2 Feb 2021 05:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=9IuKZtvrE56xfifC04umU53E2kdecYzftZfmTwMIrGk=;
 b=I0pbUQZGzDkxskJVMgq1+a3gB5oiBOQMRa+5XL+Wvl0FRaJdMaR8vbrZtNyr9PTn8uLK
 nMjQweElT3OoqDy92afctO+S3stRs4OI+0/Smgl9VBBvfvTk2+JwhBK977LQolPtYiM+
 SWs0iUgD9kJaHjvlzKTq7qwjgyjjC35Z1X+T5gnVvo0+2zfyzHglvpAaKLJvBps5/pM1
 rl6gHfMGbHabAT7Lcu6NSTH1MYogjigpzDX4fQLuiP2IBigB/4Xk4zDbc+2fUEGVw1wX
 BWSUDbjpgfQuHaZbjl22wE4Ec6LRFSHEA9AdNHdYDo4ORgQ0vbBNQ43NII7CJUpml3kA kQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2130.oracle.com with ESMTP id 36cvyas4ck-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 02 Feb 2021 05:56:58 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1125st8t183439;
        Tue, 2 Feb 2021 05:56:56 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 36dhbxqs6q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 02 Feb 2021 05:56:56 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 1125uiTN007720;
        Tue, 2 Feb 2021 05:56:45 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 01 Feb 2021 21:56:44 -0800
Date:   Tue, 2 Feb 2021 08:56:36 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Alex Deucher <alexander.deucher@amd.com>
Cc:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Evan Quan <evan.quan@amd.com>,
        Nirmoy Das <nirmoy.das@amd.com>,
        Kevin Wang <kevin1.wang@amd.com>,
        Huang Rui <ray.huang@amd.com>,
        Xiaojian Du <Xiaojian.Du@amd.com>,
        Eric Huang <JinHuiEric.Huang@amd.com>,
        amd-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdgpu: Prevent shift wrapping in amdgpu_read_mask()
Message-ID: <YBjplLOof9J1E2o5@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9882 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 suspectscore=0
 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102020041
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9882 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011 impostorscore=0
 mlxscore=0 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102020040
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If the user passes a "level" value which is higher than 31 then that
leads to shift wrapping.  The undefined behavior will lead to a
syzkaller stack dump.

Fixes: 5632708f4452 ("drm/amd/powerplay: add dpm force multiple levels on cz/tonga/fiji/polaris (v2)")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/pm/amdgpu_pm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index e9b569b76716..1a4010fcf561 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -1094,7 +1094,7 @@ static ssize_t amdgpu_get_pp_dpm_sclk(struct device *dev,
 static ssize_t amdgpu_read_mask(const char *buf, size_t count, uint32_t *mask)
 {
 	int ret;
-	long level;
+	unsigned long level;
 	char *sub_str = NULL;
 	char *tmp;
 	char buf_cpy[AMDGPU_MASK_BUF_MAX + 1];
@@ -1109,9 +1109,9 @@ static ssize_t amdgpu_read_mask(const char *buf, size_t count, uint32_t *mask)
 	tmp = buf_cpy;
 	while (tmp[0]) {
 		sub_str = strsep(&tmp, delimiter);
-		if (strlen(sub_str)) {
-			ret = kstrtol(sub_str, 0, &level);
-			if (ret)
+		if (sub_str[0]) {
+			ret = kstrtoul(sub_str, 0, &level);
+			if (ret || level > 31)
 				return -EINVAL;
 			*mask |= 1 << level;
 		} else
-- 
2.29.2

