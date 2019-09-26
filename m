Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7364BEF1A
	for <lists+kernel-janitors@lfdr.de>; Thu, 26 Sep 2019 11:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbfIZJ4e (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 26 Sep 2019 05:56:34 -0400
Received: from mail-wr1-f44.google.com ([209.85.221.44]:37463 "EHLO
        mail-wr1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbfIZJ4d (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 26 Sep 2019 05:56:33 -0400
Received: by mail-wr1-f44.google.com with SMTP id i1so1986644wro.4
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Sep 2019 02:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NlkCdkYLYBl+V4BvoMR13p0f1FLvtBmZG+HZB0KZ5U8=;
        b=pr38dFChJ7xwA2a6C9o4qVwmjfhPb1k812KgLstdGSVS9FFPygT7/MfveuO33kz9Hz
         1fzNLsyzPXlda0tm4Bnrd1IXFLsLQSCnZIxOaEdzYSUlR79hiXTol9kvnPwNoGRE3uzV
         TGDmcp6hQbgRqX/5LpuuasGLu6H4HvnczCHkdGszujGo333A4wxgWCawqm9fcX6TlXcx
         5BIUCVB2TVUYMridf4NU46JgU8ZXTnoZ6VX7hGX1GdMKa+djmP+2rawMzpNWCVTr3n2L
         C5G+ET1FbcNCmH8AJVZyiB1BEgVOwaUwrM7rkPIORgnmJr9GyTIiABrQ8AAr79re6/oI
         bssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NlkCdkYLYBl+V4BvoMR13p0f1FLvtBmZG+HZB0KZ5U8=;
        b=jGbR/Dhg2jsdfD1SpQlIfg8hNtHlyDS2u0dyebiKBswNOzjrCi0ZEmi1qejtPBBBgN
         VUNIRrEuXKrkCSkAz6TKXVF/nl/SOvjAnKbIOov9qXLaiK3Slq32nxov+9wZia/QJiXY
         wjTYf/8UCps/CP0ambnldJMWeEAd6D3Ll8wY9uqhTmEBT5BP2OBUlAYdPN8EIMooyWrs
         AqGr6w/EnngOFUqivx1L3jmgMLgjbMCgEES2IRAEAaPVAwiiYGU5NlpKPaEGsmR0qeVK
         mO9BPQifn4nc+cPpoM3D1CdiDYDT8zIkHlxhSPV7MqfJU9f2mysmkjheim8YaLJBa1Gh
         b/5g==
X-Gm-Message-State: APjAAAXKfUAqtmix9SoQKEsebSwKUU1mg+N1keK+Kb6L5Qy1OWcmRjNZ
        V35xh8s/3fYXi3G9EVPbLqGCTg==
X-Google-Smtp-Source: APXvYqzVa3ZvYbsWCQUozmOJ+3w5ZbZpyvYMC9oEdXrxIBNKEFzLtY0AvOnHWQcLiFYhQZX+3BIu/A==
X-Received: by 2002:a5d:4251:: with SMTP id s17mr2336613wrr.126.1569491791600;
        Thu, 26 Sep 2019 02:56:31 -0700 (PDT)
Received: from [192.168.1.145] ([65.39.69.237])
        by smtp.gmail.com with ESMTPSA id z12sm2645832wmf.27.2019.09.26.02.56.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 02:56:30 -0700 (PDT)
Subject: Re: [PATCH][next] io_uring: ensure variable ret is initialized to
 zero
To:     Colin King <colin.king@canonical.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190926095012.31826-1-colin.king@canonical.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <3aa821ea-3041-fb56-2458-ec643963c511@kernel.dk>
Date:   Thu, 26 Sep 2019 11:56:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190926095012.31826-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 9/26/19 11:50 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> In the case where sig is NULL the error variable ret is not initialized
> and may contain a garbage value on the final checks to see if ret is
> -ERESTARTSYS.  Best to initialize ret to zero before the do loop to
> ensure the ret does not accidentially contain -ERESTARTSYS before the
> loop.

Oops, weird it didn't complain. I've folded in this fix, as that commit
isn't upstream yet. Thanks!

-- 
Jens Axboe

