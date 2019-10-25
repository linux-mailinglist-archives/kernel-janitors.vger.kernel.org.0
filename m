Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37731E4B92
	for <lists+kernel-janitors@lfdr.de>; Fri, 25 Oct 2019 14:55:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504640AbfJYMy7 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 25 Oct 2019 08:54:59 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:34129 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504636AbfJYMy7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 25 Oct 2019 08:54:59 -0400
Received: by mail-io1-f67.google.com with SMTP id q1so2306450ion.1
        for <kernel-janitors@vger.kernel.org>; Fri, 25 Oct 2019 05:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XqRZL3LD0cAYpu4i+Oz5gNumeaGbwkRBXuU0UymszRw=;
        b=FGzHDnk90eDcHEqQWBtHbS3AqS9XkVlgVqg8Fd/yZObK1UxjtNbnkzE5l1zepmuPRt
         cyes7m2M8EpWs9YBTaEhM3KTiF1PGqCHVc4Y1WdjrYQNQouiqoOWPD5QQEhHWWpgVZz/
         e856QHAOTtBAoIyYul0s8yv+7tN+FJp0X4oepfLB7PK7iDZL2UUgnbZ5tJoFy2ffytTo
         lezWPU0QbbjY0zNb46QXfJ3CReBKOH3x9+6QQL6wgMrGLESuaSMJty1UuYhYP/Pqtpn3
         O9gnBqnzoG6ynfXyoP3XcHbGsbbf6hE9kU9/tNabsHlTWiv5RxCN8icaVFOTafceI+cG
         ztSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XqRZL3LD0cAYpu4i+Oz5gNumeaGbwkRBXuU0UymszRw=;
        b=til093Rq+bNHXqG5FCANJ+0u4FDnkk96q3dyAWqSkrMwJRnX+NSyNc8CAgMHKgINJw
         KHn1bShY9juIStNTyHQ6CxxcNkaQLn0m3INeM89ZHkzWB1NzmrApWN+F0aWzLkbptb7k
         xQAcgytRtKhRHKi1DXG/nSAejZ40kUke/FnY2CRhBqibhay4dwizLylP9Uf+k3wuICk5
         L9yTGhFN9CAWniqGnrPrL4piI/YVel7jQEF31yg9aKm2n/zFslL0f0/boTpekWZmiiOC
         k7B8AnN+p6TAuPprMhM6VqmLtP+CFlwBiJWQw244W9YjV+XgMiC9CRK9kIj2qdOdt1AF
         UtTA==
X-Gm-Message-State: APjAAAW0+obuXyRyNOQD0/TeJ/vRq3y7lo5xBKXwD+rxZNIWfaGuSthZ
        wXP5mV1jMu8k1JLY3I96qScYhX2KdXh9kA==
X-Google-Smtp-Source: APXvYqyRv6QNh4wAE0Yq4PNSmeWazYkJpqCtu/Gt2kSofhSOTEiA6Gjj45It1k+vN2/LmYqGl4akaw==
X-Received: by 2002:a6b:f415:: with SMTP id i21mr3597034iog.109.1572008097263;
        Fri, 25 Oct 2019 05:54:57 -0700 (PDT)
Received: from [192.168.1.159] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id l64sm66767ilh.2.2019.10.25.05.54.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Oct 2019 05:54:56 -0700 (PDT)
Subject: Re: [PATCH][next] io-wq: fix unintentional integer overflow on left
 shift
To:     Colin King <colin.king@canonical.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        linux-fsdevel@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191025124315.21742-1-colin.king@canonical.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <fc23061e-31ec-8a66-2b62-771121d182de@kernel.dk>
Date:   Fri, 25 Oct 2019 06:54:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191025124315.21742-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 10/25/19 6:43 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Shifting the integer value 1U is evaluated with type unsigned int
> using 32-bit arithmetic and then used in an expression that expects
> a 64-bit value, so there is potentially an integer overflow. Fix this
> by using the BIT_ULL macro to perform the shift and avoid the overflow.

Good catch, that should indeed have been 1ULL. I'll fold in your
fix, thanks!

-- 
Jens Axboe

