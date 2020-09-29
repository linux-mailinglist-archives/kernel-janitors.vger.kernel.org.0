Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B197627D3D2
	for <lists+kernel-janitors@lfdr.de>; Tue, 29 Sep 2020 18:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730026AbgI2Qp7 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 29 Sep 2020 12:45:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730004AbgI2Qp7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 29 Sep 2020 12:45:59 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 646A8C061755
        for <kernel-janitors@vger.kernel.org>; Tue, 29 Sep 2020 09:45:59 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id ml18so128872pjb.2
        for <kernel-janitors@vger.kernel.org>; Tue, 29 Sep 2020 09:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EWf5uZ4di5a8bNnGNvRQqhhbxpq0Hl6WtrclbjDfsXw=;
        b=r2s0NQ8gdGhrT7SJySxDldS7VFAtcmTHx5vKYiRUy+0ZAp4+NvTvwthToBtkqprYVf
         d+bMCK0rfMyutm23Y0K3Nm8L1LICAw6sNlLSIiMUZLFOzZxVHif/g1VhLV+TrEosBcs+
         fwPjPKN70DWSPouvj76AsxNvqZclVS77xtJ339DtgM1kWG2cGAfyA7YiLFefCCBuuQGC
         42esvjaRWbVG7faHShOfivgas1R3Vqsw82POc+nQxIagbMrfVdOQbzEaKgreEwZp3pkk
         SOENjH7BQxfM5fUNAx1+oxsA/wBU8ShNFQnnwdHw5LUf1TwEwdaNJk6y7002Hrv1gMVQ
         uNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EWf5uZ4di5a8bNnGNvRQqhhbxpq0Hl6WtrclbjDfsXw=;
        b=HvJcInOT0e4OiYgGCNzeP+OeJr5XKzK/DUK3/4kqfAaRZRGwYtoUg/spQj8+xtcQUv
         9INnzdArpfoT7/vkpmR0DQBbizCD35fD+R8UJj65nbwpU66jBB8gY/Mv2MGTdO+9Oo9L
         l3LSLJzHgd4jvhF8XGwDuLimy41mTqs94eY4dIbLCFQVF2GbUulFxBvTtyUpPT5JO6bj
         mCv2sm6HiGxZ5RexJatjOaYQtorewv+XveIiG0zpJknha5nWAE8CeYwvmvtjERNR8G51
         AuKIM9DujcISgawkuut6Fja4kEaqKFyF2d+GpfUMChAz0Pt284ZiSJpPFpIVEUP+zny4
         lJkg==
X-Gm-Message-State: AOAM531nHEusBBtvnL+51Ukl7RgROIByknvxsSOqOMtN9uxk3nUwoKa+
        UtfQ0R5SoJz1qSaJuiX0/4fC/lzS/wTiPw==
X-Google-Smtp-Source: ABdhPJyy89558qFqef9U3zx9A9ocvFVt+httDQtJwA4YDnNh3eJMdHvikJSrnm4rp5iUvLrsfhqVFg==
X-Received: by 2002:a17:90a:297:: with SMTP id w23mr4523805pja.44.1601397958372;
        Tue, 29 Sep 2020 09:45:58 -0700 (PDT)
Received: from [10.230.29.112] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id b11sm6154264pfd.33.2020.09.29.09.45.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2020 09:45:57 -0700 (PDT)
Subject: Re: [bug report] net: vlan: Avoid using BUG() in vlan_proto_idx()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org
References: <20200929092808.GA485919@mwanda>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <46958e70-0236-cc9f-71fa-e71584ec5b1b@gmail.com>
Date:   Tue, 29 Sep 2020 09:45:57 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200929092808.GA485919@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 9/29/2020 2:28 AM, Dan Carpenter wrote:
> Hello Florian Fainelli,
> 
> The patch d0186842ec5f: "net: vlan: Avoid using BUG() in
> vlan_proto_idx()" from Sep 24, 2020, leads to the following static
> checker warning:
> 
> 	net/8021q/vlan.c:60 vlan_group_prealloc_vid()
> 	warn: unsigned 'pidx' is never less than zero.

Fixed with:

https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?id=0675c285ea65540cccae64c87dfc7a00c7ede03a

Thanks
-- 
Florian
