Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6861E0A24
	for <lists+kernel-janitors@lfdr.de>; Mon, 25 May 2020 11:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389353AbgEYJTF (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 25 May 2020 05:19:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389105AbgEYJTF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 25 May 2020 05:19:05 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02FC5C061A0E
        for <kernel-janitors@vger.kernel.org>; Mon, 25 May 2020 02:19:04 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id b6so20006035ljj.1
        for <kernel-janitors@vger.kernel.org>; Mon, 25 May 2020 02:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ivv4U3PHcis2B80M8w+kgvcofnNEYSwN3GL3OCHkXLY=;
        b=C0OfrfuDAz6Y8SWn9kRPQRzJwTFuzjeUjeAv/8uYAsbDCC76OTiMRRB3ZH0+RQk5hf
         d6SKMlz8qVm52fq4TPs3/x8cC1HKxjsIszBfCqQPN9ReHPVBVX80sxUQmMTjLicxJ6Ll
         V2tEi+pOX1GvZcI9Gcusfy4292CKHUmgHILh4QOi5+Ch4uJ/EYM0+Cukfsnsm6sZoCsO
         PPB+R1yh4RELrSLsUgDkwJJst707f5SqvQ5zwLOOZwKpmQvphO63Q+vUOfrvr4BH1fGL
         YxpOQd0eW82OGV54YvnsLOwh1jtKvOQLiBnUTw9nU/Rj4dXFjmoEbCz3wwIE6Wk+Rxx1
         WPjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ivv4U3PHcis2B80M8w+kgvcofnNEYSwN3GL3OCHkXLY=;
        b=mcD243ZhtJlR+rNaNjcuzZhl2EfcUBD/xUNli+FMvOu024lxQAxVfqqJDUIo2uEfzB
         2um+SnKOebm9nprdRQ4M9VtVQcGF7hMdCca3vWL79qDsnl3rGtWuDXmp/D6TnX2/TnQ5
         PGAjskhptCELnQHWEvdFO5QM29jTx3LgSazDA7LrAGJtIIJRXkp1KDYIGpWPshulNCjS
         TMrRtzmLW0XhKyifwEpQ432X4H1wv3giWJF4btZZyEl1QCZenevbd7DZuG/xVhyyk+pO
         i5VMHtAkjqoQlcf6QAKBP1f7wq55xhJ08Wb7ExcuZcuvxc/pplIqL5mzVvS8CljjTwk1
         BHCw==
X-Gm-Message-State: AOAM530/Y1Z1JIetuGIbmZPXdPPTXrYp3RUSCzR9DDuUhhCnHG6d9a/O
        MSPDKhSTFyR/RkOeyfn9tne3k9y0xN2LTNHQdSggSw==
X-Google-Smtp-Source: ABdhPJzt8IHf289hS0GsYDzZdfoPvoz1pPBM7421ky0044/8DIl8iWL3/ZWtvqH2cXFMUtCkODclOesP4RIwcw9FUP8=
X-Received: by 2002:a2e:8e91:: with SMTP id z17mr10498339ljk.144.1590398342470;
 Mon, 25 May 2020 02:19:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200520120804.GI172354@mwanda>
In-Reply-To: <20200520120804.GI172354@mwanda>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 May 2020 11:18:51 +0200
Message-ID: <CACRpkda90y7p=5iBS0=WyYxDVRhMwdVUMWO3E5uvdwES=UZNrA@mail.gmail.com>
Subject: Re: [PATCH] bus: arm-integrator-lm: Fix an IS_ERR() vs NULL check
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

On Wed, May 20, 2020 at 2:08 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The of_find_matching_node() function returns NULL on error, it never
> returns error pointers.  This doesn't really impact runtime very much
> because if "syscon" is NULL then syscon_node_to_regmap() will return
> -EINVAL.  The only runtime difference is that now it returns -ENODEV.
>
> Fixes: ccea5e8a5918 ("bus: Add driver for Integrator/AP logic modules")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> The first patch which added this file doesn't give a good hint what the
> subsystem prefix should be so I just guessed "bus: arm-integrator-lm:".

I got a similar patch from Wei that I forwarded to the ARM SoC
maintainers that usually apply the bus patches for me.

Thanks anyway!

Yours,
Linus Walleij
