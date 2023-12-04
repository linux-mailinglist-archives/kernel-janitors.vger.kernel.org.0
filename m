Return-Path: <kernel-janitors+bounces-569-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAA180378A
	for <lists+kernel-janitors@lfdr.de>; Mon,  4 Dec 2023 15:51:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19C4F1F21224
	for <lists+kernel-janitors@lfdr.de>; Mon,  4 Dec 2023 14:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4017128DB6;
	Mon,  4 Dec 2023 14:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="j22NLa1p"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F23DB3;
	Mon,  4 Dec 2023 06:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=6g6yadi8+CXH2sU93oASaWjbxQGcWTNsZoAE3ZBa6s0=; b=j22NLa1pTn3kBvy7vKnoKczEAn
	MPU1KJIfVHjFlIbF51rexMEyRVkazkb7YxEiGsFnh8Rn77knd8ZjnqP2g/sA9YjycG7lyixTEDIOu
	JQqF4D6SedfsWxMguFx0HhH13ZD4Uf3Sqp4iBgs62cuSH+H2b54YO39jtsajzTVlwKpIcwWsB1Bmi
	FDnquM4RLEkYPRzu4wTuUh3m3XoWwl+ZakPeqtn9lKab7b2sNDzenXpSgFff9HMrLBwi2Z98fO31i
	zFYsiuXouXjJ+KTGtMKhGlS2zbGdJmZTNMYeWzv7/Dej+uUfQ7oc36zCjFJCzoSkSvHS2Y/FXDRn4
	7HD4UKYA==;
Received: from [102.213.205.115] (helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1rAAHw-00ADH1-69; Mon, 04 Dec 2023 15:51:12 +0100
Date: Mon, 4 Dec 2023 13:50:59 -0100
From: Melissa Wen <mwen@igalia.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Emma Anholt <emma@anholt.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
	error27@gmail.com
Subject: Re: [PATCH next] drm/v3d: Fix missing error code in
 v3d_submit_cpu_ioctl()
Message-ID: <20231204145059.3ewtpuhiq4xq4ifv@mail.igalia.com>
References: <20231204122102.181298-1-harshit.m.mogalapalli@oracle.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204122102.181298-1-harshit.m.mogalapalli@oracle.com>

On 12/04, Harshit Mogalapalli wrote:
> Smatch warns:
> 	drivers/gpu/drm/v3d/v3d_submit.c:1222 v3d_submit_cpu_ioctl()
> 	warn: missing error code 'ret'
> 
> When there is no job type or job is submitted with wrong number of BOs
> it is an error path, ret is zero at this point which is incorrect
> return.
> 
> Fix this by changing it to -EINVAL.
> 
> Fixes: aafc1a2bea67 ("drm/v3d: Add a CPU job submission")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
> This is based on static analysis and only compile tested.
> ---
>  drivers/gpu/drm/v3d/v3d_submit.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
> index d7a9da2484fd..fcff41dd2315 100644
> --- a/drivers/gpu/drm/v3d/v3d_submit.c
> +++ b/drivers/gpu/drm/v3d/v3d_submit.c
> @@ -1219,11 +1219,13 @@ v3d_submit_cpu_ioctl(struct drm_device *dev, void *data,
>  	/* Every CPU job must have a CPU job user extension */
>  	if (!cpu_job->job_type) {
>  		DRM_DEBUG("CPU job must have a CPU job user extension.\n");
> +		ret = -EINVAL;
>  		goto fail;
>  	}
>  
>  	if (args->bo_handle_count != cpu_job_bo_handle_count[cpu_job->job_type]) {
>  		DRM_DEBUG("This CPU job was not submitted with the proper number of BOs.\n");
> +		ret = -EINVAL;

Nice catch. Thanks!

Reviewed-by: Melissa Wen <mwen@igalia.com>

I'll apply to drm-misc-next.

>  		goto fail;
>  	}
>  
> -- 
> 2.39.3
> 

