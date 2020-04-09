Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 073921A3636
	for <lists+kernel-janitors@lfdr.de>; Thu,  9 Apr 2020 16:48:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727865AbgDIOsF (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 9 Apr 2020 10:48:05 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41377 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726977AbgDIOsF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 9 Apr 2020 10:48:05 -0400
Received: by mail-wr1-f67.google.com with SMTP id h9so12235207wrc.8
        for <kernel-janitors@vger.kernel.org>; Thu, 09 Apr 2020 07:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HYmlK0W0gB1RNgMfwFCbFrXo9v4YOOiFd6qMt5ytL4Y=;
        b=T8mPr/gRVyyDK3eA20QB/OWR11cvu1aKOQGFpAGtT7qvjvjd3kRBGP+N3F/uPwc1JO
         YiXlAWc8X1tUVkM14LyQepIvSrI/giiZN1pvDw3dcd2RJ39x5q4cRwNCQ2kE87cIVmD1
         hW5IYGk5/dVBK4gXZ9vUtLSwOVyeJS6Rl4ptgfO5odfSpQCSzAZs1H1Bok4HMIHxncao
         C/R3d7sf4TbUgvtMzdIFcOW0kEtlohr60MMaxEy/BmvF5Z2KDfodOJLbya+M5b8Nqnwy
         bREop1HN9f0vHUly9ta9NjU9oQ2uTAaH5Q+fQgcIalYD3aPovNKS9t9Euj/6ZJK38vCW
         vmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HYmlK0W0gB1RNgMfwFCbFrXo9v4YOOiFd6qMt5ytL4Y=;
        b=fGFtQqZqYd8r0pP1+2rQQQkUttcmmccYtTutICDIrHOK0w7AKkgPU1lEEoKgdwSTER
         1C/LeZUJa4AlmwtKZFi0atThUy7Ulave6+rw7jSJBm8fYmHhDJD1e4EN1NfXYGQXCfRk
         wWKp7KIJuyzFHR8j2/NVqhyMIPQERcI3HMAl5Lr/thstzRPxs6wsBPyzSUZhKEkZWXuT
         LpnekzIPFoCXkhYn3oLfsfStRtT0bEtdPQjGehzgYs4O9ad2MIaDTEUXMT9eRkcUdjG7
         32WQNEPCr8nyeB9OlZ3k9G2vqMrTfG7lQXhA9XBTGgA8DTQ9Px86mt0saiimAAv47Plp
         UnrA==
X-Gm-Message-State: AGi0PuZpxsiziSI2q2+wsuSURTH13KMAee8ti/0CvnJMesYVPfGCqupz
        jBAif+zsa/cPHBlqix921G2NmSifnnk=
X-Google-Smtp-Source: APiQypJmJuYQlk8+ou0FMKHdNWId62VqEgmm0EGHTfau2iXTN5VxEVLxkXuova3ZZbnKrt83shczJw==
X-Received: by 2002:a5d:4f08:: with SMTP id c8mr15115888wru.27.1586443682154;
        Thu, 09 Apr 2020 07:48:02 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:4e:2ab3:ef46:7bda? ([2a01:e34:ed2f:f020:4e:2ab3:ef46:7bda])
        by smtp.googlemail.com with ESMTPSA id q9sm22696791wrp.61.2020.04.09.07.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2020 07:48:01 -0700 (PDT)
Subject: Re: [PATCH] clocksource: davinci: axe a pointless __GFP_NOFAIL
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        tglx@linutronix.de
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20200409101226.15432-1-christophe.jaillet@wanadoo.fr>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <e1ea1f7b-d5f6-d6bf-52da-32f2d3de7793@linaro.org>
Date:   Thu, 9 Apr 2020 16:48:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200409101226.15432-1-christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 09/04/2020 12:12, Christophe JAILLET wrote:
> There is no need to specify __GFP_NOFAIL when allocating memory here, so
> axe it.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Applied, thanks
-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
