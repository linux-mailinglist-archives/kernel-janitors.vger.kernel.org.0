Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90618253004
	for <lists+kernel-janitors@lfdr.de>; Wed, 26 Aug 2020 15:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730174AbgHZNdp (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 26 Aug 2020 09:33:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730239AbgHZN3q (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 26 Aug 2020 09:29:46 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE447C061574
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Aug 2020 06:29:45 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id g14so2119955iom.0
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Aug 2020 06:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KWDRtfDgOmjmVc54FsnEiVUILusjEvmBBK9m1LuosGE=;
        b=C81DA6k6wvDiW6w5quzdFAwrF1V0JA/I/jNzibknzyF2y/nipAIBai1lhKDX4pFbpK
         IpdhPaX8b+eZKf1SSW/jKumV7MmL+GO5p+qXZK0ZyCPULi3gZVa7JrtLkiCTmI0/hxyf
         x/dxBMvUM87vTYQbW1qO25yp3OkVMTEkoqwB3lB+FQHRSkAzZRhvvHgpycwHHph53dBD
         Zbvlq61l6SYQWG9ck7GLYIVG4rDG8C3+RocGqVO7r/Pd5MSUmESMeNKY3ajYrphdGpnO
         tWIf9J1FWtlTY9SY7RR0trZXf1NF5bncrruslMYsh1HKdB63orhDgcpn6i7wKhejmUPA
         0Lhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KWDRtfDgOmjmVc54FsnEiVUILusjEvmBBK9m1LuosGE=;
        b=fgpamqS6ADL51WOWBvHfxoKrUUXN9Qe6C0NwWkgU0t0RvBTIsHoIbqRLtnQfT4u76y
         o0lgnm7wf+r3fqsBSAtKqzttHT6ih0dNzYi6fjX/L/wqKC5RNB5+viYnTPz2yuGnkETB
         tl1AqIRy20aMmOuyqB1FY4H5r3yQrp4mvV0OEtWwmNwRBXcHIUs9Am1U4cThRQOpcRZ6
         zWjtEi2BDtmmoH8+q24tEYmJO4BcQNGisNMV20V7DsuLNSEIuIIjWVE0wSvT7JmWPyrf
         +05qWiq4MYHscbNOyyXvUUpm6Gq+MFMC3NybHyx2+T5ntQPj99SJh1SpgmVGZFidqXzz
         77Yg==
X-Gm-Message-State: AOAM533tncicOdD1r/drZogtrznTRc047T4v0xZmcJHlbpyKJH8jgnnO
        gpspWsN7FWpHkh5yL2obxDIQjiwDHb+269Kw
X-Google-Smtp-Source: ABdhPJxsUaliUkHsd4TBHflAs63JPsL27kYy11Yz5vbcV8DQ0IqO42oCh2rpo1cPfC0kI03MlK6chw==
X-Received: by 2002:a02:9149:: with SMTP id b9mr14778841jag.50.1598448584770;
        Wed, 26 Aug 2020 06:29:44 -0700 (PDT)
Received: from [192.168.1.58] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id d19sm471491iod.38.2020.08.26.06.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2020 06:29:44 -0700 (PDT)
Subject: Re: [PATCH] rnbd: Fix an error code in process_rdma()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Danil Kipnis <danil.kipnis@cloud.ionos.com>
Cc:     Jack Wang <jinpu.wang@cloud.ionos.com>,
        Guoqing Jiang <guoqing.jiang@cloud.ionos.com>,
        linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20200826113242.GC393664@mwanda>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <172d1b3a-58e6-1a50-2b6a-1e797135d5af@kernel.dk>
Date:   Wed, 26 Aug 2020 07:29:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200826113242.GC393664@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 8/26/20 5:32 AM, Dan Carpenter wrote:
> The error code is uninitialized on this error path.

The fix is in Linus's tree:

commit 17bc10300c69bd51b82983cdadafa0a7791f074e
Author: Nathan Chancellor <natechancellor@gmail.com>
Date:   Mon Aug 17 23:49:25 2020 -0700

    block/rnbd: Ensure err is always initialized in process_rdma


-- 
Jens Axboe

