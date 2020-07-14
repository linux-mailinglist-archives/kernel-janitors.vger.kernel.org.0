Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 274AF21F5D6
	for <lists+kernel-janitors@lfdr.de>; Tue, 14 Jul 2020 17:09:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728776AbgGNPIm (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 14 Jul 2020 11:08:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbgGNPIl (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 14 Jul 2020 11:08:41 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 759FFC061755
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Jul 2020 08:08:41 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id z13so22315157wrw.5
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Jul 2020 08:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UbX2bjs/oBRcyuIywFMctLsFmo7SfvwfpjGO6mWLN98=;
        b=bi7iqtbZU8UMprFFuKEfINolIXoycfFxpm9KOj3oWvlVbK5RmxSceOV6H8W8PN9PfY
         mxlVTBsLI6qRF/jOnb5qtnjnyjFftwiNTqdNJxf7LS9hujizvTecJ3n6Olxjao/pIWpc
         Ai0xZLQ54J0ZIO3K+NayvXCKd1UUEnxqAs0QwfouzYiM1RkFBFRUk8AWWWDR2OUGqOUC
         +DZiozYCqX2hGz6FQFMPhg1Kly1b/2gB1E4xQ+6d+ZRfsiu05iubMOPOwGpxQZrNiGnB
         Dg41711CAdrS6ROlhUBKNTVYG5Q/EvpFMZ4O8NwBw57QG6Y6xSurtesokZWvJTbSqUBp
         sDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UbX2bjs/oBRcyuIywFMctLsFmo7SfvwfpjGO6mWLN98=;
        b=r+PCfpWiKZ/vY4L6kVeDMtYRjOAgRY0Hfp+yyYfEkyEwW9e9WOFQPgRoH6mHlDPPbD
         DdMDu9SjEMCWjID6qDNdwi/bIkz0PnggnpxxjrD/gSWZ9e4uhenl/b8M0swUBMo/Tnhl
         uLWT2x9rHCxxBDxugep7sIA61ap4YSoGWp+LHFBG3QdjnCcH5/zlfNtf/BZLvkHBzEbk
         7c8r2qT4LDcZ3tuuTPQAGw/I8CBvksx6JrDzjJZNWq0+MbIGrvMhQgbpbcADrXZWRnT+
         xPIUwSyh/yLpXsWsW9coNAxM1bbQPZz8QJbYmCZftYx4QQpenP+e+Y2JE6kbP3Oagpv0
         Jnhg==
X-Gm-Message-State: AOAM530yiUh7EtIKbgk86pegu3UvPfcPr3mSMActcV6qwnADqSE9mhLO
        DLwZcAWgvTwMSXyvnTJX7r9xdg7LQkuTa4r3E0E=
X-Google-Smtp-Source: ABdhPJwWQdMpzC76cHpXyz09/KUcw5IaQOdsgkXV8Rx8l52Oii4V4Gv7V0l+r2yooVtQ5gGFzKiE7xcSzlFHKh7oWpo=
X-Received: by 2002:adf:ef89:: with SMTP id d9mr6646727wro.124.1594739320213;
 Tue, 14 Jul 2020 08:08:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200714105700.GC294318@mwanda>
In-Reply-To: <20200714105700.GC294318@mwanda>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 14 Jul 2020 11:08:29 -0400
Message-ID: <CADnq5_PjbNie+rdxttjYuykhWSC4VrE+U+xFYeYurvYixeiPVA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove an unnecessary NULL check
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Harry Wentland <harry.wentland@amd.com>,
        kernel-janitors@vger.kernel.org,
        Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
        Leo Li <sunpeng.li@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
        David Airlie <airlied@linux.ie>,
        Yongqiang Sun <yongqiang.sun@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Martin Leung <martin.leung@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Jun Lei <Jun.Lei@amd.com>,
        Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jul 14, 2020 at 6:57 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The "stream" pointer can't be NULL and it's dereferenced on the line
> before so the check doesn't make sense.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/core/dc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
> index 4f97329d9daf..7e58f242dab9 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -2324,7 +2324,7 @@ static void commit_planes_for_stream(struct dc *dc,
>
>         if ((update_type != UPDATE_TYPE_FAST) && stream->update_flags.bits.dsc_changed)
>                 if (top_pipe_to_program->stream_res.tg->funcs->lock_doublebuffer_enable) {
> -                       if (stream && should_use_dmub_lock(stream->link)) {
> +                       if (should_use_dmub_lock(stream->link)) {
>                                 union dmub_hw_lock_flags hw_locks = { 0 };
>                                 struct dmub_hw_lock_inst_flags inst_flags = { 0 };
>
> --
> 2.27.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
