Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC9DE5CDC2
	for <lists+kernel-janitors@lfdr.de>; Tue,  2 Jul 2019 12:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725922AbfGBKoZ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 2 Jul 2019 06:44:25 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34045 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725891AbfGBKoZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 2 Jul 2019 06:44:25 -0400
Received: by mail-wr1-f68.google.com with SMTP id u18so698923wru.1
        for <kernel-janitors@vger.kernel.org>; Tue, 02 Jul 2019 03:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=OPgaITAUGmErWNi8n3QqCt1GuBrNOUAjOylci0JPSQs=;
        b=dob6fWQ/N9yWnVlG41Qy9P37vq2bO3QtyJngZQXeEvL7CpECSt2eNta3XmJ7HJ/spQ
         u4l86afaq0zANf9OQ+STBHkkuLrkj485z/rYr6Q7KJgZH6hPDU13KEscOGUo+06N5YO4
         7WLN/armIbWj7I9W3TEb1ylHdMNWa52/KbPRkRdHlUQ7/TWg5C7/XGjU2SailB1yqd03
         +/om/e8Sgc0qKnrMTGcKKwkVxs6tGOiiB7bZ6DvCzqfJfNp+J9RyaZs5oIgoLUo+FcSB
         b4a1rOR5bcck1lTFcdtCv6TNE93rHtEh2X4bN6wSZ3iJDWkLnF3iT5ZugV8cNiSApMLr
         +dAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=OPgaITAUGmErWNi8n3QqCt1GuBrNOUAjOylci0JPSQs=;
        b=WP2emCv+O8rYEgJkvD/5GcH/uK/e2EeLV6JIekJlZl18gjBRNADE+YsGt5NLjxgpso
         tYhZl5OM7NYkGp/jHTZELl+i+Qq+ZHkswM1Q3hLINZOTcA464AoccKSGjT5Ah6xpyhlU
         Y3yQdujE3716Qf7wYXeV04ppwgl1f3bpFEF9D6/EhH4Fk0O28Ncub8npypLidwvCj/TA
         orekOnxX+IzLUSZ8qaTmroU7q2j1OFc0mH1iphkYfzWbA3EbKnTifgy/oPwGMAVDuoRY
         V7widsQEG2HZ4tBv0i0AKHnC6IxiaQAbMgvQhawehI43xAlmVOQURscT9ig+HMzAfkug
         WA9g==
X-Gm-Message-State: APjAAAWAQqqnuPp1j0ewugAxJyc37O4MXEO9I4zhQbQUcxne+vlUYIiN
        Fe2oxLL7o1Zfx6KNLneZJ2Qntg==
X-Google-Smtp-Source: APXvYqyLEju3wVNoXod9g6O9aDX3heGkufTtjp9FbBwFLavrJGAmqNpFBzsew0P4hqtBl4TkDNOOqw==
X-Received: by 2002:adf:f38b:: with SMTP id m11mr392068wro.79.1562064263005;
        Tue, 02 Jul 2019 03:44:23 -0700 (PDT)
Received: from dell ([2.27.35.164])
        by smtp.gmail.com with ESMTPSA id u6sm2639685wml.9.2019.07.02.03.44.22
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2019 03:44:22 -0700 (PDT)
Date:   Tue, 2 Jul 2019 11:44:20 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Colin Ian King <colin.king@canonical.com>
Cc:     Mark Brown <broonie@kernel.org>, Keerthy <j-keerthy@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] regulator: lp87565: fix missing break in switch
 statement
Message-ID: <20190702104420.GD4652@dell>
References: <20190627131639.6394-1-colin.king@canonical.com>
 <20190628143628.GJ5379@sirena.org.uk>
 <4cb0e4ab-66c7-2b3d-27d3-fd5cfde8988f@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4cb0e4ab-66c7-2b3d-27d3-fd5cfde8988f@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 28 Jun 2019, Colin Ian King wrote:

> On 28/06/2019 15:36, Mark Brown wrote:
> > On Thu, Jun 27, 2019 at 02:16:39PM +0100, Colin King wrote:
> >> From: Colin Ian King <colin.king@canonical.com>
> >>
> >> Currently the LP87565_DEVICE_TYPE_LP87561_Q1 case does not have a
> >> break statement, causing it to fall through to a dev_err message.
> >> Fix this by adding in the missing break statement.
> > 
> > This doesn't apply against current code, please check and resend.
> > 
> So it applies cleanly against linux-next, I think the original code
> landed in mfd/for-mfd-next - c.f. https://lkml.org/lkml/2019/5/28/550

Applied, thanks Colin.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
