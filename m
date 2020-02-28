Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFFD517350D
	for <lists+kernel-janitors@lfdr.de>; Fri, 28 Feb 2020 11:12:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgB1KMQ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 28 Feb 2020 05:12:16 -0500
Received: from mail.netline.ch ([148.251.143.178]:46575 "EHLO
        netline-mail3.netline.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726413AbgB1KMQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 28 Feb 2020 05:12:16 -0500
X-Greylist: delayed 416 seconds by postgrey-1.27 at vger.kernel.org; Fri, 28 Feb 2020 05:12:15 EST
Received: from localhost (localhost [127.0.0.1])
        by netline-mail3.netline.ch (Postfix) with ESMTP id 1C0792A6046;
        Fri, 28 Feb 2020 11:05:18 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
        by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id fAz-rJ3gawAP; Fri, 28 Feb 2020 11:05:17 +0100 (CET)
Received: from thor (252.80.76.83.dynamic.wline.res.cust.swisscom.ch [83.76.80.252])
        by netline-mail3.netline.ch (Postfix) with ESMTPSA id 1A6AA2A6016;
        Fri, 28 Feb 2020 11:05:17 +0100 (CET)
Received: from localhost ([::1])
        by thor with esmtp (Exim 4.93)
        (envelope-from <michel@daenzer.net>)
        id 1j7cWC-0008e5-Gp; Fri, 28 Feb 2020 11:05:16 +0100
Subject: Re: [PATCH] drm/amd/display: Use after free in dmub_psr_destroy()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Wyatt Wood <wyatt.wood@amd.com>
Cc:     "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
        Leo Li <sunpeng.li@amd.com>, kernel-janitors@vger.kernel.org,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        amd-gfx@lists.freedesktop.org,
        Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20200228080436.rmsqe3ytmxi3bwxn@kili.mountain>
From:   =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <cba36257-8562-d14a-da9b-cc38076d350f@daenzer.net>
Date:   Fri, 28 Feb 2020 11:05:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200228080436.rmsqe3ytmxi3bwxn@kili.mountain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2020-02-28 9:22 a.m., Dan Carpenter wrote:
> These lines need to be re-ordered so that we don't dereference "dmub"
> after we just freed it.
> 
> Fixes: 4c1a1335dfe0 ("drm/amd/display: Driverside changes to support PSR in DMCUB")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> index 2c932c29f1f9..dc858b152c6e 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> @@ -235,6 +235,6 @@ struct dmub_psr *dmub_psr_create(struct dc_context *ctx)
>   */
>  void dmub_psr_destroy(struct dmub_psr **dmub)
>  {
> -	kfree(dmub);
>  	*dmub = NULL;
> +	kfree(dmub);
>  }
> 

Maybe

	kfree(*dmub);

was intended instead?


Actually, this function and others in this file seem completely unused?


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
