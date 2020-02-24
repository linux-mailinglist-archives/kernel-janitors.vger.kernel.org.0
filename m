Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDC7616A451
	for <lists+kernel-janitors@lfdr.de>; Mon, 24 Feb 2020 11:51:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727281AbgBXKvH (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 24 Feb 2020 05:51:07 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33566 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726673AbgBXKvG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 24 Feb 2020 05:51:06 -0500
Received: by mail-wr1-f65.google.com with SMTP id u6so9834953wrt.0
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Feb 2020 02:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=kRZXlrxsXiUp76pJUg1A1idTwmDFL/za+p20Iqq28LA=;
        b=aWpye4I3V+5CEJjrj2uJR2xdbJS/+LF+RYdn4SVnfHM9zW4soJtQ4DDCMlq2w8ovK0
         Ne7XZTqiG87ZTLAd16bMV86ij+XfEGZ9bdyoAhvgJQmUWZONyDwo+FuC6jAI0Ev9yd3w
         iLQJ+n9OeXvD6/P3xfk9GVRurzCDqhcs62ad6RhI2qMZJPfjl7S5ZRZwSgDk/E1Xp5GG
         P03a78iPpoFRBGzbWcA/a+oiLtSnw7+gJtTsRPT9MU8MxiMQR4i1kXwBgIz3piUYxLR8
         zpA90VETnE0sbGG7q1y46Xa6FF20y4h8NEvoWw5EruFK+LE9cXNWHD9EjMBkecD4FZFm
         MpVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=kRZXlrxsXiUp76pJUg1A1idTwmDFL/za+p20Iqq28LA=;
        b=SH66tJ0epcrnpgqi/Ctdcg6icYMcHvrEOZMkjeV6P/BqgrluS+Ixwygxc+KPcajbRI
         leh1yGJS6aIkeFA+O2bfiIqC4UxFvrpUbkUa0tNyqcRLr+7c+UJMSvZGH35HD5uktFJu
         NjxYteuR08wDu6lgm2Y3jLcwAdhcyWygum4q+jMkQC2Wvlv089DweYzCgRQmB6YT1o8S
         1xYyaTKmVYToGoJMOrankjWR/AVyXSLJp22FZ+EI/8gOq+6Jx3Z3rNPgAp/y1B9RCdRH
         5AX29tU1PnupTqe8aZMf2itU9Sthe/ORyl6RhIpRaWdWh+MEPWfa2ONBsAGkV63NcZMk
         6YJQ==
X-Gm-Message-State: APjAAAX3TTl+G9Oy3Uw2k2IcdJvlRHnIi31vTRMPBzVpfCD+rf058c7A
        El1YKW3WfGmcd3Q+8JnqEaOjHA==
X-Google-Smtp-Source: APXvYqxrdCUTNHecQ/lWt1/A5Ue3ifumWztPy7Ua4Idfks8Z+yOSveQHA4M4xhgaYqjMo1tm6Jnzig==
X-Received: by 2002:adf:a19c:: with SMTP id u28mr65545868wru.221.1582541464079;
        Mon, 24 Feb 2020 02:51:04 -0800 (PST)
Received: from dell ([2.31.163.122])
        by smtp.gmail.com with ESMTPSA id w19sm16854001wmc.22.2020.02.24.02.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 02:51:03 -0800 (PST)
Date:   Mon, 24 Feb 2020 10:51:34 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mfd: Kconfig: Fix some typo
Message-ID: <20200224105134.GQ3494@dell>
References: <20200216113242.20268-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200216113242.20268-1-christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, 16 Feb 2020, Christophe JAILLET wrote:

> Fix several variations of typo around functionality.ies
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/mfd/Kconfig | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
