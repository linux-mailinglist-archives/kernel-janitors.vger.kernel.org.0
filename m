Return-Path: <kernel-janitors+bounces-3976-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5359075FE
	for <lists+kernel-janitors@lfdr.de>; Thu, 13 Jun 2024 17:05:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A99401C22B03
	for <lists+kernel-janitors@lfdr.de>; Thu, 13 Jun 2024 15:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 669B714900F;
	Thu, 13 Jun 2024 15:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EllD0SyD"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EC853E31
	for <kernel-janitors@vger.kernel.org>; Thu, 13 Jun 2024 15:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718291117; cv=none; b=s4fXtaovtiV+85q6A+6pbY2yyloXPpJCx5oyKt50x7WSaLcBpFD68q8dhM/EIVqLL07KUWkifVK/a/z1ybSW5dXlZ0EQyCjTLcB7m+XnVrdnHtqUbLSstKNyHJ9lP221Tuyk/Amf9SmCydYMfR04wZtNFa/pzLVgGQEeR1lO+vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718291117; c=relaxed/simple;
	bh=aZrqo1QdvlsVzHr8N4a87ImSH7QfmCAPFz6ktnixMRI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=QavYB5fIwkYY9FbdQoz1XwDu+aJtGYeunHb9LDFC3Es/wW4mmzSFrMJl1CIeTouZroilyq1UVpnPyj3vVMPI39DMhvomSrXU4BuySjAG0EF/uQaChCgxlLm4D7GMjwx+RgGv8qXRo9CoO8V7fwZIssaKseIHFZcCnUZegp2PdT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EllD0SyD; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: christophe.jaillet@wanadoo.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1718291114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N065K9zNHNGpuRaLl+nprLkgcSGQ568ihUQMVU2BLJg=;
	b=EllD0SyDBeMkOGeaIaxZmqcKY7M1zqEgbzoIkCaHrMOAvYQYbWZakznOm2clrE5nyVWOl6
	eyUUR4aR/U3is3tXsblYmq7dT8Ck4YpakP8v/cayQlSkoSLy7HRNwicCpJOqO3nH50pj9K
	cJGZ9Kmle0+PXG9xQmxwu8+6MjnRVOI=
X-Envelope-To: laurent.pinchart@ideasonboard.com
X-Envelope-To: tomi.valkeinen@ideasonboard.com
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: mripard@kernel.org
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: airlied@gmail.com
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: michal.simek@amd.com
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: kernel-janitors@vger.kernel.org
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Message-ID: <120ffe3c-0240-4f93-a220-e0df565bcdbf@linux.dev>
Date: Thu, 13 Jun 2024 11:05:01 -0400
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] drm: zynqmp_dpsub: Fix an error handling path in
 zynqmp_dpsub_probe()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
References: <974d1b062d7c61ee6db00d16fa7c69aa1218ee02.1716198025.git.christophe.jaillet@wanadoo.fr>
 <5288867f-ee45-4930-bde0-14b24b878181@linux.dev>
Content-Language: en-US
In-Reply-To: <5288867f-ee45-4930-bde0-14b24b878181@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/20/24 11:05, Sean Anderson wrote:
> On 5/20/24 05:40, Christophe JAILLET wrote:
>> If zynqmp_dpsub_drm_init() fails, we must undo the previous
>> drm_bridge_add() call.
>> 
>> Fixes: be3f3042391d ("drm: zynqmp_dpsub: Always register bridge")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>> Compile tested only
>> ---
>>  drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
>> index face8d6b2a6f..f5781939de9c 100644
>> --- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
>> +++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
>> @@ -269,6 +269,7 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
>>  	return 0;
>>  
>>  err_disp:
>> +	drm_bridge_remove(dpsub->bridge);
>>  	zynqmp_disp_remove(dpsub);
>>  err_dp:
>>  	zynqmp_dp_remove(dpsub);
> 
> Reviewed-by: Sean Anderson <sean.anderso@linux.dev>

Will this be applied soon? The patch it fixes has made its way into the stable tree already.

--Sean


