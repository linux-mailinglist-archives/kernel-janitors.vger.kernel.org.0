Return-Path: <kernel-janitors+bounces-4210-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB55D90FF7D
	for <lists+kernel-janitors@lfdr.de>; Thu, 20 Jun 2024 10:52:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A2A3285B42
	for <lists+kernel-janitors@lfdr.de>; Thu, 20 Jun 2024 08:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A78D01AB37A;
	Thu, 20 Jun 2024 08:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NNcMAwzP"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833822139D7
	for <kernel-janitors@vger.kernel.org>; Thu, 20 Jun 2024 08:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718873391; cv=none; b=DKH06wZOU2Eqo94BxyLWqrg8ZWNrCyrFZyI/fxVXOvJxwtqosaOSoGA1MT1GUxCYrnSlp0Lj1WxqbqndFOw7tTsvQeFraShqnZVDzR39+x+F2ySSQYrFNDnZgIa2XPhyS1tTLkmhJDn8aMf1ebRfpdKrIUxPg+ggBqL40iP8a8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718873391; c=relaxed/simple;
	bh=sfXsS4Z780y+qpSaXrDUseunj8H+AVCIxVL+pwCCZZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f5P0FnlXCmbVWX9IKYWvCVk5NffA6Tx8UupFY+SYv861G8QsVIudpd8VMuC/7mPaTaPTqrB+XeLdFiTLbcfe+SgZYi37uMrbBM6PPjvoZ7T6s2q7TQdiDArhK/KiQSlv1aoD43AduDLQAl0lByfrR3bwDkg7ql3+WPQz6zXe4Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NNcMAwzP; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-57d07f07a27so573838a12.3
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Jun 2024 01:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718873388; x=1719478188; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FCmULs7Ip+T4HEzPRhfMxVMy8WCUz+1jGV/C4njJqXM=;
        b=NNcMAwzPJI4Ha0rxmOCa1BuyPMTTWstTaJd4WlEwqTtQeSI4K4A26vO0RONsJgXj84
         zgXATnN/E9t94CqN5znyjZhyWM/prBJW1qW2YrDjqBZq93K8SXmTl7BryZ2KPA/eB8+1
         Nnu/xaDsNl3VbIPrg46M+3RoRoxjRpfujQ+E9IdhSKU6IQIK5/asrdMAUUCBco8JdcMZ
         jwPpuIposRqZABGSgADX/yTj40osTIu3/4qwQBxZECcS86q7roXgj7UlIe3+/1HtuTIM
         ND3Y5SOw8qK+3SU9yF0NH+LzK7D7+smnoGn6mLS/SCzFtDwhVSHZ3AEzZ8dv05LpL4mq
         tXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718873388; x=1719478188;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FCmULs7Ip+T4HEzPRhfMxVMy8WCUz+1jGV/C4njJqXM=;
        b=M6I9ZI6WGqAWs8h+zEvhhUH3PoBYYEChvp2BV5M+okkdbx1xctw6BN4BYuVd8UODbo
         6JZZFDasmLE8PhjbgaVJYOU9cZJ1u6DANzU3xy6W+U+tTA0Gg3WTiG8zHXIQ74r630p0
         9IuEbU3M6DzccSW4pIH2BalfFyR2V8bhjqmO3rejXvTIzc2NXoLpE+S4ZWySfQ2X4OWK
         iGzNeenacn5huUWeFfT0pjeIxLRcj8Gc+PkI7irybbK0XL2TbESsm7jL+odoYmWF/age
         mN7M3TbnpcjBZqQA6IU4s35lK4Igzr+QCs9ClX92wZr+KmGNMs6eHAqQYEY0I/oUI4jj
         62Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUD963LiLMQd08cNVLnmHSt+sHLMaRb3Rq7CYpjga5RbeAN+epXDisI30ivVkJZKCBUnopaIKYSC+U7/Ej535ZyTqzIIW0ViyfZXvvW4skd
X-Gm-Message-State: AOJu0YzrgCqrAWY5kCl//99o0s7U6P1+K3PjG5IbTqLNAGVICsqjPvDL
	Tbvjxdoyy/KSljA2eWDEmp2AKOKuAiEb1RFndgGM21ux6G52V1237gbUmVTEfZk=
X-Google-Smtp-Source: AGHT+IFjPo1mca3mlAO70SZGhud7FBjXkR91J2Bn4a2E6P7EwodOEE/C2Tdp9I1x/bZPTaMnkVihqQ==
X-Received: by 2002:a50:9fe1:0:b0:578:67db:7529 with SMTP id 4fb4d7f45d1cf-57d07e190c7mr2545052a12.4.1718873387774;
        Thu, 20 Jun 2024 01:49:47 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72da371sm9318328a12.24.2024.06.20.01.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 01:49:47 -0700 (PDT)
Date: Thu, 20 Jun 2024 11:49:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Alex Hung <alex.hung@amd.com>, Wayne Lin <wayne.lin@amd.com>,
	Fangzhi Zuo <jerry.zuo@amd.com>,
	Agustin Gutierrez <agustin.gutierrez@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Hersen Wu <hersenxs.wu@amd.com>, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amd/display: Clean up indenting in
 dm_dp_mst_is_port_support_mode()
Message-ID: <a57a9d8f-40bb-4cfa-9dad-4f93a1f33303@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code works, but it's not aligned correctly.  Add a couple missing
tabs.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 48118447c8d9..5d4f831b1e55 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -1691,7 +1691,7 @@ enum dc_status dm_dp_mst_is_port_support_mode(
 		if (aconnector->mst_output_port->passthrough_aux) {
 			if (bw_range.min_kbps > end_to_end_bw_in_kbps) {
 				DRM_DEBUG_DRIVER("DSC passthrough. Max dsc compression can't fit into end-to-end bw\n");
-			return DC_FAIL_BANDWIDTH_VALIDATE;
+				return DC_FAIL_BANDWIDTH_VALIDATE;
 			}
 		} else {
 			/*dsc bitstream decoded at the dp last link*/
@@ -1756,7 +1756,7 @@ enum dc_status dm_dp_mst_is_port_support_mode(
 		if (branch_max_throughput_mps != 0 &&
 			((stream->timing.pix_clk_100hz / 10) >  branch_max_throughput_mps * 1000)) {
 			DRM_DEBUG_DRIVER("DSC is required but max throughput mps fails");
-		return DC_FAIL_BANDWIDTH_VALIDATE;
+			return DC_FAIL_BANDWIDTH_VALIDATE;
 		}
 	} else {
 		DRM_DEBUG_DRIVER("DSC is required but can't find common dsc config.");
-- 
2.43.0


