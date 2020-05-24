Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1828A1E00A8
	for <lists+kernel-janitors@lfdr.de>; Sun, 24 May 2020 18:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729362AbgEXQoU (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 24 May 2020 12:44:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727899AbgEXQoT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 24 May 2020 12:44:19 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C24EEC05BD43
        for <kernel-janitors@vger.kernel.org>; Sun, 24 May 2020 09:44:19 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 124so1471184pgi.9
        for <kernel-janitors@vger.kernel.org>; Sun, 24 May 2020 09:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=P07jNVug+guoc45rIbpWbEU3M5+cKVFLecgNbhSQG+k=;
        b=io57zyljez92lXPJk3vdqKPgqSMKidnBUnshqQzXWVfdMLSnMN4ncxj5FXVt38mRUS
         78sjGtVI8BVkd93ywJu272PQWMrNhkc8rN7wc3MIk8PalcnlNWx/NIhIr1rYeX6Uyshu
         apemMmrd8sIH7VeQx/SADuIFUiM1geZA5kKCRecz+3YDYXd5BGUHU21MSTPzEdRt93eD
         OYIW4Db9mt2vmF3VD6ZAcusf6gLJtfx95KbvzrUz1s2Kv2XmIcsS6UrloIitadfK9E0I
         6aXGZ8qYz6bRhZOE3r9+Wm4DqXPmhbQbYrasNG8EQtXNknrybL1VJhZyEy353QCTiDFw
         JSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=P07jNVug+guoc45rIbpWbEU3M5+cKVFLecgNbhSQG+k=;
        b=noXedwxyBAvt3qREcmyeiT4BemCxH/LpecmrgEkdJTGPpzL64LU8C/iPjoaxvfyAoD
         gAEWj5J1ybVMcq8yq49IBBl9e7iYC7HkRBWK6b922RPJw0qqorXiQ4h2zgwjI1mNOiwP
         fF7L48utDPofgBNSqKA1/MddkIZQKatwUbfv6fCIKu7uD32g1pbnm36wJvYpbHLzvns7
         QqMyYb4cYnUSHsbxhv7Jbdr0VW9hMMojORUCa0LBRTW5KnLdzZmrYfo4+yOgpBtSQzy6
         94c3YSx5Nw9xwOQXcO7P+WhMGzJ4CY5vtWwvzOJ5nZGuNlyld061z+71YLLG/1viFjBy
         q6JQ==
X-Gm-Message-State: AOAM532728EdO4v6ZLfdPdQTypHv1pkmd6dKDseAGFobDTCDMNFcypmB
        WmmKDFPfqfdZe/1N6vE2fOGfSFU2MtdsDw==
X-Google-Smtp-Source: ABdhPJx0YpgjyeRPkAeGqtyKmO+YkPOhyf7xDYJjjrxeEpAVaraZ68Yj2I56dIVK9WlV+GF4gdFOQg==
X-Received: by 2002:a65:4c8a:: with SMTP id m10mr5165221pgt.138.1590338659249;
        Sun, 24 May 2020 09:44:19 -0700 (PDT)
Received: from ?IPv6:2605:e000:100e:8c61:8568:4ec4:ebd3:32d1? ([2605:e000:100e:8c61:8568:4ec4:ebd3:32d1])
        by smtp.gmail.com with ESMTPSA id j186sm10832729pfb.220.2020.05.24.09.44.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2020 09:44:18 -0700 (PDT)
Subject: Re: [PATCH][next] loop: remove redundant assignment to variable error
To:     Colin King <colin.king@canonical.com>, linux-block@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200524161043.20292-1-colin.king@canonical.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <9042a7ea-2d2b-9cb9-226b-266c35036701@kernel.dk>
Date:   Sun, 24 May 2020 10:44:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200524161043.20292-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 5/24/20 10:10 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable error is being assigned a value that is never
> read so the assignment is redundant and can be removed.

Plus, by definition, we already know that error is zero at the
time of assignment.

-- 
Jens Axboe

