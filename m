Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F8C19AC5B
	for <lists+kernel-janitors@lfdr.de>; Fri, 23 Aug 2019 12:03:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390037AbfHWKDL (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 23 Aug 2019 06:03:11 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35606 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730580AbfHWKDL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 23 Aug 2019 06:03:11 -0400
Received: by mail-lj1-f196.google.com with SMTP id l14so8343592lje.2
        for <kernel-janitors@vger.kernel.org>; Fri, 23 Aug 2019 03:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nSBz+3Ajg0zUkEHOpalFy2yQQERAUt33EX4Z6O2112Q=;
        b=Qqbt7Hg7CVMJ++GMLAdQEdO5V9jYs6VU8k5Bb8ML6AnhICBExaR4DjFJFmQ0NzNuYg
         sbHDg5E0qPzUgFo/PS7UqlpYU8Q7IkC3yhgkNUVXiNT7Z9oy02pGpElc7Cx617GhQ5bT
         fdl4cZlVArIRQmvmtcE/+ktEuqhIdbU8oGRyAOaBsqRse5q6yZPnGYsjVFdMl84v9qFo
         i3jTov1EHj3JqU1+740PmIgYO2WxvE4K6zJihYHaEm3EX7eZZzTFuJrEyoYhVYCsesu5
         QCAUmZ5er+iYxYZj7EiDOTWvJFkXwQbA7pmT+eZy87XDQK9NC8sAyfNuMN3SXXZxfHIn
         bNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nSBz+3Ajg0zUkEHOpalFy2yQQERAUt33EX4Z6O2112Q=;
        b=UuVIwi/uO9j/tQzchW79WBFfoBhIuceCGwDIEw8d71GpYgJnVqB/ABByCNZiDTXjoN
         IEfuT4+u76W02wMa6CNNPD08Sjvysom3rG2haZLEtLzdwzeIR8vvwor4G+X6KWDbkYJw
         KkhqhXmqVetIhlJuN6C/EY9M+z3R/SDql39x73KoWYwBjNtaupieqqh9qJXsqYXlrP1w
         NYtRI5DeRQl524tIHT+3X2EVD/uERDUFnBjRlJFGS4sLwzH+z+nJxPOKvMcIxz46mLCS
         KChRPKOuz3Q0+Y617f4ETvC7pk6gw3iRsbGtydMQqi2AkgMl+wjD/gUvtJtQlGNbyvn0
         yLug==
X-Gm-Message-State: APjAAAXxxKmFIGxfHnaSZCaxbLk9MCKfIY3EQt01obckUBRPSUazjN7N
        vKOXoj9ZumtZTQcqD5o+WkBeJQXptLSOZ2LtgUqtWw==
X-Google-Smtp-Source: APXvYqxTjn97YdwzicnGq3IvnbKXlScd2i/LCcZyVhZZvRtC+Dg4mYSvpgp9/b3MPiBed4CvWtwmVE/lJdpaeT8Pa0g=
X-Received: by 2002:a2e:9903:: with SMTP id v3mr2446810lji.37.1566554589125;
 Fri, 23 Aug 2019 03:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190822204538.4791-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190822204538.4791-1-christophe.jaillet@wanadoo.fr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Aug 2019 12:02:57 +0200
Message-ID: <CACRpkdacDZTnT2myMrsPLMZYkonGbFu27nr_A1hgw1AKozMMgQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: ftgpio: Fix an error handling path in 'ftgpio_gpio_probe()'
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Aug 22, 2019 at 10:45 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> If 'devm_kcalloc()' fails, we should go through the error handling path,
> should some clean-up be needed.
>
> Fixes: 42d9fc7176eb ("gpio: ftgpio: Pass irqchip when adding gpiochip")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch applied, thanks!

Yours,
Linus Waleij
