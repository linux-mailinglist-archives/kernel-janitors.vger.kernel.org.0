Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD8497BC0F2
	for <lists+kernel-janitors@lfdr.de>; Fri,  6 Oct 2023 23:06:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233625AbjJFVGy (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 6 Oct 2023 17:06:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233587AbjJFVGw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 6 Oct 2023 17:06:52 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40518C5
        for <kernel-janitors@vger.kernel.org>; Fri,  6 Oct 2023 14:06:50 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-59bf1dde73fso31294987b3.3
        for <kernel-janitors@vger.kernel.org>; Fri, 06 Oct 2023 14:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696626409; x=1697231209; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egoxSxKN+ZMkeugoT/kUt3XprXYVieeNQaAZQMJClpk=;
        b=XGi7hIN+0B/AbUKbHvutMO8TaXgkbQa7xfWMzLPv1zAggzSgzKmfqbqbowZaY757jf
         Ee7FbJpm8RZqKUhSvJVY/2vif7Enz+tlj9DWfZrxIcUj37bL6b345CG5XzjY7niBY3eg
         hh+8M0vAOuEDddE8iZI8ueJV45VTyoHouFakhSPh4s4fN7H4I/7y4EB3oXyOBG58e44R
         KrZBIGTUzzhpbLQY2ItH+7KKNLIAT7HBPBPZQtaxB8slsdSC/07pzyLLg2QZNyluLvzw
         yt+TXaIs75N5uhnR5okWB0zySagKtpf1P9cD3GYCZe53cRGlb5Uy0dpNAsqm9wbbsEk1
         Krzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696626409; x=1697231209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=egoxSxKN+ZMkeugoT/kUt3XprXYVieeNQaAZQMJClpk=;
        b=fTFJHtB1ZcauQZ/JNsmSeYO6VDJJn8JDf/ZHMD20+fuNJ69RTHWPN2udx8YOK5IVzb
         P7Placg5TCFxyfj6rzS61xcKtjaNrQtrWrT5G2zCTX6BKFicFlT6/LoV5a3q3vgny7Yp
         qdudu89DHksoMQluKQFHerP27eog0j2kZ6ohJQUgZvZVh7onyusxT/ycNniFmtkBm/4F
         6MMHtUvu2HQrnLd/iggT6q02G3y87thX9CtWvMarxD4xvx5r/eOnoj0ReTcUkdfRxRMc
         7q+Tk+NRZzCdlwSWCiYV7qPDCdsy3c3ELwWFem7+ko28ZakzmO31iWqnS7oGBUBnTUMT
         8ykw==
X-Gm-Message-State: AOJu0Yxqq6jamU6R5VWMyQVn7KsbxWPNOEbbrATlhpdEKLMG4Y4HDVoo
        rfyE19lM+3w8WVqoOQgkylkGoEByWyqs0Myp6OoLLWqeoiKVKoiB
X-Google-Smtp-Source: AGHT+IHdVyawJoRudSa9iKSZ39j9tlq922NoQfdcWxc8OgHfiizOq1addiquh72se6GjtTxAS9xRLi8mhk3/l+KdbYk=
X-Received: by 2002:a81:7309:0:b0:59b:2458:f608 with SMTP id
 o9-20020a817309000000b0059b2458f608mr9772234ywc.30.1696626409493; Fri, 06 Oct
 2023 14:06:49 -0700 (PDT)
MIME-Version: 1.0
References: <590b337a-13ce-4391-a09d-d2b06fbc912d@moroto.mountain>
In-Reply-To: <590b337a-13ce-4391-a09d-d2b06fbc912d@moroto.mountain>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 6 Oct 2023 23:06:38 +0200
Message-ID: <CACRpkdaHY0qi1EX8sZ51Nibe5_Rxe4ZKex5sM5nr2aYK8aVt5g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: realtek: Fix error handling in probe()
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Tzuyi Chang <tychang@realtek.com>, linux-gpio@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Oct 5, 2023 at 4:01=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:

> There are several issues in the probe function:
> 1) of_iomap() return NULL on error but the code checks for error
>    pointers.
> 2) pinctrl_register() is the reverse.  It returns error pointers
>    but the code checks for NULL.
> 3) The error paths need to call iounmap(data->base) before returning
>    to avoid a resource leak.
>
> Fixes: e99ce78030db ("pinctrl: realtek: Add common pinctrl driver for Rea=
ltek DHC RTD SoCs")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Patch applied, excellent work as always.

I just sent out some more patches to the Realtek stuff, I could revert
it but it's overall nice to have so I try to just fix it up.

Yours,
Linus Walleij
