Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A68A27025D
	for <lists+kernel-janitors@lfdr.de>; Fri, 18 Sep 2020 18:39:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726455AbgIRQjs (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 18 Sep 2020 12:39:48 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:44352 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgIRQjs (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 18 Sep 2020 12:39:48 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1kJJQH-0001Nb-JT; Fri, 18 Sep 2020 16:39:45 +0000
Subject: Re: [PATCH][next] drm/panel: fix null pointer dereference on pointer
 mode
To:     =?UTF-8?Q?Guido_G=c3=bcnther?= <guido.gunther@puri.sm>
Cc:     Purism Kernel Team <kernel@puri.sm>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20200918155136.28958-1-colin.king@canonical.com>
 <20200918162249.GA292461@bogon.m.sigxcpu.org>
From:   Colin Ian King <colin.king@canonical.com>
Message-ID: <32528660-a9b0-75b2-264d-26d6dc90180c@canonical.com>
Date:   Fri, 18 Sep 2020 17:39:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <20200918162249.GA292461@bogon.m.sigxcpu.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 18/09/2020 17:22, Guido Günther wrote:
> Hi,
> On Fri, Sep 18, 2020 at 04:51:36PM +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Currently a null pointer check on pointer mode is passing mode to
>> function drm_mode_vrefresh and this causes a null pointer dereference
>> on mode.  Fix this by not calling drm_mode_vrefresh since the call
>> is only required for error reporting.
>>
>> Addresses-Coverity: ("Dereference after null check")
>> Fixes: 72967d5616d3 ("drm/panel: Add panel driver for the Mantix MLAF057WE51-X DSI panel")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
>> index 3482e28e30fc..be4761a643f9 100644
>> --- a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
>> +++ b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
>> @@ -202,9 +202,8 @@ static int mantix_get_modes(struct drm_panel *panel,
>>  
>>  	mode = drm_mode_duplicate(connector->dev, &default_mode);
>>  	if (!mode) {
>> -		dev_err(ctx->dev, "Failed to add mode %ux%u@%u\n",
>> -			default_mode.hdisplay, default_mode.vdisplay,
>> -			drm_mode_vrefresh(mode));
>> +		dev_err(ctx->dev, "Failed to add mode %ux%u\n",
>> +			default_mode.hdisplay, default_mode.vdisplay);
>>  		return -ENOMEM;
>>  	}
> 
> drm_mode_vrefresh(&default_mode) gives some more clue what's going on -
> I have had a fix queued up in my tree already but if you send a v2
> that's fine.

I'll defer to your queued up fix.
> 
> Thanks!
>  -- Guido
> 
>>  
>> -- 
>> 2.27.0
>>

