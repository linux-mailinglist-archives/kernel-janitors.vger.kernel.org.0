Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E52A390148
	for <lists+kernel-janitors@lfdr.de>; Tue, 25 May 2021 14:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232801AbhEYMs7 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 25 May 2021 08:48:59 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:37950 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231907AbhEYMs6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 25 May 2021 08:48:58 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14PCdZng092275;
        Tue, 25 May 2021 12:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=0fsajLiKq3dAG0qs/eZDP0WUC0DG6tj2wIx7UTbk6ug=;
 b=luEooYaQm2gZWD1cQgsISLJxeae76NyOxubEbc/uR1pKnWq3Q9ZbMGNxE2vmZhUzQ/77
 edoHDh/U3461ghgsGLjklW+CgP4kjNC1aH/JSo/ii++DVQIgm/sKhDptBwC0doIyNu7P
 Ts4WmqOF084yy/RoJwRUm/0Qdw+HK5gj9DeJjdhz1PFxZKdZyL8u7291+vSwjbb0KMOD
 Lnx6+8wCaIP2fACBtlZ7O/znA0JShXsuWK4fZF0ichWqy/AVfoxXzZx4OebAMT1BT2c+
 IBwHooHzEtI7R9dBYRfbxOOMfh4qHLEoEJuaX4418+h4VIogdP6aaiI2boO4HofU1MUV RQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 38q3q8wcxd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 25 May 2021 12:47:19 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14PCerbe064934;
        Tue, 25 May 2021 12:47:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 38reh9snkq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 25 May 2021 12:47:18 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14PClHLx110318;
        Tue, 25 May 2021 12:47:17 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 38reh9snjt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 25 May 2021 12:47:17 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 14PClAbP000784;
        Tue, 25 May 2021 12:47:10 GMT
Received: from mwanda (/10.175.166.49)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 25 May 2021 12:47:10 +0000
Date:   Tue, 25 May 2021 15:46:55 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Felix Kuehling <Felix.Kuehling@amd.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Ramesh Errabolu <Ramesh.Errabolu@amd.com>,
        Oak Zeng <Oak.Zeng@amd.com>, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 1/2] drm/amdgpu: add missing unreserve on error
Message-ID: <YKzxvyKEl/gNPg/r@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-GUID: mpE-O_OflR3KcX0cJ71_sicTnI4ZeKql
X-Proofpoint-ORIG-GUID: mpE-O_OflR3KcX0cJ71_sicTnI4ZeKql
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9994 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 clxscore=1011
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105250078
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The amdgpu_bo_unreserve() has to be done on the error path as well.

Fixes: b4f0f97b8f5f ("drm/amdgpu: Move kfd_mem_attach outside reservation")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 928e8d57cd08..68109908a869 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -624,11 +624,10 @@ kfd_mem_attach_userptr(struct amdgpu_device *adev, struct kgd_mem *mem,
 				       0, ttm_bo_type_sg,
 				       mem->bo->tbo.base.resv,
 				       &gobj);
+	amdgpu_bo_unreserve(mem->bo);
 	if (ret)
 		return ret;
 
-	amdgpu_bo_unreserve(mem->bo);
-
 	*bo = gem_to_amdgpu_bo(gobj);
 	(*bo)->parent = amdgpu_bo_ref(mem->bo);
 
-- 
2.30.2

