Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED06E5CCFA
	for <lists+kernel-janitors@lfdr.de>; Tue,  2 Jul 2019 11:51:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727220AbfGBJvu (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 2 Jul 2019 05:51:50 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54492 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727208AbfGBJvu (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 2 Jul 2019 05:51:50 -0400
Received: by mail-wm1-f68.google.com with SMTP id g135so203459wme.4
        for <kernel-janitors@vger.kernel.org>; Tue, 02 Jul 2019 02:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZbbPe/OgCkiI4UCDPbrGqbpRXXo3jc53/IKcexuq+WY=;
        b=azgcgMuiRaVzBsgq1sukrVxzQ8OQuO+/ImiTQZlIiE7yGz03+rGbwf/y+jlTa8EVf5
         U5BPvszqu9eAKAv0ehLi3h1SuJNp0vPwtFnYTKvaQ++xEClDFTHjrCEC2Yj+9hhdbWY/
         GwyYqY4lC+isc3OF9NDiW3EhrcB+/X0mWegpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZbbPe/OgCkiI4UCDPbrGqbpRXXo3jc53/IKcexuq+WY=;
        b=kQU3LOHznyzDnmwnT8U+mHrMNf1P0Bls3miQEvb9rUrS6A+R+on7us2AXhQCUmoL4w
         MAV2fRhtYRZNEizEujJt9/0TOsuBYlYTOiTVMlDcuk4oMu2XGjOLrxcXiqmmKnW/Fb8f
         PSEAEo0Y9nshQIPOC1r1brnfIvhwJnhe0Qgh9Ul9lt5r9H0ft3z1VcWASpRojJoLxs8A
         r/lTL5GWoza1TvYISjO+hJFGwOUwXWutp9OExzbYK97zTSen2QAsYFG3YtM2+nEH8w7S
         xyHcDyyT/kMS18A3NRthnu4OvZ69d7codbiIhBiYvkTVk0X2rlRtPE74NybClAl4Y5dZ
         TGzA==
X-Gm-Message-State: APjAAAWuEzTp+l6mroPdJQcTKuUhWB69woHjU/NvP2ogRrMygvzS2grf
        ASP6y/hHeA8KcCRovYUmT7eww+XX4BdddlAXfwyFOBpyJhQACElO0JbpjZYNPkMjCIrm4W88Kq8
        D13zJr7JvuNPnEVqfnc9FbLy41ZdQG68xvnGd5aXsioAq1QPj5XtTeZ/9kv9DJlt4xU6CjdYn8s
        /w2I+XoTbtn1DhnRg=
X-Google-Smtp-Source: APXvYqxfIT/N6efY+/XizNeh8qrIpeIdC2hZSqzcbMa/pkJ8u1aYFYMrVYqI5zI2V3ar9yLnF7yjWg==
X-Received: by 2002:a1c:7d4e:: with SMTP id y75mr2855969wmc.169.1562061108255;
        Tue, 02 Jul 2019 02:51:48 -0700 (PDT)
Received: from [10.176.68.244] ([192.19.248.250])
        by smtp.gmail.com with ESMTPSA id g25sm1479624wmk.39.2019.07.02.02.51.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 02:51:47 -0700 (PDT)
Subject: Re: [PATCH] brcmfmac: Replace two seq_printf() calls in
 brcmf_feat_fwcap_debugfs_read()
To:     Markus Elfring <Markus.Elfring@web.de>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, brcm80211-dev-list@cypress.com,
        brcm80211-dev-list.pdl@broadcom.com,
        Chi-Hsien Lin <chi-hsien.lin@cypress.com>,
        "David S. Miller" <davem@davemloft.net>,
        Franky Lin <franky.lin@broadcom.com>,
        Hante Meuleman <hante.meuleman@broadcom.com>,
        Kalle Valo <kvalo@codeaurora.org>,
        Pieter-Paul Giesberts <pieter-paul.giesberts@broadcom.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Wright Feng <wright.feng@cypress.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
References: <7d96085a-76e8-c290-698a-e1473d3f4be7@web.de>
From:   Arend Van Spriel <arend.vanspriel@broadcom.com>
Message-ID: <893cc567-0126-3ab9-92c5-de430fb066fc@broadcom.com>
Date:   Tue, 2 Jul 2019 11:51:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <7d96085a-76e8-c290-698a-e1473d3f4be7@web.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 7/2/2019 11:50 AM, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 2 Jul 2019 11:31:07 +0200
> 
> A line break and a single string should be put into a sequence.
> Thus use the corresponding output functions.
> 
> This issue was detected by using the Coccinelle software.

pot-ato, po-tato

> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c
> index 73aff4e4039d..ec0e80296e43 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c
> @@ -225,10 +225,10 @@ static int brcmf_feat_fwcap_debugfs_read(struct seq_file *seq, void *data)
>   	}
> 
>   	/* Usually there is a space at the end of capabilities string */
> -	seq_printf(seq, "%s", caps);
> +	seq_puts(seq, caps);
>   	/* So make sure we don't print two line breaks */
>   	if (tmp > caps && *(tmp - 1) != '\n')
> -		seq_printf(seq, "\n");
> +		seq_putc(seq, '\n');
> 
>   	return 0;
>   }
> --
> 2.22.0
> 
