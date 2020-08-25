Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 635A8251759
	for <lists+kernel-janitors@lfdr.de>; Tue, 25 Aug 2020 13:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729930AbgHYLVM (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 25 Aug 2020 07:21:12 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:36004 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729927AbgHYLVF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 25 Aug 2020 07:21:05 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07PBJKwm188981;
        Tue, 25 Aug 2020 11:21:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=MVDxC/tS9QM4a6gbjwooLLZ/JP3VVjFeFWTQB67Jfdg=;
 b=J/nLNzV/Tce7UX7S19AIEwZBw/wl+Ov1pqJRPOY8VvxCA9+GpJAHDmUzRhUrVF+sE+ZD
 cM8PiPUn2JRGrgImMzDPcuNe8WZjBNYXaAtIwy3TpnVwIgr24J1THJFTytd+8X6D6Mn0
 tzXody43XMe5cVaj3mf1IIqVhZ3fOfIzwx/MJY12Pd9QCyFH3u2+jscLX+YZEcN6I1iw
 mj0jwwmYL5nukOiO/uPQpB8h8qlXDK+OKtDSAn+ChTRqw6FfS2IelNgE6pYiPsQD/v8w
 F2O6TONNLgk3UOyCDPIPO4cnPqP5XjX3qUR8FsI+2kale5yDTQm+HPg5ukgRuX14tFah 3g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 333w6trd8v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 25 Aug 2020 11:21:00 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07PBEkdK144851;
        Tue, 25 Aug 2020 11:18:59 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 333r9jrqfb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 25 Aug 2020 11:18:59 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 07PBIqw1029242;
        Tue, 25 Aug 2020 11:18:52 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 25 Aug 2020 04:18:52 -0700
Date:   Tue, 25 Aug 2020 14:18:43 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Alex Deucher <alexander.deucher@amd.com>
Cc:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Sonny Jiang <sonny.jiang@amd.com>,
        Hawking Zhang <Hawking.Zhang@amd.com>,
        Alex Jivin <alex.jivin@amd.com>, Monk Liu <Monk.Liu@amd.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Frederick Lawler <fred@fredlawl.com>,
        amd-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 1/3] drm/amdgpu/si: Fix buffer overflow in
 si_get_register_value()
Message-ID: <20200825111843.GA285523@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9723 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 bulkscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008250085
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9723 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 impostorscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1011 mlxscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008250086
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The values for "se_num" and "sh_num" come from the user in the ioctl.
They can be in the 0-255 range but if they're more than
AMDGPU_GFX_MAX_SE (4) or AMDGPU_GFX_MAX_SH_PER_SE (2) then it results in
an out of bounds read.

I split this function into to two to make the error handling simpler.

Fixes: dd5dfa61b4ff ("drm/amdgpu: refine si_read_register")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/amdgpu/si.c | 157 +++++++++++++++++---------------
 1 file changed, 85 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/si.c b/drivers/gpu/drm/amd/amdgpu/si.c
index e330884edd19..ccf39a6932ae 100644
--- a/drivers/gpu/drm/amd/amdgpu/si.c
+++ b/drivers/gpu/drm/amd/amdgpu/si.c
@@ -1051,81 +1051,90 @@ static struct amdgpu_allowed_register_entry si_allowed_read_registers[] = {
 	{PA_SC_RASTER_CONFIG, true},
 };
 
