Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 091227A07C4
	for <lists+kernel-janitors@lfdr.de>; Thu, 14 Sep 2023 16:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240646AbjINOsh (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 14 Sep 2023 10:48:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240329AbjINOsV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 14 Sep 2023 10:48:21 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 800581FD6
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Sep 2023 07:48:17 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-d7f0048b042so1100823276.2
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Sep 2023 07:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694702896; x=1695307696; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2Axe2duEfuOBrZKGe1Hg8YlxOu+jjdU0N6PT8NsaFlc=;
        b=CN7xM2+heQyyVg8TI5eGb/2VbaZb70cBQ8Qaes9zrHzgNTj68oA54K5cNtkDQqdNfA
         jwAnS8iMGfYLbwwONGh22TPZowbJ62KuM3lCyC1+IYR+RmG+koFjY6+h9SgUQyhLqeyB
         zvxhtOsOk22BKe8GSTO50ysMbcl+2HcyNBouA3HoIQ48I5SqnihFBFjpYC6evY+sQyXT
         MRosYgtXwmjTsUoHZXPV8v/plFAJMU7ZG0Son9bF20vK1gHoocysn0GOx2PjQx5d4vaI
         2+njI0lkvKcUgn0hvUSccKwjmH/V4Btv7rDVKNn36xNYKE/yu0uGcZPgN4Aqli9rDVw3
         Z22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694702896; x=1695307696;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Axe2duEfuOBrZKGe1Hg8YlxOu+jjdU0N6PT8NsaFlc=;
        b=tBtOrlUW7jms0L+QgHyOVb5Ivtwt18/cK3UTJIxp1uGatmb25JeYnSxvqQjuKetELD
         TatlHMwnJBvQK1zoIiaHQ9VLr+99epgeDa6rnQrxrq2d8V1RT6yZLtUotQKUX2WdoyIU
         plCfTMmclebEHVC+j8/nfXN4hFTcKhfQGyIhqoBk2WpYHgUp8759fkk3LbgC7d7hym4J
         okTt8wGjkqllyIjM1DPXgo2DEhyXnnkspci6WA45P4j6QncPa/14mgoAONPaQXvi3N7N
         2/ErluTLaK+RKP05lIRpxnifHRHDIbldKxrOOM2Mz9PddgHY3bwNUfti/ftdGOAf1mv7
         KXeA==
X-Gm-Message-State: AOJu0Yy9Q2o4illgg5w9clWb8yZ7IGGFpwYEbavktMUfzKX5jIJ7wmDT
        e6T9EpsYAs63UFDxDe2OxO81ShzSJny/F0TeBll3/g==
X-Google-Smtp-Source: AGHT+IHnzFOVJ52w9x2aGfc3G1A0+Rb1tgxdPqm+H1YIyuSUJj1t9UQSZcaiUe7d1wKub3eYIasAy9G4f7OCUGke+go=
X-Received: by 2002:a25:f44b:0:b0:d81:9442:aab2 with SMTP id
 p11-20020a25f44b000000b00d819442aab2mr1757132ybe.54.1694702896742; Thu, 14
 Sep 2023 07:48:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230907095521.14053-1-Julia.Lawall@inria.fr> <20230907095521.14053-6-Julia.Lawall@inria.fr>
In-Reply-To: <20230907095521.14053-6-Julia.Lawall@inria.fr>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 14 Sep 2023 16:47:41 +0200
Message-ID: <CAPDyKFpEaG77cq+EgOavaD0zvDmOJVkjJyYq2kP30VtPSikY4g@mail.gmail.com>
Subject: Re: [PATCH 05/11] mmc: atmel-mci: add missing of_node_put
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     Ludovic Desroches <ludovic.desroches@microchip.com>,
        kernel-janitors@vger.kernel.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 7 Sept 2023 at 11:55, Julia Lawall <Julia.Lawall@inria.fr> wrote:
>
> for_each_child_of_node performs an of_node_get on each
> iteration, so a break out of the loop requires an
> of_node_put.
>
> This was done using the Coccinelle semantic patch
> iterators/for_each_child.cocci
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Applied for next, thanks!

Kind regards
Uffe


>
> ---
>  drivers/mmc/host/atmel-mci.c |    8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff -u -p a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
> --- a/drivers/mmc/host/atmel-mci.c
> +++ b/drivers/mmc/host/atmel-mci.c
> @@ -674,8 +674,10 @@ atmci_of_init(struct platform_device *pd
>                                               "cd", GPIOD_IN, "cd-gpios");
>                 err = PTR_ERR_OR_ZERO(pdata->slot[slot_id].detect_pin);
>                 if (err) {
> -                       if (err != -ENOENT)
> +                       if (err != -ENOENT) {
> +                               of_node_put(cnp);
>                                 return ERR_PTR(err);
> +                       }
>                         pdata->slot[slot_id].detect_pin = NULL;
>                 }
>
> @@ -687,8 +689,10 @@ atmci_of_init(struct platform_device *pd
>                                               "wp", GPIOD_IN, "wp-gpios");
>                 err = PTR_ERR_OR_ZERO(pdata->slot[slot_id].wp_pin);
>                 if (err) {
> -                       if (err != -ENOENT)
> +                       if (err != -ENOENT) {
> +                               of_node_put(cnp);
>                                 return ERR_PTR(err);
> +                       }
>                         pdata->slot[slot_id].wp_pin = NULL;
>                 }
>         }
>
