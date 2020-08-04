Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9269D23C0C9
	for <lists+kernel-janitors@lfdr.de>; Tue,  4 Aug 2020 22:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727801AbgHDUdS (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 4 Aug 2020 16:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726984AbgHDUdR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 4 Aug 2020 16:33:17 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B58CC06174A
        for <kernel-janitors@vger.kernel.org>; Tue,  4 Aug 2020 13:33:17 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id q76so4160506wme.4
        for <kernel-janitors@vger.kernel.org>; Tue, 04 Aug 2020 13:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ba/vp9WP1dOScQnxeEY1wkyVef5JbFdpUB1JMTIzOXM=;
        b=kCsRsLi2SD+QamBMmJpIn43hhCK0ce/RE0p2jh14AC5U4cP1tkt3v9dPjT1KpbiAJ1
         FVXFFRdzlOeDOmtH1RjiyfmtSAh29ZCXsRP/cgsCPbh0LPzgZScU/5Tsz5q9LtZiDABm
         xmEEoKOR2QML4R9zYbSEk4uxNT+nEWAERnunFM56H3pbImnhfeiGQX4fdDzXOc5Guaru
         wSPWikTfJYCVlo8OQUMTaJM65enqaEmex/TPt1H7LGk+c1aw1z70qb3AtQLIXJ6O+VND
         +sXAMJUsFvv6Ids7QQJ6fLqZx0zB2hS1Aoa2w5KkdWOUZp3SVeB1K+SH+6z6qlQhYZJk
         T0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ba/vp9WP1dOScQnxeEY1wkyVef5JbFdpUB1JMTIzOXM=;
        b=SnGKOn27NhIxvjVcSJb6sLPKmk/IMZwVZ7Fkj5nPDDPGldxaF+r54e4bv3Ia+LnSJT
         reYo1llAdVf1u1iwLl8q4dtNom9DrtCgu6J8FiOBx2QEarCH6zaoMcZI3gNT+JnIvWM2
         cX+QcV+k1COUpDJk4NpbguMG8DeX5jQGVVDjtWRdtKZoFu5mzGkHNAsoFEPYETlggtI4
         vPdFcID5PUfR/vSSGD0s+3Jx18M3OxhXL9yuyv6k16rnVi17vYrVnGJk2ZIrn5VrphlX
         5mpuIgs+ZuzBfPzC85K7i+r7kW1ZwEAeMXoJndB9EmjX4iFjksqL2KKlqOk94MSbKj1z
         6cNw==
X-Gm-Message-State: AOAM53209CxmEaJnAYSV2yzOOOzGZFZy5gQ61qjyHQfWi800w+vLcCdp
        rrmHU5hH5sLjqFp0L/Qq2dABrDZ0RhQvOmLi5g4=
X-Google-Smtp-Source: ABdhPJxU9B4e/oeIlSyvXTNo0Yyfhw5gksvyf2sQkr9hqJY7xbRottrbT/yc6ukyCamIoeFFVLeCKHUU+G28HdET6Y4=
X-Received: by 2002:a7b:c941:: with SMTP id i1mr170673wml.73.1596573196039;
 Tue, 04 Aug 2020 13:33:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200803143519.GB346925@mwanda>
In-Reply-To: <20200803143519.GB346925@mwanda>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 4 Aug 2020 16:33:04 -0400
Message-ID: <CADnq5_OCkSv5dgtxy2r1VApwTKXQe6oZapA+1VF2aj4Ux77-wQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Indent an if statement
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Harry Wentland <harry.wentland@amd.com>,
        Mauro Rossi <issor.oruam@gmail.com>,
        Charlene Liu <Charlene.Liu@amd.com>,
        Aric Cyr <aric.cyr@amd.com>, Reza Amini <Reza.Amini@amd.com>,
        Leo Li <sunpeng.li@amd.com>, kernel-janitors@vger.kernel.org,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        Samson Tam <Samson.Tam@amd.com>,
        David Airlie <airlied@linux.ie>,
        Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Martin Leung <martin.leung@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Applied.  Thanks!

Alex

On Mon, Aug 3, 2020 at 10:35 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The if statement wasn't indented so it's confusing.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_resource.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> index ca26714c800e..c6b737dd8425 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> @@ -71,7 +71,7 @@ enum dce_version resource_parse_asic_id(struct hw_asic_id asic_id)
>                 if (ASIC_REV_IS_TAHITI_P(asic_id.hw_internal_rev) ||
>                     ASIC_REV_IS_PITCAIRN_PM(asic_id.hw_internal_rev) ||
>                     ASIC_REV_IS_CAPEVERDE_M(asic_id.hw_internal_rev))
> -               dc_version = DCE_VERSION_6_0;
> +                       dc_version = DCE_VERSION_6_0;
>                 else if (ASIC_REV_IS_OLAND_M(asic_id.hw_internal_rev))
>                         dc_version = DCE_VERSION_6_4;
>                 else
> --
> 2.27.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
