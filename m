Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A0FA1F6AB3
	for <lists+kernel-janitors@lfdr.de>; Thu, 11 Jun 2020 17:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728470AbgFKPQG (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 11 Jun 2020 11:16:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728455AbgFKPQF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 11 Jun 2020 11:16:05 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99AC4C08C5C2
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Jun 2020 08:16:05 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id x22so2812464pfn.3
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Jun 2020 08:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TkYB8W4nXJPMmHfuB6tFy5NdErLfDGBuYJ9xHGiV3Nw=;
        b=IxsUmGCg9xCXJcVSJEYQFLPgY7kLMYX6eJTZ1z72m7zhsWvBgGBTX1x9lqgj6B5tOT
         0JV1l9UwolLKFpZ+dc0h9IG52uKi/3HwzBecVu2ISiciuwjDkNwQDqxJ8pSRleEOLs16
         VFbz2jwDyq0e1XWubhCpl43Z+a4oN/kGns7Rb0CMTTTxdcKH3VMMDqHtWsUZ/WwwRmsN
         lFfH5s/ClyskThKq1PGT/qcruHKyTDqkC9SRfwVzNQteR5/qd0Rg2SeXhNdTG5CzIq18
         SUi/kGzp0xGjNTBmuYLJg83r7DJqjaqz0MOtt4HqyIiLBHzjA3zqWE063MibbNxbdrbC
         OdmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TkYB8W4nXJPMmHfuB6tFy5NdErLfDGBuYJ9xHGiV3Nw=;
        b=BDvtZxXcwfoqlBwkneJw6hlA2CYHBL2P/QIQRDQx4q5x0UxuDquSexUjzSCztSfzaw
         iuwjoTvGINa1FJ51rh5EytpF6cc8zhreY6ECr7tHyuATuw1fwjz8WPhACC5VwK9uDqfO
         Y3WUoMOpZ6WaYOnseawlVBWWjOLNIrTjn3izAqWPc2T5RT7BLZ9Yo1AZaAtEMWeTckCF
         DkFNzpWvdE+VsxLZtatoFTVF5PiS14eqeWEMy4+j4q4GW9jXUEfYaXa+zjq7YYYc+cJv
         8g4mrjoe3NYW/dJ8jioUaNX/nvOc+gQhOi0dcRNMJp5e1sUg3ibDQOOBxvTGyLaxXSZF
         KYeA==
X-Gm-Message-State: AOAM532HeuW3345fWwZuaR2VunSf3BZZWtiZikptESyIt5dccvbW4ZEE
        ruZU/k+DBmb3p0Ia4qGE6C75T85BtyxH7A==
X-Google-Smtp-Source: ABdhPJyBU4PaWFmugtp0SghM7ORFmRKLbhu67wIySCFY+UnIRRr2o7E5ktqM4TOai7STPK8vvP0Ytg==
X-Received: by 2002:a62:834c:: with SMTP id h73mr737262pfe.221.1591888565047;
        Thu, 11 Jun 2020 08:16:05 -0700 (PDT)
Received: from [192.168.1.188] ([66.219.217.173])
        by smtp.gmail.com with ESMTPSA id u5sm2975735pjv.54.2020.06.11.08.16.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2020 08:16:04 -0700 (PDT)
Subject: Re: [PATCH] pktcdvd: remove redundant initialization of variable ret
To:     Colin King <colin.king@canonical.com>, linux-block@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200611143014.925317-1-colin.king@canonical.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <70a77fb7-ccfa-2843-c30b-beb5ba493856@kernel.dk>
Date:   Thu, 11 Jun 2020 09:16:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200611143014.925317-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 6/11/20 8:30 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ret is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.

Applied, thanks.

-- 
Jens Axboe

