Return-Path: <kernel-janitors+bounces-1902-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE9D867992
	for <lists+kernel-janitors@lfdr.de>; Mon, 26 Feb 2024 16:10:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B6DA1F2897E
	for <lists+kernel-janitors@lfdr.de>; Mon, 26 Feb 2024 15:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5D5312D760;
	Mon, 26 Feb 2024 14:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f/1OGA8X"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A51B1E4A1;
	Mon, 26 Feb 2024 14:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708959241; cv=none; b=mb+Z5Skjp8/8w825wGMG7xDGIhQ90iEu44X0ko5uXLsd8If934Q55svjBSvFZBmrktbyJCkP+CuV2gtNcf33ehObREzOSD56AV/4U66rO3O0Fy62tA212OBCT2EkmN+OA7FPGzQQ5rcZkQPRmMyxpS6u5yIq3BXf7B/TBPa5PDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708959241; c=relaxed/simple;
	bh=pZDilNSIXaQXrKiWyVhZ5AP3xK2eNb9wOETKTeIfubc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=G75SIppMjn6FnyAxcNAwVDrsESIkWDYUvHuQeH5wFzowuO9zvvumwUqy/AezTppbSVM/gYPniXAhZ2yvs5ubi9L8khDPAGbIItkYQJsNcXX7AgJ5uSPT7T+bBMMScg1YJ3B7wO8+CIqgJLCff8MyTF/nBlm8Z7jdyIbR85mMRAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f/1OGA8X; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708959240; x=1740495240;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=pZDilNSIXaQXrKiWyVhZ5AP3xK2eNb9wOETKTeIfubc=;
  b=f/1OGA8XLByGZRv6gu5db8Ssc6kZXb66ZUplBCykk7ma+XMDiJWGkCxB
   fjdrPkwEXA8rPBTy0Bl4Hs5N1dH0Rl1PiaO25FwZpb0nSTy5H5y7VeMzz
   anw6I5hrDmbdx56sjMSrIB9BtSloZ5NnwABT6Zm9n7jUa23E+wtdHlg2t
   btpMQiODHro7fRtfKMVbv0VEb7R27fDxXGgo9UDu8fTjXya6LhzUr+l6U
   HaA72kX/0+YvU3RfMrc0pX30ixtWUdntke7BfJFldl3MMCrzGk6pFdeg+
   zBBEX/O1zpJUptaix65GyRCzT3vc+CQL2AegYVuxLbX/Ism+Kdtz0ozU4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="20791744"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="20791744"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 06:53:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="11321342"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.246.48.12])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 06:53:55 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 26 Feb 2024 16:53:50 +0200 (EET)
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    Hans de Goede <hdegoede@redhat.com>, 
    Mario Limonciello <mario.limonciello@amd.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    kernel-janitors@vger.kernel.org, dan.carpenter@linaro.org
Subject: Re: [PATCH] platform/x86/amd/pmf: Fix missing error code in
 amd_pmf_init_smart_pc()
In-Reply-To: <20240226144011.2100804-1-harshit.m.mogalapalli@oracle.com>
Message-ID: <a7b4dfc8-8be9-911a-6c56-4f84c1b85d73@linux.intel.com>
References: <20240226144011.2100804-1-harshit.m.mogalapalli@oracle.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1479405409-1708959230=:1203"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1479405409-1708959230=:1203
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 26 Feb 2024, Harshit Mogalapalli wrote:

> On the error path, assign -ENOMEM to ret when memory allocation of
> "dev->prev_data" fails.
>=20
> Fixes: e70961505808 ("platform/x86/amd/pmf: Fixup error handling for amd_=
pmf_init_smart_pc()")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
> This is based on static analysis with smatch, only compile tested
> ---
>  drivers/platform/x86/amd/pmf/tee-if.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86=
/amd/pmf/tee-if.c
> index 8527dca9cf56..dcbe8f85e122 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -458,8 +458,10 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  =09amd_pmf_hex_dump_pb(dev);
> =20
>  =09dev->prev_data =3D kzalloc(sizeof(*dev->prev_data), GFP_KERNEL);
> -=09if (!dev->prev_data)
> +=09if (!dev->prev_data) {
> +=09=09ret =3D -ENOMEM;
>  =09=09goto error;
> +=09}
> =20
>  =09ret =3D amd_pmf_start_policy_engine(dev);
>  =09if (ret)
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-1479405409-1708959230=:1203--

