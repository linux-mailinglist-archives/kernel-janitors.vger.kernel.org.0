Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 411CE182F4A
	for <lists+kernel-janitors@lfdr.de>; Thu, 12 Mar 2020 12:32:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgCLLcw (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 12 Mar 2020 07:32:52 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:55132 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbgCLLcw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 12 Mar 2020 07:32:52 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02CBWdjc162841;
        Thu, 12 Mar 2020 11:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=uBxfOinEsrPuSFMEjQOljNqSVh8pwdRLqmL1x2gjrSY=;
 b=EdoSXSYNIJDXsJdBSj5phWE6PUHiEsCvEqV61pPDwftNNbOuPRn6k26TWctNwhK3vXhP
 5H/ETEqfXdAqrWrMJ7khsKA6LAuWi5iDeIy4Sj9kOgN8nsneyIWQypjyWnwzmxq8EYWO
 bKR+mzozxtaoFNc59d6A9wsAxOxHfAUVpkyzC6xOkPApA2REVhD/r5cpauQJBSPsY/ei
 8hyW49m7JomnLyf7o7miyz6FTEPUTQVI2TAQGMbMr6rzvMfjX99RuZbIOYk4hXrZf2wk
 zzw/galrXZZE+rcJgpqbkC/6Jg11xA1Vv7XIa4LLpSmkkxYtRFlrj2cx8i8VdgiGN5D5 Ag== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 2ym31us21t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 12 Mar 2020 11:32:46 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02CBNEhI102484;
        Thu, 12 Mar 2020 11:32:45 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 2yp8p71yrh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 12 Mar 2020 11:32:44 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02CBWgjQ024237;
        Thu, 12 Mar 2020 11:32:42 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 12 Mar 2020 04:32:41 -0700
Date:   Thu, 12 Mar 2020 14:32:31 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Harry Wentland <harry.wentland@amd.com>
Cc:     Leo Li <sunpeng.li@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
        Wyatt Wood <wyatt.wood@amd.com>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        amd-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amd/display: clean up a condition in
 dmub_psr_copy_settings()
Message-ID: <20200312113231.GD20562@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9557 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 phishscore=0
 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003120062
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9557 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003120063
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

We can remove the NULL check for "res_ctx" and
"res_ctx->pipe_ctx[i].stream->link".  Also it's nicer to align the
conditions using spaces so I re-indented a bit.

Longer explanation: The "res_ctx" pointer points to an address in the
middle of a struct so it can't be NULL.  For
"res_ctx->pipe_ctx[i].stream->link" we know that it is equal to "link"
and "link" is non-NULL.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
index 9c88a92bd96a..bc109d4fc6e6 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
@@ -134,11 +134,9 @@ static bool dmub_psr_copy_settings(struct dmub_psr *dmub,
 	int i = 0;
 
 	for (i = 0; i < MAX_PIPES; i++) {
-		if (res_ctx &&
-			res_ctx->pipe_ctx[i].stream &&
-			res_ctx->pipe_ctx[i].stream->link &&
-			res_ctx->pipe_ctx[i].stream->link == link &&
-			res_ctx->pipe_ctx[i].stream->link->connector_signal == SIGNAL_TYPE_EDP) {
+		if (res_ctx->pipe_ctx[i].stream &&
+		    res_ctx->pipe_ctx[i].stream->link == link &&
+		    res_ctx->pipe_ctx[i].stream->link->connector_signal == SIGNAL_TYPE_EDP) {
 			pipe_ctx = &res_ctx->pipe_ctx[i];
 			break;
 		}
-- 
2.20.1

