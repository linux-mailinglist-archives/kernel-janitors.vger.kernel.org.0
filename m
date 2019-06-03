Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A554432A84
	for <lists+kernel-janitors@lfdr.de>; Mon,  3 Jun 2019 10:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbfFCIMM (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 3 Jun 2019 04:12:12 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38148 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbfFCIMJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 3 Jun 2019 04:12:09 -0400
Received: by mail-wm1-f67.google.com with SMTP id t5so9974430wmh.3
        for <kernel-janitors@vger.kernel.org>; Mon, 03 Jun 2019 01:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=rA1VCD3GAb0PD3btTSc5UgdukJM3iIv+UYfmDc9ijRY=;
        b=HGDr+SaPaEwwAm5phsdsWmtpxmne/TyhXv5ImfuOj5Gdkuffhte9CgCwbYvRoDlMGW
         cZe1B3eJ6guyNqvjTTos4JKJ0TZtV7wTXJdtoL28/uBddgf9sTiCHJSdgOpLl8/VQKl5
         6eS5cwBV47ZjOAXI3mPTXUF9k67RJEO44bMyXgZ0gq/lakJg9LeGdKiY0v2OHO2wrial
         nW6bjAV1pfhovdKC8wax7NwTLOArUb4g664DhmxNdX1OCjpYA8pU/UCUPGPtzEZa2g/G
         IPVzQy/MrRWfbHKXecWu7c0/BNRP8WBhgTUYJOPMmyAcJSMWFhN3DAsuYiiRfBgD8GBs
         O7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=rA1VCD3GAb0PD3btTSc5UgdukJM3iIv+UYfmDc9ijRY=;
        b=CHn6SRikIlJl9XWpAhkh9DNpHfoiCQ/JjXFDl0kdmW59DIR9aQYUGJwWxnfYgU0htv
         lVumilPFOzMAlmEQwEMYqd7fegUlF7V3np8yFJ+rsyDJuVGZ7HeK9C2iW0WLJ7/UGuI6
         Uwf93RE3l/lY9bmcqvlOTAzaNNYwzHKuh9MDuO5qJ15ijxDHpJ1YczTB/I3MWirU7TtD
         X6iHz5VBIVU6KhPNPmuXYIO0omApxGT+QE7k+KK5gn9wkkS2mdbBrKA4dPnb9w/CsSSU
         mH9CryI3fkAFn5etltKX2C9caR5MOKXGRq7vC6dtZwntOlRtmW2lxzJ6BzUQl237MsZI
         1/aw==
X-Gm-Message-State: APjAAAWnU1Prc/WZmfykisZ9C9oNCebhi40mQ54QT9wnMAwl3lMS6L3V
        9Mhb8LIQ+u5icqbZdvJJ4w+pHg==
X-Google-Smtp-Source: APXvYqzs9kYOpuv0Oqi4vkNcyrdkKxl7+hada0n0FgsvyjwLdnHbT2Pjc30QWl9yRlT4LRH3YpsV6Q==
X-Received: by 2002:a1c:e356:: with SMTP id a83mr1365844wmh.38.1559549526778;
        Mon, 03 Jun 2019 01:12:06 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id x83sm12809175wmb.42.2019.06.03.01.12.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jun 2019 01:12:06 -0700 (PDT)
Date:   Mon, 3 Jun 2019 09:12:04 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Amelie Delaunay <amelie.delaunay@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mfd: stmfx: Uninitialized variable in stmfx_irq_handler()
Message-ID: <20190603081204.GG4797@dell>
References: <20190515093141.GA3409@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190515093141.GA3409@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 15 May 2019, Dan Carpenter wrote:

> The problem is that on 64bit systems then we don't clear the higher
> bits of the "pending" variable.  So when we do:
> 
> 	ack = pending & ~BIT(STMFX_REG_IRQ_SRC_EN_GPIO);
> 	if (ack) {
> 
> the if (ack) condition relies on uninitialized data.  The fix it that
> I've changed "pending" from an unsigned long to a u32.  I changed "n" as
> well, because that's a number in the 0-10 range and it fits easily
> inside an int.  We do need to add a cast to "pending" when we use it in
> the for_each_set_bit() loop, but that doesn't cause a proble, it's
> fine.
> 
> Fixes: 06252ade9156 ("mfd: Add ST Multi-Function eXpander (STMFX) core driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/mfd/stmfx.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Could do with an author's Ack here.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