-static uint32_t si_get_register_value(struct amdgpu_device *adev,
-				      bool indexed, u32 se_num,
-				      u32 sh_num, u32 reg_offset)
-{
-	if (indexed) {
-		uint32_t val;
-		unsigned se_idx = (se_num == 0xffffffff) ? 0 : se_num;
-		unsigned sh_idx = (sh_num == 0xffffffff) ? 0 : sh_num;
-
-		switch (reg_offset) {
-		case mmCC_RB_BACKEND_DISABLE:
-			return adev->gfx.config.rb_config[se_idx][sh_idx].rb_backend_disable;
-		case mmGC_USER_RB_BACKEND_DISABLE:
-			return adev->gfx.config.rb_config[se_idx][sh_idx].user_rb_backend_disable;
-		case mmPA_SC_RASTER_CONFIG:
-			return adev->gfx.config.rb_config[se_idx][sh_idx].raster_config;
-		}
+static int si_get_register_value_indexed(struct amdgpu_device *adev,
+					  u32 se_num, u32 sh_num,
+					  u32 reg_offset, u32 *value)
+{
+	unsigned se_idx = (se_num == 0xffffffff) ? 0 : se_num;
+	unsigned sh_idx = (sh_num == 0xffffffff) ? 0 : sh_num;
 
-		mutex_lock(&adev->grbm_idx_mutex);
-		if (se_num != 0xffffffff || sh_num != 0xffffffff)
-			amdgpu_gfx_select_se_sh(adev, se_num, sh_num, 0xffffffff);
+	if (se_idx >= AMDGPU_GFX_MAX_SE ||
+	    sh_idx >= AMDGPU_GFX_MAX_SH_PER_SE)
+		return -EINVAL;
 
-		val = RREG32(reg_offset);
+	switch (reg_offset) {
+	case mmCC_RB_BACKEND_DISABLE:
+		*value = adev->gfx.config.rb_config[se_idx][sh_idx].rb_backend_disable;
+		return 0;
+	case mmGC_USER_RB_BACKEND_DISABLE:
+		*value = adev->gfx.config.rb_config[se_idx][sh_idx].user_rb_backend_disable;
+		return 0;
+	case mmPA_SC_RASTER_CONFIG:
+		*value = adev->gfx.config.rb_config[se_idx][sh_idx].raster_config;
+		return 0;
+	}
 
-		if (se_num != 0xffffffff || sh_num != 0xffffffff)
-			amdgpu_gfx_select_se_sh(adev, 0xffffffff, 0xffffffff, 0xffffffff);
-		mutex_unlock(&adev->grbm_idx_mutex);
-		return val;
-	} else {
-		unsigned idx;
-
-		switch (reg_offset) {
-		case mmGB_ADDR_CONFIG:
-			return adev->gfx.config.gb_addr_config;
-		case mmMC_ARB_RAMCFG:
-			return adev->gfx.config.mc_arb_ramcfg;
-		case mmGB_TILE_MODE0:
-		case mmGB_TILE_MODE1:
-		case mmGB_TILE_MODE2:
-		case mmGB_TILE_MODE3:
-		case mmGB_TILE_MODE4:
-		case mmGB_TILE_MODE5:
-		case mmGB_TILE_MODE6:
-		case mmGB_TILE_MODE7:
-		case mmGB_TILE_MODE8:
-		case mmGB_TILE_MODE9:
-		case mmGB_TILE_MODE10:
-		case mmGB_TILE_MODE11:
-		case mmGB_TILE_MODE12:
-		case mmGB_TILE_MODE13:
-		case mmGB_TILE_MODE14:
-		case mmGB_TILE_MODE15:
-		case mmGB_TILE_MODE16:
-		case mmGB_TILE_MODE17:
-		case mmGB_TILE_MODE18:
-		case mmGB_TILE_MODE19:
-		case mmGB_TILE_MODE20:
-		case mmGB_TILE_MODE21:
-		case mmGB_TILE_MODE22:
-		case mmGB_TILE_MODE23:
-		case mmGB_TILE_MODE24:
-		case mmGB_TILE_MODE25:
-		case mmGB_TILE_MODE26:
-		case mmGB_TILE_MODE27:
-		case mmGB_TILE_MODE28:
-		case mmGB_TILE_MODE29:
-		case mmGB_TILE_MODE30:
-		case mmGB_TILE_MODE31:
-			idx = (reg_offset - mmGB_TILE_MODE0);
-			return adev->gfx.config.tile_mode_array[idx];
-		default:
-			return RREG32(reg_offset);
-		}
+	mutex_lock(&adev->grbm_idx_mutex);
+	if (se_num != 0xffffffff || sh_num != 0xffffffff)
+		amdgpu_gfx_select_se_sh(adev, se_num, sh_num, 0xffffffff);
+
+	*value = RREG32(reg_offset);
+
+	if (se_num != 0xffffffff || sh_num != 0xffffffff)
+		amdgpu_gfx_select_se_sh(adev, 0xffffffff, 0xffffffff, 0xffffffff);
+	mutex_unlock(&adev->grbm_idx_mutex);
+	return 0;
+}
+
+static uint32_t si_get_register_value(struct amdgpu_device *adev,
+				      u32 reg_offset)
+{
+	unsigned idx;
+
+	switch (reg_offset) {
+	case mmGB_ADDR_CONFIG:
+		return adev->gfx.config.gb_addr_config;
+	case mmMC_ARB_RAMCFG:
+		return adev->gfx.config.mc_arb_ramcfg;
+	case mmGB_TILE_MODE0:
+	case mmGB_TILE_MODE1:
+	case mmGB_TILE_MODE2:
+	case mmGB_TILE_MODE3:
+	case mmGB_TILE_MODE4:
+	case mmGB_TILE_MODE5:
+	case mmGB_TILE_MODE6:
+	case mmGB_TILE_MODE7:
+	case mmGB_TILE_MODE8:
+	case mmGB_TILE_MODE9:
+	case mmGB_TILE_MODE10:
+	case mmGB_TILE_MODE11:
+	case mmGB_TILE_MODE12:
+	case mmGB_TILE_MODE13:
+	case mmGB_TILE_MODE14:
+	case mmGB_TILE_MODE15:
+	case mmGB_TILE_MODE16:
+	case mmGB_TILE_MODE17:
+	case mmGB_TILE_MODE18:
+	case mmGB_TILE_MODE19:
+	case mmGB_TILE_MODE20:
+	case mmGB_TILE_MODE21:
+	case mmGB_TILE_MODE22:
+	case mmGB_TILE_MODE23:
+	case mmGB_TILE_MODE24:
+	case mmGB_TILE_MODE25:
+	case mmGB_TILE_MODE26:
+	case mmGB_TILE_MODE27:
+	case mmGB_TILE_MODE28:
+	case mmGB_TILE_MODE29:
+	case mmGB_TILE_MODE30:
+	case mmGB_TILE_MODE31:
+		idx = (reg_offset - mmGB_TILE_MODE0);
+		return adev->gfx.config.tile_mode_array[idx];
+	default:
+		return RREG32(reg_offset);
 	}
 }
+
 static int si_read_register(struct amdgpu_device *adev, u32 se_num,
 			     u32 sh_num, u32 reg_offset, u32 *value)
 {
@@ -1138,8 +1147,12 @@ static int si_read_register(struct amdgpu_device *adev, u32 se_num,
 		if (reg_offset != si_allowed_read_registers[i].reg_offset)
 			continue;
 
-		*value = si_get_register_value(adev, indexed, se_num, sh_num,
-					       reg_offset);
+		if (indexed)
+			return si_get_register_value_indexed(adev,
+							     se_num, sh_num,
+							     reg_offset, value);
+
+		*value = si_get_register_value(adev, reg_offset);
 		return 0;
 	}
 	return -EINVAL;
-- 
2.28.0

