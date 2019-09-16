Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FD24B366D
	for <lists+kernel-janitors@lfdr.de>; Mon, 16 Sep 2019 10:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731108AbfIPIce (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 16 Sep 2019 04:32:34 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41897 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729670AbfIPIce (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 16 Sep 2019 04:32:34 -0400
Received: by mail-wr1-f65.google.com with SMTP id h7so36864855wrw.8
        for <kernel-janitors@vger.kernel.org>; Mon, 16 Sep 2019 01:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RHbI26jBxHHVdC5MVSVSZ4FBgEGe0bhj06FcnSvvAak=;
        b=DiAf2dDQwonEc0dwP6bV3KOIvQwSWBgMxY+xlRd8eBvVwiAUqKOLEEQjyiKpg2ohac
         x37nvAHU1y5neDSKKO5JTG+KcqfqyPGr2o0TfE+fONNOoPhT7SM2V4+9wLNsFULgjcuf
         OrUtWcUSIXWbjGpe0zAIbzqvgymDA5Af6lQUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RHbI26jBxHHVdC5MVSVSZ4FBgEGe0bhj06FcnSvvAak=;
        b=SaQCgog481SmWrfcP6uZVHcKtXh16tHU1rdB/6J+NHDB2nYoF0gd6vfzdxWPJwdSoR
         QTBsm/wwp52Q++4o2mh8sR0xUf2pgJ2eb1Jn77M3czLO0Kf4ueMY8zu75GCEWnxDXUss
         WtnJPSf9pAdIyqLRIxJYnrM8Bsr2miLgEoS6x7YP3p/A9jOTmM4uwAl8+N1c8CgZ0hBa
         KYjbvmdyyVLioeyxww/ESb1QEfLUjF3zL0qzrKceLE0cp+2O1rMpJtAqD9HZddogB7Yd
         PzbfYjV1jm88Tou1nClgM/PUpHGWkU8bK6mR7V9JAiEbQ1gIMimsXGvx64Pvo5YSC6Cm
         LiVg==
X-Gm-Message-State: APjAAAXit6o1+OiajBhs0bPdL36rO1RPM+PqLgtAkKzCERjYIo1wp0aa
        5bIlJr+BDoXaDuluP25IIkWUwac4sQnSOxH2GqRpjlnaV6XYZ1bFGLsrxkRKJ09m6Hpmp5c1C9V
        C7XlebHebbJtTQtVIiqlHTZj9uUjUQSEISp6mV1ra8dco5oyIaqMYFroDdPSSmC6SrgaAwSfHEV
        Bo2YhCBQt63Q3hiYY9og==
X-Google-Smtp-Source: APXvYqyOWlPI+iH9ldqpYF5ndSWi7LO+9MgPecatfMrBWupl0SNLuoK1KYn5zuPQVCDI7otOAL0m+w==
X-Received: by 2002:adf:ff8a:: with SMTP id j10mr51465080wrr.334.1568622750499;
        Mon, 16 Sep 2019 01:32:30 -0700 (PDT)
Received: from [10.176.68.244] ([192.19.248.250])
        by smtp.gmail.com with ESMTPSA id a205sm23587277wmd.44.2019.09.16.01.32.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Sep 2019 01:32:29 -0700 (PDT)
Subject: Re: [PATCH] brcmsmac: remove a useless test
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        franky.lin@broadcom.com, hante.meuleman@broadcom.com,
        chi-hsien.lin@cypress.com, wright.feng@cypress.com,
        kvalo@codeaurora.org, davem@davemloft.net
Cc:     linux-wireless@vger.kernel.org,
        brcm80211-dev-list.pdl@broadcom.com,
        brcm80211-dev-list@cypress.com, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20190915193210.27357-1-christophe.jaillet@wanadoo.fr>
From:   Arend Van Spriel <arend.vanspriel@broadcom.com>
Message-ID: <fc7f0338-c1f6-0659-3767-57c09b45fbbb@broadcom.com>
Date:   Mon, 16 Sep 2019 10:32:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190915193210.27357-1-christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 9/15/2019 9:32 PM, Christophe JAILLET wrote:
> 'pih' is known to be non-NULL at this point, so the test can be removed.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
