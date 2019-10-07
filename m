Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE31FCE93B
	for <lists+kernel-janitors@lfdr.de>; Mon,  7 Oct 2019 18:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727931AbfJGQa4 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 7 Oct 2019 12:30:56 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51282 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727801AbfJGQa4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Oct 2019 12:30:56 -0400
Received: by mail-wm1-f67.google.com with SMTP id 7so174030wme.1
        for <kernel-janitors@vger.kernel.org>; Mon, 07 Oct 2019 09:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5JvJ3PfJ+p6jBSzSy2TDmj0xCxcaMiVBdzdXftupnGY=;
        b=iK/2afJmOoTLjgJMkkMngZRuA+iSA4W1OpmBaxAyHq66/7ptnvGL/Vl2C3xCatRQIl
         eCU/e3NtIQspPY34AdL1OG0asLTWzvMgE0aqHyj1AStQS3yBeQf90BUXKfq/CHdxPGtq
         4vVcybPorC/FjWlDw0jbXHVQNrMzeso84KeBAcisT01ApgrHUUc9C0qv5zP2bMNdL/NL
         E6XA8OwlWOp58BRFAnk/HxoEkE7ZOVC03dOEgh3QZPpXRiFtW+13zJc5HYQrEX7GkAc6
         IKyv3Gsma0UcupZ8NBT5EfJ/F+agbLQX4KxIJXpyctPdYo5d4ZtdMRXZb57CxTp2Mv41
         xIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5JvJ3PfJ+p6jBSzSy2TDmj0xCxcaMiVBdzdXftupnGY=;
        b=kz6548QdJwGDjC0KZnPhJWEF0IFWTLoKRhYgPdt2sO8Hx8d/Gy/2KmPFS1b0fgMWbr
         v3qMe8BwLmXPWL9IY8qNfMcopotMjsDYLPiocMG24W0SGsdRJU7FUtLH4BXAPI1m3OR0
         TQRADU7Gr+cvE8IAbt+TtHXLuXQ5mPB77T4eDIM24I7SE+fp4hz9+sOwdoyq9K9A2P5E
         nV03wprL5g8/Cx9nH8FxmnB3rqc2tVrWvVkYr+WG3tZwOhTMSzMtEh2IhJ1SMkCexxu/
         bhUrW3oshBKjPDpS02RFQ/wEND0dS7A6QlQqZpw2gf1vxvOa7feYwV5rl8LRJDLvBZ59
         rXdA==
X-Gm-Message-State: APjAAAVOPGA09W18fQoqRktp0n4sjazwb0sMuCLwRkP7fpTeusTMDP8t
        rziFh+WcjWLIb0e5hcJvHqh3b3SnXl3MJ/ttugk=
X-Google-Smtp-Source: APXvYqyH2d0GgePOwaEp5KTgrIp/WdeRGQqGVV4V90yRxCNENZ4zD2hlbXMq23JlCxHf6frJxzH24RhD+an675EQgCo=
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr83023wmb.127.1570465854163;
 Mon, 07 Oct 2019 09:30:54 -0700 (PDT)
MIME-Version: 1.0
References: <20191007085210.GC3865@mwanda>
In-Reply-To: <20191007085210.GC3865@mwanda>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 7 Oct 2019 12:30:41 -0400
Message-ID: <CADnq5_NHDwYhF+Z7Kn6a4=qp9S9==7hSjKWQWwsJT9SPTdfePg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: Fix a && vs || typo
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Felix Kuehling <Felix.Kuehling@amd.com>,
        Yong Zhao <Yong.Zhao@amd.com>, David Airlie <airlied@linux.ie>,
        kernel-janitors@vger.kernel.org,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Oct 7, 2019 at 4:52 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> In the current code if "device_info" is ever NULL then the kernel will
> Oops so probably || was intended instead of &&.
>
> Fixes: e392c887df97 ("drm/amdkfd: Use array to probe kfd2kgd_calls")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.  thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> index 0db273587af4..070c9b5593c9 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> @@ -498,7 +498,7 @@ struct kfd_dev *kgd2kfd_probe(struct kgd_dev *kgd,
>         device_info = kfd_supported_devices[asic_type][vf];
>         f2g = kfd2kgd_funcs[asic_type];
>
> -       if (!device_info && !f2g) {
> +       if (!device_info || !f2g) {
>                 dev_err(kfd_device, "%s %s not supported in kfd\n",
>                         amdgpu_asic_name[asic_type], vf ? "VF" : "");
>                 return NULL;
> --
> 2.20.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
