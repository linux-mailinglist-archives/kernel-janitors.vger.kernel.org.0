Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CB3E4F1CE1
	for <lists+kernel-janitors@lfdr.de>; Mon,  4 Apr 2022 23:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355523AbiDDV30 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 4 Apr 2022 17:29:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379826AbiDDSLb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 4 Apr 2022 14:11:31 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66D733A5F9
        for <kernel-janitors@vger.kernel.org>; Mon,  4 Apr 2022 11:09:34 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id m12so2304298ljp.8
        for <kernel-janitors@vger.kernel.org>; Mon, 04 Apr 2022 11:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Uz4lPE2rdo2tRM1taU9hjtHkKN6cEscjMgtJGGpCZK0=;
        b=AKh+Xx8Jri22FLpKBD4E3RoftVzjoBrDVxvOksJJs1GiZpvdGJdEX2vPXJvyGWVcDC
         Tsws7vziNMKhEc1zFl/txeNmPo/Wx7XJU0EJZq+3mQ6ntGZLXmpSi8w6nhlFDGUBzWmX
         Yq+MB4VarfRzItJWG71o6LZ/2bUZ5IMRLDkDDxXbx8gBkWa58++9ibIS0lfl8QXbFYIc
         e6nDCpIHZIZkDQigSykJm8MIxAStv7nYv6rs85ZIHdGzECyEPFVpFeNZslA0YGNsgm/J
         vb7bEkgtvx02wVWUHzX1C4z68lOmkxFEyA4y4BJ3/zRjlRU1yBfRbZ5ORhOrFwx5FwrM
         BsDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uz4lPE2rdo2tRM1taU9hjtHkKN6cEscjMgtJGGpCZK0=;
        b=dtN3xgHqCnijazXRENiqetHwqZMDbFOfpxG64s9hjF8NWj8soa2zOaPPS5zTfGatvM
         r6hb/FolLJW2olQ33EncKkCs3cvC0SPyu9N7WUGUzaeMPUQkvXohc3KbFYmJIB8TSgzm
         vL20iGJAhl0d3OpTA02lqlZLBQecTQ8W6ex6OftbSJDW45qz6S/LnFT0mFeqE445AO8b
         y7/OPkvhWA0kgfKb0/s1GKWfoBF10Y3iDR19DFpI7aHL9KhXaNQ6yi1XP2w+KTIaewKg
         u5zQrw1UsOxEarfuwkf1AESvkv5ZgjnW0QVDTGmj4cgYnfIq0iifEwlVBQ83FB/qXOt/
         ksPg==
X-Gm-Message-State: AOAM531xbP7O8ZfDYrzHRNIJ5xEimhT1mekNIH3+ErphpLbhuAl/Ue1g
        yMKbtwrMbTObecQZYN38UeLHiVf1e0Bx/wH7bvQhZA==
X-Google-Smtp-Source: ABdhPJyEamkccvVwsWuiMfR8yOe39RymGH9/TLP+zLi/6TZpWH3im6mHt1c9jyr67LnqZRKEZnZwcP1sY9HjUQIPna4=
X-Received: by 2002:a05:651c:1588:b0:249:b90d:253c with SMTP id
 h8-20020a05651c158800b00249b90d253cmr525887ljq.408.1649095772447; Mon, 04 Apr
 2022 11:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220318000055.79280-1-colin.i.king@gmail.com>
In-Reply-To: <20220318000055.79280-1-colin.i.king@gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 4 Apr 2022 11:09:21 -0700
Message-ID: <CAKwvOd=GRBTs43JcwMBS=aEYtOXLP+SVEj3d89LjcfJJZLOZ5Q@mail.gmail.com>
Subject: Re: [PATCH] amd64-agp: remove redundant assignment to variable i
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Mar 17, 2022 at 5:01 PM Colin Ian King <colin.i.king@gmail.com> wrote:
>
> Variable i is being assigned a value that is never read, it is being
> re-assigned later in a for-loop. The assignment is redundant and can
> be removed.
>
> Cleans up clang scan build warning:
> drivers/char/agp/amd64-agp.c:336:2: warning: Value stored to 'i' is
> never read [deadcode.DeadStores]
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/char/agp/amd64-agp.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/char/agp/amd64-agp.c b/drivers/char/agp/amd64-agp.c
> index dc78a4fb879e..5f64991c73bf 100644
> --- a/drivers/char/agp/amd64-agp.c
> +++ b/drivers/char/agp/amd64-agp.c
> @@ -333,7 +333,6 @@ static int cache_nbs(struct pci_dev *pdev, u32 cap_ptr)
>         if (!amd_nb_has_feature(AMD_NB_GART))
>                 return -ENODEV;
>
> -       i = 0;
>         for (i = 0; i < amd_nb_num(); i++) {
>                 struct pci_dev *dev = node_to_amd_nb(i)->misc;
>                 if (fix_northbridge(dev, pdev, cap_ptr) < 0) {
> --
> 2.35.1
>
>


-- 
Thanks,
~Nick Desaulniers
