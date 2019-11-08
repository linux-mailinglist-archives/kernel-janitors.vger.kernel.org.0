Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB9AF4E13
	for <lists+kernel-janitors@lfdr.de>; Fri,  8 Nov 2019 15:27:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbfKHO1A (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 8 Nov 2019 09:27:00 -0500
Received: from mail-io1-f43.google.com ([209.85.166.43]:40124 "EHLO
        mail-io1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbfKHO1A (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 8 Nov 2019 09:27:00 -0500
Received: by mail-io1-f43.google.com with SMTP id p6so6528360iod.7
        for <kernel-janitors@vger.kernel.org>; Fri, 08 Nov 2019 06:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=U+gZ1iZyMycMyu4RO24BAjLSYNHz9sOObk4L5rAMf7c=;
        b=iqwILVQYZSgmH9OUII6SqeT4Drvw0j1zpDG2nt3rLVuYNmHI7uc2IUg7rI+JESGb7J
         VPdhKPgxjTYrje0kLVpESYLZeMPp32BZE9qQW3kRPV4A2Ov04mesqZ7YGidApVohuRQ/
         s1C0A+EmO3dMNP+YvKu0SHgwE9+YqcymXT1jRkDqwT8LaDVCEAmgQOau+ojwU/TOJyYv
         FbZ94VSTvKvxoN68eEF3O3bSY5UvDEhKkshv3g7CDh9e3NkSC6+y92JYNZfCRTv7UEh5
         OXRNey3HvzswzpyTOhU3rakgDLkDbiXKQQS/kgpE9zIr1d955aRiaB8CIeiks5cn7mXa
         +j+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=U+gZ1iZyMycMyu4RO24BAjLSYNHz9sOObk4L5rAMf7c=;
        b=VuBRVlpAUSaF3vycVHM1W2wZLeP7vxuwyYPYLu8Z8sFc9OpfaryjJvXqKVcFX8UPfK
         ItFJHAOE/6Cy9JEUKw+QOiO6tKvwpRs/SvaH5O0D5+15MULjCspNUHxzSh20DMq6ty5Q
         27952H6QKyfpToYE5L9mwZfpEtIGI9EZ74aYGfFBOaQqZWoagBkLZ2AQB6qFfGxLaWPY
         46e87WnhwmwAhmdJk9dfONsfHyZ13i2tUbinO5cpYQU4zneYsrRnobK8ZCKun3cB/fEP
         WGlRWujZZSF8l28k2TvLYEdp5DhmaBcC5xYvr9CcvrecH0DUlb0Hlk8jhFAmU7vosWkY
         8rlg==
X-Gm-Message-State: APjAAAVmc7srFxDAxTu9/ReMtAbdHLqmmk2FIk+caDAoh4wUd/z5b7jn
        XKgKtr5U13EZYTT8GvrIN/cP3w==
X-Google-Smtp-Source: APXvYqzwYZ+WipkYapK99X3KqatJkMZI+Jw2MzH942P7q0uMgKJc79YO5XDMV6HvnRPVP9zk3ee6lA==
X-Received: by 2002:a6b:f914:: with SMTP id j20mr11044257iog.223.1573223219271;
        Fri, 08 Nov 2019 06:26:59 -0800 (PST)
Received: from [192.168.1.159] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id u9sm452653ior.46.2019.11.08.06.26.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Nov 2019 06:26:58 -0800 (PST)
Subject: Re: [PATCH][V2] ata: pata_artop: make arrays static const, makes
 object smaller
To:     Colin King <colin.king@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-ide@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191006142956.23360-1-colin.king@canonical.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <5dae76cc-e71d-d295-7947-b7005a7f1af3@kernel.dk>
Date:   Fri, 8 Nov 2019 07:26:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191006142956.23360-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 10/6/19 8:29 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the const arrays on the stack but instead make them
> static. Makes the object code smaller by 292 bytes.
> 
> Before:
>     text	   data	    bss	    dec	    hex	filename
>     6988	   3132	    128	  10248	   2808	drivers/ata/pata_artop.o
> 
> After:
>     text	   data	    bss	    dec	    hex	filename
>     6536	   3292	    128	   9956	   26e4	drivers/ata/pata_artop.o
> 
> (gcc version 9.2.1, amd64)

Applied, thanks.

-- 
Jens Axboe

