Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B0D81739CD
	for <lists+kernel-janitors@lfdr.de>; Fri, 28 Feb 2020 15:26:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726838AbgB1O0C (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 28 Feb 2020 09:26:02 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:33457 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726738AbgB1O0C (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 28 Feb 2020 09:26:02 -0500
Received: by mail-io1-f68.google.com with SMTP id z8so3627901ioh.0
        for <kernel-janitors@vger.kernel.org>; Fri, 28 Feb 2020 06:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=l2WSH1oXYkiW7xPeB9rbvaZ7jIhKj/eFuTA0GXjb3nI=;
        b=M1HRRYsjitsovSHd+P8PpfeR+tB7pQ8p28KRekHwDSsesQsLWia+lN/ff0TlL2HhNJ
         guKkSAJ8Fbgw0+0xAyUmk7FpYymv+AUPYRY/EEnXHDe4/8NVLdBqxaliddYUipK7/2jb
         R8HRcBz/tjDekvYbhDcI93M8EhUE1tMl3PBECsYsuuQHR3V5M5/zHxlz9Ug7nMqE2y1i
         5OOOsA83JIex7/VKCzkv8iHmChHxlHgy6K+h4+nF049kCDaUvgkVLJD0JXKS4NZJ3g0H
         P8cSjAS4NEMRtvhnJE/os3l7Y26faBB2IsvSt+w3ajCydUYCI6dKD8148Bfd+0fGYYOL
         VZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=l2WSH1oXYkiW7xPeB9rbvaZ7jIhKj/eFuTA0GXjb3nI=;
        b=qL6YTnAP/UjRz4xhmSuz7uhBnHSC4cNXoaDtXRCDERna25SotfZQfPuVJYdIPJJ9gI
         HO3ZpRZePgK1AL/6yGKEbvJXjkQ//iuUqRmXoVy+Bng8H4KP46BANpmSloWR2lH4e5tE
         tJHnoWXZONElJq2nC/GfNPJU8R6OQV68g823j2RCxdJy9OTP3XzMyXGJJ3V9o+l5MMY2
         RC+5zDTH2GQ/vfxwMSzCmi2gVEzAuzDPWiX7RcahG6pBNf/lgzScoikDb/JrrN+NXdgV
         B3Q1V71uHXAaO54dB6qSaGjkrB8/tdn8sapTnr0iHaGaHeVkJ1KEpBjzNdGKymqWXbBN
         Rk5A==
X-Gm-Message-State: APjAAAVaTF+JoP90VU17rt2c+brTVD/EEIs+ekbVDuYu+C2Jng9u8QBd
        AXNTOIgupVs0eTJIqe9fedWVlnOsFnY=
X-Google-Smtp-Source: APXvYqxpxYDUhqIs9YgHwUj4LkegpankEQOinBeCy7wnRJkpbKzyp+VOO0iRN2sv9gT0k08Wnjg2DQ==
X-Received: by 2002:a02:cd82:: with SMTP id l2mr3460112jap.103.1582899959967;
        Fri, 28 Feb 2020 06:25:59 -0800 (PST)
Received: from [192.168.1.159] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id u15sm1249914iog.15.2020.02.28.06.25.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2020 06:25:59 -0800 (PST)
Subject: Re: [PATCH] loop: Fix IS_ERR() vs NULL bugs in loop_prepare_queue()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Dan Schatzberg <schatzberg.dan@gmail.com>
Cc:     linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20200228141350.iaviwnry3z4ipjqe@kili.mountain>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <c106c6ec-7171-3586-d5c5-5c14e386b3d5@kernel.dk>
Date:   Fri, 28 Feb 2020 07:25:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200228141350.iaviwnry3z4ipjqe@kili.mountain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2/28/20 7:13 AM, Dan Carpenter wrote:
> The alloc_workqueue() function returns NULL on error, it never returns
> error pointers.
> 
> Fixes: 29dab2122492 ("loop: use worker per cgroup instead of kworker")

I can't seem to find this commit?

-- 
Jens Axboe

