Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 891C06C9CBA
	for <lists+kernel-janitors@lfdr.de>; Mon, 27 Mar 2023 09:49:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232156AbjC0Htq (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 27 Mar 2023 03:49:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230309AbjC0Htp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 27 Mar 2023 03:49:45 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41431E1
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Mar 2023 00:49:45 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 093496603082;
        Mon, 27 Mar 2023 08:49:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1679903383;
        bh=Wigh5ZkT6PUuW6n+/iXN9rF147ZZhApXRlVFqVwLC+c=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=SMdmt5Cw1Lb0mW0Kv0Sqi3TEb5dSZ2fc8It4iiI8AFGy5/ZG85rnJmxXpAAardCBz
         yDWyYzLoX0zjh45pFeH8RgMc0tIg7HnPKhhTLxWkwBwvAmZGaqg+he+8/tPW3kb9Ec
         NTE9n05G6G7ivAa21j5vEaqh6faJCNeBpmdMyCic5v3q6xwTXegiENtLPwSDE4t/AE
         DBYrS8vgTiAUZTWEUTqT4jYA8VPIvdN4i/Hp38Zo+RxibSTOe5Mcha6U700m98WAd5
         8Oez93U/UlZxQY3vkwSsF/Ey+EjnVtJCcq45MQ6gbiLywAY1u4leiSvaeLQYV6+Dv7
         6hcQFgz3Kuuyg==
Message-ID: <c2410688-8343-9c29-a7a3-9e30b6696449@collabora.com>
Date:   Mon, 27 Mar 2023 09:49:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] iommu/mediatek: fix a reversed test in probe
To:     Dan Carpenter <error27@gmail.com>, Yong Wu <yong.wu@mediatek.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "Chengci.Xu" <chengci.xu@mediatek.com>, iommu@lists.linux.dev,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
References: <88c83ce7-5d1a-44a8-b9bf-0d01cfea24db@kili.mountain>
Content-Language: en-US
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <88c83ce7-5d1a-44a8-b9bf-0d01cfea24db@kili.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Il 25/03/23 12:07, Dan Carpenter ha scritto:
> The dma_set_mask() function returns negative error codes on failure but
> this code is testing for zero instead.
> 
> Fixes: f4b49c7c5e67 ("iommu/mediatek: Set dma_mask for PGTABLE_PA_35_EN")
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


