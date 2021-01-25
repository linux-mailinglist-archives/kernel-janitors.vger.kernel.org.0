Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A02B3047FB
	for <lists+kernel-janitors@lfdr.de>; Tue, 26 Jan 2021 20:16:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388863AbhAZFxW (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 26 Jan 2021 00:53:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730400AbhAYPrE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 25 Jan 2021 10:47:04 -0500
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A302C0613D6
        for <kernel-janitors@vger.kernel.org>; Mon, 25 Jan 2021 07:46:09 -0800 (PST)
Received: by mail-oo1-xc29.google.com with SMTP id q6so3362722ooo.8
        for <kernel-janitors@vger.kernel.org>; Mon, 25 Jan 2021 07:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1UgX9fWVFnZwYT76RTGJattcj+aM4gHVPVeJOG15L5c=;
        b=YSHYJOafQzPYyJbloSIPWr5aAzo+UbNZcOtJZqjfuzyPCed/1Oa+th/cqgGtpWVGYW
         nEdwUL+dA+wF30d0eYv7Lqti9in34LYTrr3YXn0BFzfsIP6tvI17qiYkWe1dBR54eW31
         2F4nBtL0M1ft+1L0h1KwLpBzHANgg0HgPhQ6lIVkkfSljlXRq5i1MqP+azVmxHjSurmv
         BmJNtZLWo/bta+gZc1OtLafNkdCGISZTbc9WdT15VhF3ba0qu5GKzXAnJlZl2DFrrw4d
         BCJLLfdIDGOeQMS9IFUMW/H5sY1Nv9XHfs0ApCNgGA257ZR3SOkDxMMuOcuIkNcgjq/R
         cbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1UgX9fWVFnZwYT76RTGJattcj+aM4gHVPVeJOG15L5c=;
        b=l23R+EoIViYLLzO+czXSi1/m2QaWa4xUXGwtho0T7boLnNO2AwTyGf71n6KjOmS2CE
         1vSZfhdprrGtGc7eA+Cbf7FwifOGr+UR2P3ULtrpnKkNkmrd/7WIe+If+jgIZ6nwwQK2
         S6mjVaknXI9wDqFRS9oOU8wzPFxM1VW3YXh8jwbKbkBuAtYOhUISb0Ud1kJZJVqGYITS
         qf7U9yIUyV5Sx7OJW1dq2cJRGXO3TLXRik4E7rh0b83jypqXVPQhcZPw51PsSxjV4vAm
         hUPe65Fn1oMaD82gy/1SAka0TaPj4rkKCL7DdC/WM3TRrdpdIgS8e1HDdCrldH8b5bhU
         Sgaw==
X-Gm-Message-State: AOAM530jo+YnD1OxneODNpNywgX/gmdc/I5HojNBaVPB4g8mVjE0SXU+
        LZetkt942VIhcmt/WVY+J36RfGJJMeP/lsO8u80iVXbW
X-Google-Smtp-Source: ABdhPJzKtbC/VXeE50ejjuNIdIGvT08dlV86T6wYd2L8w0N+Vc//0iw7icZhOPSjRbIHhJAQOFchRbetfAlsUT8787Y=
X-Received: by 2002:a4a:6c45:: with SMTP id u5mr873512oof.61.1611589568669;
 Mon, 25 Jan 2021 07:46:08 -0800 (PST)
MIME-Version: 1.0
References: <YA6FFK+F1XbGbYVJ@mwanda>
In-Reply-To: <YA6FFK+F1XbGbYVJ@mwanda>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 25 Jan 2021 10:45:57 -0500
Message-ID: <CADnq5_MUs2fzVHTMo=zxtg8L7QaCvg0knJy=i2EuEj5r6uEuqA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix a potential NULL dereference
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Harry Wentland <harry.wentland@amd.com>,
        George Shen <george.shen@amd.com>,
        kernel-janitors@vger.kernel.org, Anson Jacob <anson.jacob@amd.com>,
        Yongqiang Sun <yongqiang.sun@amd.com>,
        Jaehyun Chung <jaehyun.chung@amd.com>,
        Leo Li <sunpeng.li@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
        Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
        Melissa Wen <melissa.srw@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Aurabindo Pillai <aurabindo.pillai@amd.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Wyatt Wood <wyatt.wood@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Anthony Koo <Anthony.Koo@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jan 25, 2021 at 3:47 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The debug printk dereferences "link->link_enc" before we have ensured
> that it is non-NULL.  Fix this potential NULL derefence by moving the
> printk after the check.
>
> Fixes: 1975b95ad4e7 ("drm/amd/display: Log link/connector info provided in BIOS object table")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> index c16af3983fdb..4d31b2fae1f9 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> @@ -1525,13 +1525,13 @@ static bool dc_link_construct(struct dc_link *link,
>         link->link_enc =
>                 link->dc->res_pool->funcs->link_enc_create(&enc_init_data);
>
> -       DC_LOG_DC("BIOS object table - DP_IS_USB_C: %d", link->link_enc->features.flags.bits.DP_IS_USB_C);
> -
>         if (!link->link_enc) {
>                 DC_ERROR("Failed to create link encoder!\n");
>                 goto link_enc_create_fail;
>         }
>
> +       DC_LOG_DC("BIOS object table - DP_IS_USB_C: %d", link->link_enc->features.flags.bits.DP_IS_USB_C);
> +
>         link->link_enc_hw_inst = link->link_enc->transmitter;
>
>         for (i = 0; i < 4; i++) {
> --
> 2.29.2
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
