Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73B95F510D
	for <lists+kernel-janitors@lfdr.de>; Fri,  8 Nov 2019 17:27:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727178AbfKHQ1u (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 8 Nov 2019 11:27:50 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:37659 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbfKHQ1u (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 8 Nov 2019 11:27:50 -0500
Received: by mail-io1-f67.google.com with SMTP id 1so6994548iou.4
        for <kernel-janitors@vger.kernel.org>; Fri, 08 Nov 2019 08:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RiIe/nW+9AsCJyMreIOc9BvirXBLZtzkTWUj49kdOWI=;
        b=yiW23nuA8TdhuuIrPqsnDodwAfZlz7kLEuj1pDzBF778A3B5Pri8hlJ+VYcC16b6z7
         0hfXRCpRdcfNrWPLjHrAaxZ2qEDn8qMMaIvQ/5fOfR48fHI2qUnwlD0zX1ctDcmo30Kg
         bFz8oQrg3pL89wBAb0enYPVHRJ/klENw/8POBBLGoFPn2sv8ZPfTTlwg685l8ZGN2XLt
         WaHIJJmzPx/q5QKVcZSFYQd0fRgY03/ZuEZ6c+/Ev3Ks7ELhbvgbFeNrMjrlmBN7AEKu
         NIz3ipy6kdnoXPn3akIMnGDjNXhlht2ZIIEK7C34P/dKZafL+iwwLw5OaL0En/vaR7Xw
         xqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RiIe/nW+9AsCJyMreIOc9BvirXBLZtzkTWUj49kdOWI=;
        b=reYFXmZc1X2yt3Z/qj/uCR1UA42R4RtIM5gz0vWBQh3/3g6MMUv1mGMBxuOF7cnXLu
         BA4/8DtdEpqH1L9A7QfPkmV1EHBDSc6CDMPu3r7C/aRO4LtF1HaAROIaOfut59A9I0OI
         duC7nkuWIC8uz0r2FQNECWLD3EfyRBVvZHtm8hpOYiBr14bSkGuK6HkjP7/fATbGGYxk
         dFF2s8+FJp5vpJnIOr6Gpp0keKT5KuZD3nb8/tctGoUHg92Sx/fw+SA2F/97M7zWejMP
         TvSFpT2P59ALfaYa5ox76PTwFCWmxFbWllD19k5Rciqnvwv2EADMbksUFCcX2NAd+K46
         mbMg==
X-Gm-Message-State: APjAAAW2STXqVwEzmMdIdn4+hLeU4PJtjlwFY13lPEdEGg/6hIjNYpMY
        OF76fCSQoQ7eT0tN5Wi4tDJwdfDNch0=
X-Google-Smtp-Source: APXvYqzFoIhq86iW74zmJxBejj+zma0nFYlI3I/P9W/xmwZlaX3LhI2wzB6oG6o03ZgY2UPVKy6hIw==
X-Received: by 2002:a02:9f12:: with SMTP id z18mr12194050jal.10.1573230468826;
        Fri, 08 Nov 2019 08:27:48 -0800 (PST)
Received: from [192.168.1.159] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id u21sm827186ila.41.2019.11.08.08.27.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Nov 2019 08:27:47 -0800 (PST)
Subject: Re: [PATCH] block: drbd: remove a stay unlock in
 __drbd_send_protocol()
To:     Bart Van Assche <bvanassche@acm.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Philipp Reisner <philipp.reisner@linbit.com>
Cc:     Lars Ellenberg <lars.ellenberg@linbit.com>,
        drbd-dev@tron.linbit.com, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20191107074847.GA11695@mwanda>
 <3a2d491f-3d24-3673-07f3-f601d5fafc97@acm.org>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <26822f67-1cd7-eeda-2caa-2bc7d420f173@kernel.dk>
Date:   Fri, 8 Nov 2019 09:27:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3a2d491f-3d24-3673-07f3-f601d5fafc97@acm.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 11/8/19 9:26 AM, Bart Van Assche wrote:
> On 11/6/19 11:48 PM, Dan Carpenter wrote:
>> There are two callers of this function and they both unlock the mutex so
>> this ends up being a double unlock.
> 
> Is there a typo in the patch subject (stay -> stray)?

I fixed that up while applying, fwiw.

-- 
Jens Axboe

