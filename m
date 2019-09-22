Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E319BABC7
	for <lists+kernel-janitors@lfdr.de>; Sun, 22 Sep 2019 23:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392634AbfIVVIF (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 22 Sep 2019 17:08:05 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41761 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388916AbfIVVIF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 22 Sep 2019 17:08:05 -0400
Received: by mail-pg1-f195.google.com with SMTP id s1so5642154pgv.8
        for <kernel-janitors@vger.kernel.org>; Sun, 22 Sep 2019 14:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=N02DuWV6Ls3abVLlI8h6X8K21ukMEFlJkO/0aLsDK0s=;
        b=LbRVKPEYYOO6psE0Yw77Hs/lDLbvbwH8YrMPHyagr9mucUEr8xFECka9eq2nyTNqDj
         a01yizLfeFS4nTPCHzjwVPFNOChkR8WPwpuz83J2MC5xiB5b2DOSHWMlIuH7lUOjQVh6
         z1W45WY0YU4bYw3QLcti59jEjmLmgof1zWm8FEgvA12KWoVeJO+xw4jKEhK2U67gf98x
         aREdIF8OzVfEb4hQRkRH1LAwKHRwskSZcaieRFNpofR3iAG9G6hCD4z4jyuc7OnS08es
         XsE4V/hOPFetMFiq7GLLhuaojYQPvel27pFMUIV8fZsgqpU/95X6LqqeO8tgkRGNoIMf
         CR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=N02DuWV6Ls3abVLlI8h6X8K21ukMEFlJkO/0aLsDK0s=;
        b=JZMB7IFIJgYlaxB1NlcdALCBkbyqWgkuqMg0DC0Eh272LNPN2pkQiibKAEyfXtetfJ
         nJ/A9USvGszyW4YwJ66MuAtfwcQYl8qXbO0Nq7Q8UO36S1zD65oQYOaFu6aeACZ44SGq
         1SK/0DzP1UWOFoULmaCqygO2QpI/lWj+BTbNsu/e29xm1R+tmbp7ejMW3mLVYHCyaxHq
         IY/JH4XuqeWcOLZLSSY1ANshuP5ba6Ncwt1QMmlN0ca5H6ZsCg+kUWzVBqHazZ13Cki6
         m80yemSDQm9CCko+mnczOqeK4GQvQI3Wd9RbnNBR2cuoLddlGpJU2EwoWO2LDc9IM+1w
         kB3w==
X-Gm-Message-State: APjAAAWm9pWkgccuZzRrmvvG6/iEI/FdA1ELPbZHj9iWTQ6Dwb9Ztx3w
        kwlZrzy/BnrFQLfIYtrzPcKArA==
X-Google-Smtp-Source: APXvYqyx2Ki6Glce3kMT9uI6N/7jpfRnMKxmuPdQQpvOkPKiHMkHWfeObbmKV3AUCYAztvbIE7B33g==
X-Received: by 2002:a62:3687:: with SMTP id d129mr30557925pfa.199.1569186484473;
        Sun, 22 Sep 2019 14:08:04 -0700 (PDT)
Received: from cakuba.netronome.com (c-73-202-202-92.hsd1.ca.comcast.net. [73.202.202.92])
        by smtp.gmail.com with ESMTPSA id k95sm9971958pje.10.2019.09.22.14.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2019 14:08:04 -0700 (PDT)
Date:   Sun, 22 Sep 2019 14:08:00 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Mao Wenan <maowenan@huawei.com>
Cc:     <netanel@amazon.com>, <saeedb@amazon.com>, <zorik@amazon.com>,
        <davem@davemloft.net>, <netdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH v2 net] net: ena: Select DIMLIB for ENA_ETHERNET
Message-ID: <20190922140800.6b1ed695@cakuba.netronome.com>
In-Reply-To: <20190922053808.117965-1-maowenan@huawei.com>
References: <20190921200741.1c3289e8@cakuba.netronome.com>
        <20190922053808.117965-1-maowenan@huawei.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, 22 Sep 2019 13:38:08 +0800, Mao Wenan wrote:
> If CONFIG_ENA_ETHERNET=y and CONFIG_DIMLIB=n,
> below erros can be found:
> drivers/net/ethernet/amazon/ena/ena_netdev.o: In function `ena_dim_work':
> ena_netdev.c:(.text+0x21cc): undefined reference to `net_dim_get_rx_moderation'
> ena_netdev.c:(.text+0x21cc): relocation truncated to
> fit: R_AARCH64_CALL26 against undefined symbol `net_dim_get_rx_moderation'
> drivers/net/ethernet/amazon/ena/ena_netdev.o: In function `ena_io_poll':
> ena_netdev.c:(.text+0x7bd4): undefined reference to `net_dim'
> ena_netdev.c:(.text+0x7bd4): relocation truncated to fit:
> R_AARCH64_CALL26 against undefined symbol `net_dim'
> 
> After commit 282faf61a053 ("net: ena: switch to dim algorithm for rx adaptive
> interrupt moderation"), it introduces dim algorithm, which configured by CONFIG_DIMLIB.
> So, this patch is to select DIMLIB for ENA_ETHERNET.
> 
> Fixes: 282faf61a053 ("net: ena: switch to dim algorithm for rx adaptive interrupt moderation")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>

Applied, thank you!
