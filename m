Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50E79AF9A6
	for <lists+kernel-janitors@lfdr.de>; Wed, 11 Sep 2019 11:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727440AbfIKJ6N (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 11 Sep 2019 05:58:13 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36812 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726657AbfIKJ6M (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 11 Sep 2019 05:58:12 -0400
Received: by mail-lj1-f193.google.com with SMTP id l20so19398131ljj.3
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Sep 2019 02:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k4dGhcxp6T6gSoKIxWokryHsNaeknVwfT4UnRhjgn/A=;
        b=tkDWR58vwuKS0da2FWu9u/M/Xn/DyAr+ZUrx/+cJp27zqKvp/xBOMk/VGYXwWTSTla
         RUGyo5mKpJkCSH4kikwfH+5eo9+R6rZIayBLRSf+XRHifxKTcmqIQ4gwFxUtB1L1mNNv
         C+y6q8VDxxIv11W0mSPewJcrRxVLCXfhy/zrVENzffiPUZWT19SmmXpXLxeHXmrBsWUW
         Z+acs/RypO6knajkSEc5Qz/wJsF/2ZvG/Tnm6Rf1dhTLkszi/Ebc+DrhWG1iSvuJcAmU
         OvMWljKcMJ9mFuT5LckIuewLzRHNMNjiVhbyaXyBbavOplfSxkteHCHD9wi0oaIvuhN+
         RE7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k4dGhcxp6T6gSoKIxWokryHsNaeknVwfT4UnRhjgn/A=;
        b=fa+E28nl+3Aim4pANDiTMeoE3bF+zGFw/ZLBV2bVuXarzkvA4S6IAtewYP89+RBRyF
         T/yZV4t4ByK7CEj961haNS+b0yOw1hzmmqC6ZpufBwqDF+rNfVtkGCbv6OdxR7QgrbMG
         6qYqANAsnSRbWaim7sSQdzu9aYkFmq6KUYqmYyGSbomqD6FFvvNJ9He3hnXmpDQwU4qs
         bTkUqEbj2MgrdxetX9eCK4PQ6+/T/NGJBYMMw8PLqsAUlRzkagwyIa+bdXGkX1Bnlq5C
         JxuS9E/ZOV7uxONmOiaCeY7kzt7VR4OurnOheAbaaXso4z4mvsyJja/k+26vGJhUs1Iu
         3+4w==
X-Gm-Message-State: APjAAAV7o4+oL/lbBOD9+tC9GrJJSfjDF6X1/1KzA7i2T+qxPV1ByqTm
        r+WnjCbdG+dJXi/jldRY3CBn79YUJBhaW3wQEeH5wg==
X-Google-Smtp-Source: APXvYqwbLg5jGI86j9e4EMl792llsAjTOPkGlSGFa4C8Xlkdq8JvUyl4zObZNLLqt7Sar4h37ifM08D33QB5mKjQPek=
X-Received: by 2002:a2e:8056:: with SMTP id p22mr17584388ljg.69.1568195890794;
 Wed, 11 Sep 2019 02:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190905140919.29283-1-colin.king@canonical.com>
In-Reply-To: <20190905140919.29283-1-colin.king@canonical.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Sep 2019 10:57:59 +0100
Message-ID: <CACRpkdbYKjKPAT=V8K_JtP49teq5q9GELkK-vc+mQEdwcU781w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: bcm: remove redundant assignment to pointer log
To:     Colin King <colin.king@canonical.com>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        kernel-janitors@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Sep 5, 2019 at 3:09 PM Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> The pointer log is being initialized with a value that is never read
> and is being re-assigned a little later on. The assignment is
> redundant and hence can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied.

Yours,
Linus Walleij
