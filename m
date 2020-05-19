Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7264F1DA55D
	for <lists+kernel-janitors@lfdr.de>; Wed, 20 May 2020 01:26:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727998AbgESXZ6 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 19 May 2020 19:25:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728301AbgESXZx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 19 May 2020 19:25:53 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D134C061A0E
        for <kernel-janitors@vger.kernel.org>; Tue, 19 May 2020 16:25:52 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id u1so879766wmn.3
        for <kernel-janitors@vger.kernel.org>; Tue, 19 May 2020 16:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qxIrWzKndId5M02rldluZtVI7y5X3L/VGh+mHmelStw=;
        b=bZZrY/6tnWofgWh1MVFkN2oZF55QFsh6vsmWfPfWynoox7tKL3JPfxFjowkszeHgPx
         1JVy3ftg9oXLAPKDUz8BulIDv4k5i2acYWPg3e/Nn68uarVz3TxdSIZkSOBrSxhw+CfS
         9ZL02L9Fb8mqZWxt5DbkYgNo5beZkAPW853nWPV53ATfqgrfSXlfwEKdjcHbTnn0uNQ2
         HklkmdipI/ikgP6Z8bD5VsxYA9ZlTlwT+37fCvqDWwXcPnYZY0LoCWHOu6SsI4OHJ4wd
         3Cw95kgQ1AeHVIGYjWGB4jsw5ccBVlGOlvfl/P27ncyY07XQ9CWRavUrQU9zdVIPGMUg
         se1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qxIrWzKndId5M02rldluZtVI7y5X3L/VGh+mHmelStw=;
        b=lMSLG9AnnyAQT4aI5gwzTbQXR9fexrI0xOBUtfwpt1jMPkWqp9Qzsky+Ddfr9tPnF6
         Y50hue876s2Y7ikR1pq1z1+UyME3ZU5Gn194K/Pg84YI7ID1p6hVNRRkg9XH/wue1BCa
         I/rp5VV8wxTYRWbWpXgUCCHvlv6qymhYT9HzSBpptPXleHvpnCyN8NuouPEPqavA8bpE
         PSTcCsgs4ti9mirUPg60ltnvjYb+yq2CehzMNssg/wtlkINS6xZfY5hHubCCW7Cf8dJT
         eJDQQWOTcfOOKudNm/18m8ZWPtaenftIVFvgEatUHojFL+k4U04geOMZeuFseFx7YYXB
         fn9g==
X-Gm-Message-State: AOAM5337UxhhsIJiDmGy0PA9E9TmWKeKY1woAnG5J7+IRqht2oweBTW3
        a9uX9M8Y823g82mPbo9pQGemZQ==
X-Google-Smtp-Source: ABdhPJwVz5iNSn8vvVkwnZdoEnwfRvCEGJGZnX/iunolwoitoPT3eaDCdu53wzgC5+x5WDnoxG6miw==
X-Received: by 2002:a1c:7d02:: with SMTP id y2mr267408wmc.92.1589930749374;
        Tue, 19 May 2020 16:25:49 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:e504:4297:986:ffb0? ([2a01:e34:ed2f:f020:e504:4297:986:ffb0])
        by smtp.googlemail.com with ESMTPSA id v19sm898944wml.43.2020.05.19.16.25.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2020 16:25:48 -0700 (PDT)
Subject: Re: [PATCH][next] clocksource/drivers/timer-ti-dm: fix spelling
 mistake "detectt" -> "detect"
To:     Colin King <colin.king@canonical.com>,
        Tony Lindgren <tony@atomide.com>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200519224428.6195-1-colin.king@canonical.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <61864ba7-e3f3-8156-d133-9baa5f9138bc@linaro.org>
Date:   Wed, 20 May 2020 01:25:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200519224428.6195-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 20/05/2020 00:44, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a pr_err message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
