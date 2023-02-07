Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0875268DF48
	for <lists+kernel-janitors@lfdr.de>; Tue,  7 Feb 2023 18:50:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232177AbjBGRuB (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 7 Feb 2023 12:50:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231201AbjBGRt7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Feb 2023 12:49:59 -0500
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D91821BC3
        for <kernel-janitors@vger.kernel.org>; Tue,  7 Feb 2023 09:49:58 -0800 (PST)
Received: by mail-vk1-xa2b.google.com with SMTP id g25so710562vkk.11
        for <kernel-janitors@vger.kernel.org>; Tue, 07 Feb 2023 09:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jq2WTnUOKOlouEj9rhMJsPCKZ636O+FLTpfvi8EpzGk=;
        b=pNLJpHP1McY8BIX7M1KsXNR98xK6Okw7ZLSmxEa32RZd0YLzSdnwNLUhsjf3X6bJLB
         z9gEGsARi7VW48nVivnQPt56f45T5UZdiinjUT61tgJVB+zINfshW6/gXyix5/11BiTj
         uKF/Ju6nWBzKVgVfja85yNQOoG1RC3UCNVFtvu6Q5+WUxgcqjZf8g+NuLIu9xhsflbqO
         RAKou2GKXaNNxlrtcO3zIuKYUF3wYRwwHblR5w33XbCoGoFfSzNJa5jG2aRUPQYH7UeL
         obAT5bXPijJF8CXWz3fv5CWeeFNfkujMGR9MLiXm+GPyPgkV9WUoNS7CUtRW152LxF0e
         t3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jq2WTnUOKOlouEj9rhMJsPCKZ636O+FLTpfvi8EpzGk=;
        b=fhzPizyPusSPC172nfYBZQNRvP56O1TzxsC6z8HX/4PbfWeztezRjFcIj3fETQCP2R
         lPezb7s++utO/SvwpcyR9sKZAG/qL8b2str7MSLgh0mzIjlv0q/kvLuNUKsYxhhWsbRw
         PaYTJ3Hq1RvRDsmIooStArBvtvqJEWVBVVMcZUWRu6uZZjb9e1gyDHvVir0VAQeXrxDu
         c4HDFGa8xdeb2Szy0cOMxGKuPjBAKzLlBhamXWN0MJgCddPPeOBk5RSGi4l6NpUBdI2s
         MvTFk/Xq7J/x0KQ4DuQl88XvXXBvs3Vyi9yPAe8EBtMyuGxL36iMYipVYSkcq7wApPQB
         lCzA==
X-Gm-Message-State: AO0yUKWAyNUMlaX0wo50XfDsydQ2gixE6eQvnY4PKcVyUERR4+BBkvgk
        Om/8y0aVZ4c7QTmPEuXWRE13zxVHNF4r3SYelnkjGg==
X-Google-Smtp-Source: AK7set+6EsmzH/1uinKsBljoDIrb4rmosrnVxPNeqIwTFKopf7huIhtQL1p9wYVL2AhexhvDRphZZ4Gd6ODYQ3L+Z1U=
X-Received: by 2002:a05:6122:226:b0:3ea:49cf:10e2 with SMTP id
 e6-20020a056122022600b003ea49cf10e2mr591913vko.19.1675792197917; Tue, 07 Feb
 2023 09:49:57 -0800 (PST)
MIME-Version: 1.0
References: <20230207091443.143995-1-colin.i.king@gmail.com>
In-Reply-To: <20230207091443.143995-1-colin.i.king@gmail.com>
From:   Guenter Roeck <groeck@google.com>
Date:   Tue, 7 Feb 2023 09:49:46 -0800
Message-ID: <CABXOdTePo76u1UAP0VsYBJZiPaOEk=hZe1cLeMseRvcFOsJ_Mg@mail.gmail.com>
Subject: Re: [PATCH][next] platform/chrome: Fix spelling mistake "Attenetion"
 -> "attention"
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        chrome-platform@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Feb 7, 2023 at 1:14 AM Colin Ian King <colin.i.king@gmail.com> wrote:
>
> There is a spelling mistake in a dev_warn message, make it lower case
> and fix the spelling.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_typec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> index 71f5d7d8e055..a673c3342470 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -1020,7 +1020,7 @@ static void cros_typec_handle_status(struct cros_typec_data *typec, int port_num
>                 cros_typec_handle_vdm_attention(typec, port_num);
>                 ret = cros_typec_send_clear_event(typec, port_num, PD_STATUS_EVENT_VDM_ATTENTION);
>                 if (ret < 0)
> -                       dev_warn(typec->dev, "Failed VDM Attenetion event clear, port: %d\n",
> +                       dev_warn(typec->dev, "Failed VDM attention event clear, port: %d\n",
>                                  port_num);
>         }
>  }
> --
> 2.30.2
>
