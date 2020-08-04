Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4E2523BE55
	for <lists+kernel-janitors@lfdr.de>; Tue,  4 Aug 2020 18:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726086AbgHDQql (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 4 Aug 2020 12:46:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbgHDQqg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 4 Aug 2020 12:46:36 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BBFEC06174A
        for <kernel-janitors@vger.kernel.org>; Tue,  4 Aug 2020 09:46:36 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id z20so2614527plo.6
        for <kernel-janitors@vger.kernel.org>; Tue, 04 Aug 2020 09:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rX+uSk8WEhc0P/zYz9n8ej6ss0u7oJ9XP2D2IjvwVuw=;
        b=rwK6Hzu0amzA+ObyFxhuDXroOV1XbxuYNddJM7etyhDaN83XG/yy5M8Dw6nhSKsGXJ
         jRPcqY4s0Wp9H3f5pmda2w9LFdvBorwoCgmYTeee8UQRJd0FpfhtUbReNptdVOj/sT36
         ScyGo5c/ye1Ca2X1lUSezWjthESe2aWs40Py6oD8b/Xdn4DSbsZwZQgA0FsiyhlhPkaR
         30cQubaY3oLLG4BgeF7v87OXBbm/urfFfDbVSgeldkwoLtfTqkQZ82anWGVk5lNICyAs
         8FtYcgBRKDKtLWFBU4LlT7XQMnKXL4IK4GYPT08xZITMuy9QE50rHJ2yhHIbFEldDynJ
         xTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rX+uSk8WEhc0P/zYz9n8ej6ss0u7oJ9XP2D2IjvwVuw=;
        b=gNnA7TzpdbWCyjtZwAC19mAk0Wk9jrNIGaAtV3BsqFHnTwdQjJXKfvGzNpipmsS51b
         JdpMhHdRXmRzc98suFq4ILlUo2VuJjufWrxBXtWrNmXHZxDSGEct+ZuUW5vihZ9pFF+E
         Z9QqIT9VI1HmfXGHA1IFuEjXqWUeJKGT9OQbMTDD9MRmcqtXNl5vWo78fKLPcOVPp/9v
         R3USCBCUZDOaJ/tn2JY9dijtJ2eXwMWRQRgqnJyaGTknbFOIXwqWpkbRXzF7id+zktN/
         xqd8aarVHlViqCHsuVNSJSWk+2o7mPF+k69/04IOer14b4my3SplxmrAlD+7V+M6pP4d
         zZkA==
X-Gm-Message-State: AOAM531ZOHEQNmWG3x1b+yqpXTkLLnM5JRZnYUMHC6lOqMhJXWaTJAAE
        iN6HwfOyr89DvcsjbowGlqwv/BibdKiVHqnktDI=
X-Google-Smtp-Source: ABdhPJz+oFS8CDQFdTt4w4RvlmVsZLq2YThd3GwCpVm9WNiYR6D930hFvshrkVINrfymotDIQDM5wUEPDuf84C6dlmo=
X-Received: by 2002:a17:90a:ec0c:: with SMTP id l12mr5305203pjy.90.1596559595405;
 Tue, 04 Aug 2020 09:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200804101601.GA392148@mwanda>
In-Reply-To: <20200804101601.GA392148@mwanda>
From:   Vaibhav Agarwal <vaibhav.sr@gmail.com>
Date:   Tue, 4 Aug 2020 22:15:59 +0530
Message-ID: <CAAs3649ONrW=WNv=b-ErdSNZOuzCg+gMk0zbhirGuSQGi9KQwA@mail.gmail.com>
Subject: Re: [PATCH] staging: greybus: audio: Uninitialized variable in gbaudio_remove_controls()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Aug 4, 2020 at 3:46 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The "err" variable is not meaningful so there is no need to print it.
> It's uninitialized on the first iteration through the loop.
>
> Fixes: 510e340efe0c ("staging: greybus: audio: Add helper APIs for dynamic audio modules")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks Dan for sharing this patch.

Reviewed-by: Vaibhav Agarwal <vaibhav.sr@gmail.com>

> ---
>  drivers/staging/greybus/audio_helper.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/staging/greybus/audio_helper.c b/drivers/staging/greybus/audio_helper.c
> index 8b100a71f02e..237531ba60f3 100644
> --- a/drivers/staging/greybus/audio_helper.c
> +++ b/drivers/staging/greybus/audio_helper.c
> @@ -173,8 +173,7 @@ static int gbaudio_remove_controls(struct snd_card *card, struct device *dev,
>                 id.index = control->index;
>                 kctl = snd_ctl_find_id(card, &id);
>                 if (!kctl) {
> -                       dev_err(dev, "%d: Failed to find %s\n", err,
> -                               control->name);
> +                       dev_err(dev, "Failed to find %s\n", control->name);
>                         continue;
>                 }
>                 err = snd_ctl_remove(card, kctl);
> --
> 2.27.0
>
