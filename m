Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2404738741
	for <lists+kernel-janitors@lfdr.de>; Fri,  7 Jun 2019 11:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727406AbfFGJnj (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 7 Jun 2019 05:43:39 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:45492 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726823AbfFGJnj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 7 Jun 2019 05:43:39 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190607094338euoutp018d6ed696206c018d3642c1a3e3a393a1~l4Vjw--TE1083010830euoutp01-
        for <kernel-janitors@vger.kernel.org>; Fri,  7 Jun 2019 09:43:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190607094338euoutp018d6ed696206c018d3642c1a3e3a393a1~l4Vjw--TE1083010830euoutp01-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1559900618;
        bh=rb2BOXnNeBtJ/cuTqerwSL2vB7lvAO/eLPvb8H1+tqU=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=mnkwEpWyq3veJKu/V6GUKxkQXUu7tlDebGPIEM10IB4ak+FKrZo0BYzAyQfAWnDmS
         lQOlhKvA4/A0YPsUYUAsPxvsnqMkz4N/JYUJFIqrTLIAk01jvfz1rT7RBb009VEuVz
         jxoIrWV+T/CNzpEuzSrCE/5S1LX75a4PP9E0fRGo=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190607094337eucas1p24884d3969b8f5f5183a92ddabf54ecd2~l4Vi4TFaR3082530825eucas1p2H;
        Fri,  7 Jun 2019 09:43:37 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 33.12.04298.8C13AFC5; Fri,  7
        Jun 2019 10:43:36 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190607094336eucas1p24e04cf109d73567011ae5235a31a8829~l4ViBGk330072900729eucas1p2x;
        Fri,  7 Jun 2019 09:43:36 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190607094335eusmtrp2142d12c9ed9d0eeb7f8fac6ccc0ce16c~l4VhxnlTY0958609586eusmtrp2q;
        Fri,  7 Jun 2019 09:43:35 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-be-5cfa31c8de40
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 3C.E4.04146.7C13AFC5; Fri,  7
        Jun 2019 10:43:35 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190607094335eusmtip20c2166ee3ac3ee7605aad06d480fa2ce~l4Vg-kE6d2541025410eusmtip2Y;
        Fri,  7 Jun 2019 09:43:35 +0000 (GMT)
Subject: Re: [PATCH 1/2] drm/bridge: sii902x: re-order conditions to prevent
 out of bounds read
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Jyri Sarha <jsarha@ti.com>
Cc:     Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
From:   Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <2f21e800-7053-f004-6592-6ef43ee68914@samsung.com>
Date:   Fri, 7 Jun 2019 11:43:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190607072704.GA25229@mwanda>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHe3fO2TlKs+M0fFApWkEo5q2IdUG7WBz8FH0IqYWe8qSiU9nU
        siAVS6amaV903j8oSivnpvNSKaXgkvBK4VrRDBWyNKs5aYKuHY+S337P+38u/z+8FCY1EP5U
        SnoWp0pn02RiT7x72Dl+5G3EmiK8cTVcXjY2IpL/2KjC5a7uSkz+3rEslpcWawi5yRogL65s
        Js+QTP9qE87UarQE07M6QzC2UrOI+T1vxRmzpUfE2I37LpFXPU8ncmkpOZwqLCrBM7nSoscz
        6z3uuGZtonw0QpYgDwroY1D3oY7gWUq3IahdZEuQp5tXEGjeWJFQ2BFMPasWb0/oFhbFgtCK
        YNppIIRiCcHjl+sivsuHZqH122eMZ1+ageqxlc0JjH6NYNbQsHlcTAfBeudHt0BREjoKlh/F
        8IjTh2Bt1Ivv2EvHgW24Y9OehPaGEe0czrMHHQIt+mHEM0bvh0JTLSawH1jnGkX8KaAHSCh6
        1bnlOgYavrgIgX3gu7lrK38guPoaRQLnga3tASYMaxCYOvowQTgFQ+ZJgjeHuT3rX4TxCPRZ
        WOnaI6AXWJa8BQte8KS7ChOeJaApkgo7DoBt1LS1zw9aJhziCiSr2RGsZkeYmh1hav6fbUL4
        U+THZauVSZw6Ip27Hapmlers9KTQmxlKI3J/pHcb5j+9yDF1YxDRFJLtljCkUyEl2Bx1rnIQ
        AYXJfCU5E38VUkkim3uXU2XEq7LTOPUgCqBwmZ/k3q6Za1I6ic3iUjkuk1NtqyLKwz8fnYjW
        XqiKc5206YZjYssszSUp46jyeFCR7mJs7+xMOHklrtz5M09DGj+dux/dHq6LOPh8MHlgKPBr
        4nRGofG6rKA2XuvUT/XCcnD+Qv/kw0TccTBSD8ajWnvIL3t53bzBFF1YwPhIeqYvT0Qa2o3N
        qd6x1on684qOhIrDc7dkuDqZjQjGVGr2H2HOXCNEAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRmVeSWpSXmKPExsVy+t/xe7rHDX/FGDyYamrRe+4kk8Xrf9NZ
        LP5vm8hsceXrezaL7s4OVoutt6QtOicuYXdg99j7bQGLx+yOmawe2789YPW4332cyePj01ss
        HsdvbGfy+LxJLoA9Ss+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUn
        syy1SN8uQS9j4o31LAVzOSv+P77P1MB4kr2LkZNDQsBEYvXLN2xdjFwcQgJLGSXedyxhhkiI
        S+ye/xbKFpb4c60Lqug1o8Ts3vtg3cICiRLLX9wBKxIR8JCYce4LWBGzwAFGiY7L7xhBEkIC
        9RI3j58FK2IT0JT4u/kmUBEHB6+AncT7HhcQk0VAReLXWT6QClGBCIkz71ewgNi8AoISJ2c+
        AbM5BXQklq4/BjaRWUBd4s+8S8wQtrxE89bZULa4xK0n85kmMArNQtI+C0nLLCQts5C0LGBk
        WcUoklpanJueW2yoV5yYW1yal66XnJ+7iREYhduO/dy8g/HSxuBDjAIcjEo8vA4MP2OEWBPL
        iitzDzFKcDArifCWXfgRI8SbklhZlVqUH19UmpNafIjRFOi3icxSosn5wASRVxJvaGpobmFp
        aG5sbmxmoSTO2yFwMEZIID2xJDU7NbUgtQimj4mDU6qBMfyZtNl7waePrkwRfOR++ISZ39Xf
        uvpsF50273CZLnQgetuNYsdtEXfthZeePWu6JjvUZ7/YcoV4ZqcHhtN/V3Gz7SpYtac8R/T0
        y2cGDgedens2pjyXv1Sw/rhX5t43Sy7sNO7cWB60qLpchcfcp2l227Tq5NdXt5dnbW5bHmIW
        nxK69VUxtxJLcUaioRZzUXEiAL0xRFvYAgAA
X-CMS-MailID: 20190607094336eucas1p24e04cf109d73567011ae5235a31a8829
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190607072733epcas1p34d1a3afb68cb189947c794b1fc8c73a0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190607072733epcas1p34d1a3afb68cb189947c794b1fc8c73a0
References: <CGME20190607072733epcas1p34d1a3afb68cb189947c794b1fc8c73a0@epcas1p3.samsung.com>
        <20190607072704.GA25229@mwanda>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 07.06.2019 09:27, Dan Carpenter wrote:
> This should check that "i" is within bounds before checking reading from
> the array.
>
> Fixes: ff5781634c41 ("drm/bridge: sii902x: Implement HDMI audio support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>


Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

 --
Regards
Andrzej


> ---
>  drivers/gpu/drm/bridge/sii902x.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index d6f98d388ac2..6b03616d6bc3 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -589,8 +589,8 @@ static int sii902x_audio_hw_params(struct device *dev, void *data,
>  	if (ret)
>  		goto out;
>  
> -	for (i = 0; sii902x->audio.i2s_fifo_sequence[i] &&
> -		     i < ARRAY_SIZE(sii902x->audio.i2s_fifo_sequence); i++)
> +	for (i = 0; i < ARRAY_SIZE(sii902x->audio.i2s_fifo_sequence) &&
> +		    sii902x->audio.i2s_fifo_sequence[i]; i++)
>  		regmap_write(sii902x->regmap,
>  			     SII902X_TPI_I2S_ENABLE_MAPPING_REG,
>  			     sii902x->audio.i2s_fifo_sequence[i]);


