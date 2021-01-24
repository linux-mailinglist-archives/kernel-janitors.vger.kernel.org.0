Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09A66301AC0
	for <lists+kernel-janitors@lfdr.de>; Sun, 24 Jan 2021 09:58:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbhAXI6F (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 24 Jan 2021 03:58:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726627AbhAXI57 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 24 Jan 2021 03:57:59 -0500
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65F8DC061573
        for <kernel-janitors@vger.kernel.org>; Sun, 24 Jan 2021 00:57:19 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id x78so10142141ybe.11
        for <kernel-janitors@vger.kernel.org>; Sun, 24 Jan 2021 00:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xbF1mNAqdjt6pF27M4Hr/suubaI0R9or4jXG3kHGIy8=;
        b=nWAZ+O8Zp7OY0TqNThphKUUyF1XbqJOf8OuoYYThPPPeftSphkfopef811U9dfB2+d
         s7hL0Sc7JvpMndi3VfQUnjkgJY17pWjuV0BtS6NCIO+Yj4zp6X0T89U57G94qDJvue6X
         IVfSWKviVKegxFQt1XqXJSKO8VW6ylbAtWQZTXVAZR1c14iKWv+4QJCjiKryumqOEbq3
         Idl1zwtcNN2ziJUPWrCjWvP3hdbuMGfhlziw68t6srj+y7ExyHN8vTegokvlYtDsJt8v
         NVHUG5Bff7IZ/eLIKp/w0BY+qW2TgXoie+HNLXHaNv2a/fMK1GFCSCMNKwjJNlsYjOgU
         FsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xbF1mNAqdjt6pF27M4Hr/suubaI0R9or4jXG3kHGIy8=;
        b=VybwHiAe2BaFg2vMJWojSLLqIE8Psrz+KC71k9tmI2zURlGMql9oInvWXCpETjypfP
         bHwvPt0NaVv0Kbg7vUBstu+WTlFnoUGQ6r3DgdkkgOAcpYSJRiS2skFL0uQ0aXve4qPh
         qoK+nmdycxxBf98+E5KWEEFmYko8BQCNk0C5mBJ+Tqirkh3+EibKUHaMs7WlMCUI2fg8
         Jd9LcQrwx9s3zB0DcqlbL8i+3X6BnOqTFEel4NqgtFWHlrLwicRkfnlwtkF0U0SrWB5/
         tRzDr/cSNgdDG5qHFfvGTPPgMu3XSkesT83gmzyx/XgzhlV+8evQeqk2JVXfGzCvE3h1
         lrwg==
X-Gm-Message-State: AOAM531BjZJv7X2wccpoXvYwu9KemveixWLyMvlLaQmXidvz76FJkpoU
        mYr+x+utPVRlNTj+bZUuP7vjM5ghVmRIBl8LNHzvZQ==
X-Google-Smtp-Source: ABdhPJxmdNoFIpdMva2PnQU6ezLs86DHUnPNE09QJJoWpJHcH5YKgHlUKaW0XZJwPcLlFNi/QehMs3F9fqGWrQmpjm8=
X-Received: by 2002:a05:6902:1025:: with SMTP id x5mr4087405ybt.96.1611478638385;
 Sun, 24 Jan 2021 00:57:18 -0800 (PST)
MIME-Version: 1.0
References: <20210124063253.720637-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20210124063253.720637-1-christophe.jaillet@wanadoo.fr>
From:   Saravana Kannan <saravanak@google.com>
Date:   Sun, 24 Jan 2021 00:56:42 -0800
Message-ID: <CAGETcx-S1g2B0_twNm=Wy7xfLTpzptxH3KSjnJWSppx-qtfVhw@mail.gmail.com>
Subject: Re: [PATCH] driver core: Fix a reource leak in 'fw_devlink_create_devlink()'
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Jan 23, 2021 at 10:32 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> In 'fw_devlink_create_devlink()', all exit paths, successful or not,
> release the reference taken on 'sup_dev'.
> All but this one.
>
> Use the existing error handling case to call the missing 'put_device()'.
>
> Fixes: f9aa460672c9c ("driver core: Refactor fw_devlink feature")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Speculative and compile tested only
> ---
>  drivers/base/core.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index e08d376631cc..8775717a6bf7 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -1623,8 +1623,10 @@ static int fw_devlink_create_devlink(struct device *con,
>          * cycles. So cycle detection isn't necessary and shouldn't be
>          * done.
>          */
> -       if (flags & DL_FLAG_SYNC_STATE_ONLY)
> -               return -EAGAIN;
> +       if (flags & DL_FLAG_SYNC_STATE_ONLY) {
> +               ret = -EAGAIN;
> +               goto out;
> +       }

If you check a few lines above, you'll notice that to get here sup_dev
== NULL. So, this patch isn't needed. Thanks for reviewing the code
though.

-Saravana
