Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E201A2F763E
	for <lists+kernel-janitors@lfdr.de>; Fri, 15 Jan 2021 11:09:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727180AbhAOKJX (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 15 Jan 2021 05:09:23 -0500
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:47026 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbhAOKJW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 15 Jan 2021 05:09:22 -0500
Received: from [192.168.1.41] ([92.131.99.25])
        by mwinf5d49 with ME
        id Gy7a2400L0Ys01Y03y7agg; Fri, 15 Jan 2021 11:07:37 +0100
X-ME-Helo: [192.168.1.41]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 15 Jan 2021 11:07:37 +0100
X-ME-IP: 92.131.99.25
Subject: Re: [PATCH][next] drm/amdgpu: Add missing BOOTUP_DEFAULT to
 profile_name[]
To:     Colin Ian King <colin.king@canonical.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Xiaojian Du <Xiaojian.Du@amd.com>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210111114638.16530-1-colin.king@canonical.com>
 <20210112100706.GF5083@kadam>
 <51efd2a7-f2cf-dc28-4b86-5e89d13564ca@canonical.com>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <f57062ac-499d-95bb-cf4f-bb7b5b1dea5b@wanadoo.fr>
Date:   Fri, 15 Jan 2021 11:07:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <51efd2a7-f2cf-dc28-4b86-5e89d13564ca@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 15/01/2021 à 10:37, Colin Ian King a écrit :
> On 12/01/2021 10:07, Dan Carpenter wrote:
>> On Mon, Jan 11, 2021 at 11:46:38AM +0000, Colin King wrote:
>>> From: Colin Ian King <colin.king@canonical.com>
>>>
>>> A recent change added a new BOOTUP_DEFAULT power profile mode
>>> to the PP_SMC_POWER_PROFILE enum but omitted updating the
>>> corresponding profile_name array.  Fix this by adding in the
>>> missing BOOTUP_DEFAULT to profile_name[].
>>>
>>
>> Still not enough to prevent the array overflow.  It needs POWERSAVE as
>> well.
> 
> Thanks for checking, but there is a 1-to-1 relation ship now:
> 
> enum PP_SMC_POWER_PROFILE {
>          PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT = 0x0,
>          PP_SMC_POWER_PROFILE_FULLSCREEN3D = 0x1,
>          PP_SMC_POWER_PROFILE_POWERSAVING  = 0x2,
>          PP_SMC_POWER_PROFILE_VIDEO        = 0x3,
>          PP_SMC_POWER_PROFILE_VR           = 0x4,
>          PP_SMC_POWER_PROFILE_COMPUTE      = 0x5,
>          PP_SMC_POWER_PROFILE_CUSTOM       = 0x6,
>          PP_SMC_POWER_PROFILE_COUNT,
> };
> 
> vs
> 
>          static const char *profile_name[] = {
>                                          "BOOTUP_DEFAULT",
>                                          "3D_FULL_SCREEN",
>                                          "POWER_SAVING",

This line has been added yesterday in commit f727ebeb589d.
So Dan was right when he sent his patch, but some else fixed it.

CJ

>                                          "VIDEO",
>                                          "VR",
>                                          "COMPUTE",
>                                          "CUSTOM"};
> 
> 
> unless I'm missing something because I've not had enough coffee.
> 
> Colin
> 
>>
>> regards,
>> dan carpenter
>>
> 
> 

