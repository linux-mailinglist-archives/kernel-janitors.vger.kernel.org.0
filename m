Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B20739C16
	for <lists+kernel-janitors@lfdr.de>; Sat,  8 Jun 2019 11:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbfFHJYS (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 8 Jun 2019 05:24:18 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:53094 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726478AbfFHJYS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 8 Jun 2019 05:24:18 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x589IQg0042082;
        Sat, 8 Jun 2019 09:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=UEF3RcNQbMOhraajwl43bUezUG05vQzOtXc/1mdAqAk=;
 b=HbS9hhY4LusW456YSOonTNPlWmqlBq701uOKqKe7BGWLQ38L/UyPxqt/5+y9oBKb9p7Q
 T9ovTncV1/xBFq7I9rUdC0ND0WvpnDUnqaMD77IfzyfdLN46cfRl8U67wBMry4AD9saW
 SH1b6cFPZr4mElF9AK+IDFPnyVhceYPSxAMdtSZLPTriz6h5mycidljdn4sgda0mtIvE
 DknS82qxTT5wNWyhOV8liIkdwcuzGpdfqWZKP28ihIzBLQ5M59zT9n60VkC8iwKuYxPc
 1Sv+tOSO5HtpG0BxbU4Azr9W3C0OyLWRGlPgKt7Nj3oCMvQnoE2E+JvgNgBoSuA8iMks Kw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2130.oracle.com with ESMTP id 2t02he8vnn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 08 Jun 2019 09:24:11 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x589OA4T019708;
        Sat, 8 Jun 2019 09:24:10 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 2t0aa900ke-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 08 Jun 2019 09:24:10 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x589O7cj030247;
        Sat, 8 Jun 2019 09:24:07 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sat, 08 Jun 2019 02:24:06 -0700
Date:   Sat, 8 Jun 2019 12:23:57 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Alex Deucher <alexander.deucher@amd.com>,
        xinhui pan <xinhui.pan@amd.com>
Cc:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Evan Quan <evan.quan@amd.com>,
        James Zhu <James.Zhu@amd.com>, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdgpu: Fix bounds checking in amdgpu_ras_is_supported()
Message-ID: <20190608092357.GB28890@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9281 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906080071
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9281 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906080071
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "block" variable can be set by the user through debugfs, so it can
be quite large which leads to shift wrapping here.  This means we report
a "block" as supported when it's not, and that leads to array overflows
later on.

This bug is not really a security issue in real life, because debugfs is
generally root only.

Fixes: 36ea1bd2d084 ("drm/amdgpu: add debugfs ctrl node")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
index c6b34fbd695f..94c652f5265a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
@@ -173,6 +173,8 @@ static inline int amdgpu_ras_is_supported(struct amdgpu_device *adev,
 {
 	struct amdgpu_ras *ras = amdgpu_ras_get_context(adev);
 
+	if (block >= AMDGPU_RAS_BLOCK_COUNT)
+		return 0;
 	return ras && (ras->supported & (1 << block));
 }
 
-- 
2.20.1

