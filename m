Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD64426A1CA
	for <lists+kernel-janitors@lfdr.de>; Tue, 15 Sep 2020 11:12:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbgIOJMW (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 15 Sep 2020 05:12:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgIOJMS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Sep 2020 05:12:18 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3498C061788
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Sep 2020 02:12:17 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id z1so2489784wrt.3
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Sep 2020 02:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tessares-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wqDzL5jXjIcU644bGfyRewIDuV/CRiP2hfEuWrticS4=;
        b=I0LTECfJFeTgfuODSS0m5seGDuAH20STqbD8aY6ZNZJS7bmqsdSKZi3N31yKfxRDMH
         96pIhM1oDDQqxTdkkVQESCIMwLi69GrhjccK9zFdgkEp3vz3Hy8dMhTjsjqBBtkSx6nE
         k46o7CSeMT765mmOx0eAYv2GH3HXm3sSBwGuBTvSWd0FgAgdOQujmerXEEi5gDb/8CVI
         r7mD+Vq9FZNqYHRegBD4xiArasYYCT5wsgSTuYiH3Egs8wfDKO7bVK66fJrDbssFaXBy
         UkWMCXYsluKl4er7GlA2ui18yE6WWI0X+J4nzgL3D9yNaW4+5MKCJjMnpB75C5FMU2hD
         BR+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wqDzL5jXjIcU644bGfyRewIDuV/CRiP2hfEuWrticS4=;
        b=o15a+YMZhFVeteGJalRDmjhWal2NiczEZSZL7lBlwVQcSnqqrYGgWLMSGmju823vtx
         nHd7k/89ko3nJK7eVsAgvrDSdQHvrp2+AqRGpOn0IwXJi1E1eDoAaUtfd7JvYkTcPOkt
         W9EDZt9Jkl53PcYB2fdhsRw1cfIhssLlIab32qfbJDeZXgA+MmbDv9yAVVwIXY0rbOiX
         UFIgqDuAoJSqjD8U1XS5uVUHqMKs5sLi59sGGk/HQwiId359ZvTiUfhLJzFdDuGsx2qs
         BkS/f75UyvvCrzlWXzunavmsvnDOvDlKTG3e7CsaD1HxwMy5hAPBEUGx6Pnu5tbJkt7M
         ScIg==
X-Gm-Message-State: AOAM530gx/lYiQxY4dQQGiFhjZaxz42GYY2uiykbktuaX9cNazuopEvQ
        i2tY/eDxaP8dak0RE4QFTXXZIBQ+Y3ycOxe/
X-Google-Smtp-Source: ABdhPJxp60NPScv+VZoXofu7q1Z93POwdYx27pIbVKWrggjOKTIjLnFYw0DpvmvFvvArULBUijf1xg==
X-Received: by 2002:a5d:4cc1:: with SMTP id c1mr20260166wrt.122.1600161135955;
        Tue, 15 Sep 2020 02:12:15 -0700 (PDT)
Received: from tsr-lap-08.nix.tessares.net ([2a02:578:85b0:e00:ec32:668e:7a20:c1cd])
        by smtp.gmail.com with ESMTPSA id r15sm23444226wmn.24.2020.09.15.02.12.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2020 02:12:15 -0700 (PDT)
Subject: Re: [PATCH][next] mptcp: fix spelling mistake "colesced" ->
 "coalesced"
To:     Colin King <colin.king@canonical.com>,
        Mat Martineau <mathew.j.martineau@linux.intel.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, mptcp@lists.01.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200915084405.7361-1-colin.king@canonical.com>
From:   Matthieu Baerts <matthieu.baerts@tessares.net>
Message-ID: <d8a1bff2-4302-f48b-c7c7-5dadd95ab2b3@tessares.net>
Date:   Tue, 15 Sep 2020 11:12:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <20200915084405.7361-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Colin,

On 15/09/2020 10:44, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake a pr_debug message. Fix it.

Thank you for the patch!

Reviewed-by: Matthieu Baerts <matthieu.baerts@tessares.net>

Now I don't know if it can be accepted if it was not sent to netdev ML. 
You might have to re-submit it. If you do, please replace "next" by 
"net-next" in the subject to avoid confusion.

Cheers,
Matt
-- 
Tessares | Belgium | Hybrid Access Solutions
www.tessares.net
