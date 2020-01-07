Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBD9C132407
	for <lists+kernel-janitors@lfdr.de>; Tue,  7 Jan 2020 11:44:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727883AbgAGKok (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 7 Jan 2020 05:44:40 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35243 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727862AbgAGKok (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Jan 2020 05:44:40 -0500
Received: by mail-lf1-f68.google.com with SMTP id 15so38545098lfr.2
        for <kernel-janitors@vger.kernel.org>; Tue, 07 Jan 2020 02:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RgFKZhJDfhjP3daFjJ6Yf6/c2a34ejzl3DxxsqYxSK4=;
        b=DllIUpp1Q6kXzivnO5X2buqDRRTX00jpFdjqNjevqokIijabbCuM9jomITXwHgjUof
         /+C195g6oInaXzgI+yid4TLVNxbPEuZlRYhPe+ociG+hHlLhNAYn3DtW88rHCxRkQVHZ
         zcH0zmtcTQlBCzt2YYQnpM0U3occFF39huSzirUhJ0eu/cxxQvobisdH6TZN401xKwp5
         cBHAjYyOoHG9zIC1fRyJCsBEoS8Tc96J2WHE7WUnrQA7BHqXaMk7iC8+5kqAkmReWSCa
         v0peScJcrLidcsLRn1+e6r4ETxrH0OCOvIbWEtZliknbhUC41peP2xZphiLk+3Axrg3b
         HvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RgFKZhJDfhjP3daFjJ6Yf6/c2a34ejzl3DxxsqYxSK4=;
        b=XhQuRUzKwEjx6uBVCwX9DYzwegCQYon2/RjwYZuixTtSQJSHH68yq49taZlucFtdxV
         9vBINwT7jcPrcOdorcyD4kQH/D8e9O0MVK4pOnnqNSHmn/ZzqROjZ19flJJC3XXbIOA4
         83QnCGC/WnhYIuFBNEEQu3jtK0sYc+OXgBV64DehYAsZ6nBK2BauVZzEp4TsnXOFd8eC
         LRRtbYcFW2XtzrPd/trMR4CSZ8OfAbwd4gHN/3oP6seuVJZ/jecwH+8+4cGpdUDgFAkp
         ml9dngwTAJwuEQkLq4GrP/J7LATSuE2X+Ubflgz+ZSgXF4Be5+vviXqnYcb+Q6Y3123K
         Y9WA==
X-Gm-Message-State: APjAAAU1C56Dx63OuJyzgrlJNid4htGfmbL2vmEER/wWZIi1j/+uDj7W
        44YiK52XPQ65ej5PuQ2JMVtyCKiI0aDtSf7HHapyHQ==
X-Google-Smtp-Source: APXvYqwCT73xBkNQ+g3rH+LQGftKRSrUx+BJ1w6jdMAWsxD0kcF9OCy3oy4cYwg0gSxNlboPKwLt9C01SWBHwRa7UkI=
X-Received: by 2002:ac2:55a8:: with SMTP id y8mr58604010lfg.117.1578393877863;
 Tue, 07 Jan 2020 02:44:37 -0800 (PST)
MIME-Version: 1.0
References: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr> <1577864614-5543-15-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577864614-5543-15-git-send-email-Julia.Lawall@inria.fr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 11:44:27 +0100
Message-ID: <CACRpkdackV3fDDr4SKPc-GVcW3TcCCYvumN4ibfPcvdfnBdHzA@mail.gmail.com>
Subject: Re: [PATCH 14/16] pinctrl: qcom: ssbi-gpio: constify copied structure
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        kernel-janitors@vger.kernel.org, Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jan 1, 2020 at 9:20 AM Julia Lawall <Julia.Lawall@inria.fr> wrote:

> The pm8xxx_pinctrl_desc structure is only copied into another
> structure, so make it const.
>
> The opportunity for this change was found using Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Patch applied.

Yours,
Linus Walleij
