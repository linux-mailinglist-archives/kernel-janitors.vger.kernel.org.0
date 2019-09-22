Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D66E4BA047
	for <lists+kernel-janitors@lfdr.de>; Sun, 22 Sep 2019 04:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727204AbfIVCnz (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 21 Sep 2019 22:43:55 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43737 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727201AbfIVCnz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 21 Sep 2019 22:43:55 -0400
Received: by mail-pg1-f195.google.com with SMTP id d4so2863237pgd.10
        for <kernel-janitors@vger.kernel.org>; Sat, 21 Sep 2019 19:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=nOgWL+giO3OF7JU77tFkF1HZOgXSLjLGEM4YdmarUy0=;
        b=n1s3qLO1cyMpCgm3y+dJWEtTk9i10BruwIOR38foEcM2c95wXg9tMS7u1B9rlRcsJB
         8dhIKe2cgliEmywjeEC9jjFeRpoBGExwBM2BlkRux3QbpLDdt2ZezY05TB7veIUAEQvM
         jbqAS/oWyP3hjDnkLzt4Bk61PEAUOt4EHRJHDICFPvoNYu6BEgAgynpXJpCw64yjB6q4
         gF+Le2FuOthRrW3w0HD+vgXgbyWlbNmo23I3cdszqQAUY8vqkW6S/TezBd0Q/BhLcDMk
         /+DKOVz2ndxD0U5XE0lpNt6yfHWv+ryQuybzb0uu3JwEKY7CLdUyLVyWQ+dzRsOD8h6T
         CNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=nOgWL+giO3OF7JU77tFkF1HZOgXSLjLGEM4YdmarUy0=;
        b=gSRydG5YKq4uNk+WLqaUrneIGoVKQ2myjCRFe/C7d+88vjJQuvE1eACUKaHoH5TXTG
         pHo+VQ1thK7g4TJ8ps+jkixs0D4rZioDU4N26nF3Uc1Hc+TFngizaQO+pdcThCHmq+yq
         pfTQ6DVYu/2lutYgAoOfjiaod8lYKWIHI6OYQ3B1NVpVhQ+jNnOjZqqAsHETvDZJ2eXB
         ygXs1WjCVscBdVgKknkQe0Gvo27CejzhgVvEVuEj+24jYyzx9ii0LulEaNZgKjyHKYxL
         HL/MwzFiQCX9BtgdxSteDddAXGZLgJ2s+pa4m0AOSR/bX/HGK9mMMGp4CU90VcpZTswz
         oyhQ==
X-Gm-Message-State: APjAAAVnsjMCp1Re3kFpl3+t+nI/5MNNI1N5lZdi3gInicNFKtwwbBq7
        cSwuH5USPKcuPYxFY5juBtB3Tw==
X-Google-Smtp-Source: APXvYqxY6qNtrBC/TZYXlUXV5rKkjJWUqQrurXGhF8XVryWr+VkYxBPxyZfndPMajJMLaHnevVeDYQ==
X-Received: by 2002:a17:90a:3450:: with SMTP id o74mr13667448pjb.5.1569120234901;
        Sat, 21 Sep 2019 19:43:54 -0700 (PDT)
Received: from cakuba.netronome.com (c-73-202-202-92.hsd1.ca.comcast.net. [73.202.202.92])
        by smtp.gmail.com with ESMTPSA id h1sm6697407pfk.124.2019.09.21.19.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Sep 2019 19:43:54 -0700 (PDT)
Date:   Sat, 21 Sep 2019 19:43:52 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Mao Wenan <maowenan@huawei.com>
Cc:     <olteanv@gmail.com>, <andrew@lunn.ch>, <vivien.didelot@gmail.com>,
        <f.fainelli@gmail.com>, <davem@davemloft.net>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH net] net: dsa: sja1105: Add dependency for
 NET_DSA_SJA1105_TAS
Message-ID: <20190921194352.1500a70d@cakuba.netronome.com>
In-Reply-To: <20190919063819.164826-1-maowenan@huawei.com>
References: <20190919063819.164826-1-maowenan@huawei.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 19 Sep 2019 14:38:19 +0800, Mao Wenan wrote:
> If CONFIG_NET_DSA_SJA1105_TAS=y and CONFIG_NET_SCH_TAPRIO=n,
> below error can be found:
> drivers/net/dsa/sja1105/sja1105_tas.o: In function `sja1105_setup_tc_taprio':
> sja1105_tas.c:(.text+0x318): undefined reference to `taprio_offload_free'
> sja1105_tas.c:(.text+0x590): undefined reference to `taprio_offload_get'
> drivers/net/dsa/sja1105/sja1105_tas.o: In function `sja1105_tas_teardown':
> sja1105_tas.c:(.text+0x610): undefined reference to `taprio_offload_free'
> make: *** [vmlinux] Error 1
> 
> sja1105_tas needs tc-taprio, so this patch add the dependency for it.
> 
> Fixes: 317ab5b86c8e ("net: dsa: sja1105: Configure the Time-Aware Scheduler via tc-taprio offload")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>

Applied, thank you!
