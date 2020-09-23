Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60821275B6D
	for <lists+kernel-janitors@lfdr.de>; Wed, 23 Sep 2020 17:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbgIWPSa (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 23 Sep 2020 11:18:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726504AbgIWPSa (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 23 Sep 2020 11:18:30 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C5D6C0613CE
        for <kernel-janitors@vger.kernel.org>; Wed, 23 Sep 2020 08:18:30 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id k133so9824331pgc.7
        for <kernel-janitors@vger.kernel.org>; Wed, 23 Sep 2020 08:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nsm/SLpnI1gdm4X4OKozNS3TNzCBnlqB2Om83wtrvTM=;
        b=UwYPfCHCkuZSpIeCGStKHAWyo1CDDFErhXwN/nKs+DtOMuKzWm3Ru4fAVyK2uJC8qt
         c1kchVce3LxG5k62yYPWGhxExhYubU1CmUlYTQs+vNFL99vt1MJw8R6n85S3UwyCvQxm
         GohP7WvEJNxqNh7ABOo7NUNhVLiVdZIWF6rVjgqQRQSZAlj9IrtU5El4ZrugnG+jnJNS
         VSKqmHHY2rgXz4kgHYPDhS9Es4HiK1Icm9gmTPraFvc18zLU6JNSPy5h7SSON2ToEhBj
         rXI/A07vNJ4Fe0k24pgT3/8KclQsNFK1HEPN24YeSopnBbytHL3kp3YFTw7dulvBdWSN
         SBYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nsm/SLpnI1gdm4X4OKozNS3TNzCBnlqB2Om83wtrvTM=;
        b=jOTz4u0q7EmgQGUmjHllI3TArnWN/vlHDc2lPP/6B7hWlfrpi8tzorVbuixd2tJR6w
         BpXYa+sbNaBSG4k5wdM/5Bhaj8L90z2UJGCodYxYsN4OXjCXWhi2aAav+21YrB8sW04H
         gv6jS2uhpdTaK3ofx8aUdlLNQ76qy4zFrqicnWwR/AQL5Lahx2F7gGVDgEgZX0GyPMBz
         b8ZMrbG3z39/VI8d/61Xit90xEJFyykjzjm9GnK1joF+ip0/O+rQYTRK6KsB8JRqsd9T
         OQzHYKuhikuFmjmSfm7P0CjbEpbvqCXyXhRmZEvAyOHnnZ2bIbMJBEVowFMkb6BM/z1j
         zOvQ==
X-Gm-Message-State: AOAM530eYnnXHM0VQICPKhRhcXEkO425X67LKNv9/vdUZo/UOcLp9w8D
        8cgfLCjdUmGQn6a9MF7Xnm9n2g==
X-Google-Smtp-Source: ABdhPJzJ/ejg9GYFqB77f/Yk8KzNOg6TdYV6IGyGBQKLmXK/daOda5tYkOU0zVvC/ZDIxC6p+dcLzA==
X-Received: by 2002:a63:580c:: with SMTP id m12mr188720pgb.99.1600874309643;
        Wed, 23 Sep 2020 08:18:29 -0700 (PDT)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id 22sm288302pgh.18.2020.09.23.08.18.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2020 08:18:29 -0700 (PDT)
Subject: Re: [PATCH 06/14] block: drop double zeroing
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     kernel-janitors@vger.kernel.org, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1600601186-7420-1-git-send-email-Julia.Lawall@inria.fr>
 <1600601186-7420-7-git-send-email-Julia.Lawall@inria.fr>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <b71efcfb-4ffd-d125-0ef7-ed5ab6b03892@kernel.dk>
Date:   Wed, 23 Sep 2020 09:18:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1600601186-7420-7-git-send-email-Julia.Lawall@inria.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 9/20/20 5:26 AM, Julia Lawall wrote:
> sg_init_table zeroes its first argument, so the allocation of that argument
> doesn't have to.
> 
> the semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression x;
> @@
> 
> x =
> - kzalloc
> + kmalloc
>  (...)
> ...
> sg_init_table(x,...)
> // </smpl>

Applied for 5.10, thanks.

-- 
Jens Axboe

