Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19111697C06
	for <lists+kernel-janitors@lfdr.de>; Wed, 15 Feb 2023 13:42:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233745AbjBOMma (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 15 Feb 2023 07:42:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbjBOMm3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 15 Feb 2023 07:42:29 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2359932CD0
        for <kernel-janitors@vger.kernel.org>; Wed, 15 Feb 2023 04:42:28 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id d8-20020a17090ad98800b002344fa17c8bso1774516pjv.5
        for <kernel-janitors@vger.kernel.org>; Wed, 15 Feb 2023 04:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SvSl6ThCdWqKRe4zYfnxgKVIEaSQwkIeIdBTFRT8VP4=;
        b=f5k6dXKGOzQe2OiwqhZWuJhlBG/hvEe1Xtdgd8K8uvklzP+vSCnptaYdFKKBDzk6Jw
         UD5rL/utjWjkowKEbm4C86tJwgP3AAW4e72/1ZKykKT+aQVrFVT+WLE6UZLTxfHTjogU
         scTesfe9gskIuu2MOOWGmyxGyy8zA7ITMlOj4HPuxSWrNWP50TJedU8fN75PeRHQauqA
         2iafASMsrjTtsC5FaLsWmNHaUzyb4SRYcUDdrlMn8qIvR7m9gO1hFwGSP7tErcukT86o
         pQV5SMkWPxYCU5Yx3IZ8U6WNTq6rHQsm6RriK/t1HgysWh5ITHkWbjBbIvnp0HuKqF3T
         NJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SvSl6ThCdWqKRe4zYfnxgKVIEaSQwkIeIdBTFRT8VP4=;
        b=5ai+6FipaV/RkeHLLAcx0WkVrXb0mJoSoInAv0E1SpKfLAQuibLrPNSec+lh07Zs1V
         coylHAt4SP7pkk+n+ZIbhbcVX8MjPgropEGBDoLdn8MWfRlKmd7guUMlexcQ9U05FTgz
         DPvk8bcgBwRrYbZx+I13sGpG03THyI4niaVDhzaHlkRSvOYJKlf6SW03F4DeRUaNYgvP
         th8nObMCOsbI3302n0QBwyJKIsdYrJcxs3szutH/95iXUrJxG04q4G+VooyE0F/ivFrX
         bzQMxt1BiJag94bP/+L8BPxYEDm3gtJL9+K3HqoO1gwBZegSJmp+wlaqK/uHpzI6Vt3v
         a2fQ==
X-Gm-Message-State: AO0yUKVfc7FKYWx/ByzExYTjk1m59kyv5xmVIcvre2FsQMHB6BXlACog
        YqemuC5GCQXvZ8hO7naAImgTwlDxbODs/BXhzdXKDw==
X-Google-Smtp-Source: AK7set9xk53NZMnBPICoLZUVqQb9RhnSV1n12yQt1PuRnUTdI72hiz4+PIK1X6DLk8fsSd8wWAE1eY7iTZ2nkRjQOcE=
X-Received: by 2002:a17:90a:2dcf:b0:230:ae51:1cdc with SMTP id
 q15-20020a17090a2dcf00b00230ae511cdcmr461604pjm.120.1676464947685; Wed, 15
 Feb 2023 04:42:27 -0800 (PST)
MIME-Version: 1.0
References: <20230215080203.27445-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20230215080203.27445-1-lukas.bulwahn@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 15 Feb 2023 13:41:51 +0100
Message-ID: <CAPDyKFpmAB9qwkZN_=HoydR2_oO6ARU3nc-aSoANeq6gRg6J5w@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: repair file entry for STARFIVE JH7110
 MMC/SD/SDIO DRIVER
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     William Qiu <william.qiu@starfivetech.com>,
        linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 15 Feb 2023 at 09:02, Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit bfde6b3869f5 ("mmc: starfive: Add sdio/emmc driver support") adds a
> section in MAINTAINERS refering to the file drivers/mmc/dw_mmc-starfive.c,
> but the file is actually located at drivers/mmc/host/dw_mmc-starfive.c.
>
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
> broken reference.
>
> Repair this file entry in STARFIVE JH7110 MMC/SD/SDIO DRIVER.
>
> Fixes: bfde6b3869f5 ("mmc: starfive: Add sdio/emmc driver support")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Thanks for the patch!

However, this time William needed to send a new version of the
complete series to fix other problems too, which then also
incorporated a fix for the mistake in the MAINTAINERS file. I have
decided that it was easier for me to replace the old commits with a
rebase.

Kind regards
Uffe

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 945b86f93cf7..74a30e724f7c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19935,7 +19935,7 @@ STARFIVE JH7110 MMC/SD/SDIO DRIVER
>  M:     William Qiu <william.qiu@starfivetech.com>
>  S:     Maintained
>  F:     Documentation/devicetree/bindings/mmc/starfive*
> -F:     drivers/mmc/dw_mmc-starfive.c
> +F:     drivers/mmc/host/dw_mmc-starfive.c
>
>  STARFIVE JH71XX PMU CONTROLLER DRIVER
>  M:     Walker Chen <walker.chen@starfivetech.com>
> --
> 2.17.1
>
