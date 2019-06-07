Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9ABF638B5C
	for <lists+kernel-janitors@lfdr.de>; Fri,  7 Jun 2019 15:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728834AbfFGNPt (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 7 Jun 2019 09:15:49 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:54707 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728123AbfFGNPt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 7 Jun 2019 09:15:49 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190607131547euoutp01e5753bf406be65766f0ac85e3720bd2f~l7OzTUdkN2436924369euoutp01t
        for <kernel-janitors@vger.kernel.org>; Fri,  7 Jun 2019 13:15:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190607131547euoutp01e5753bf406be65766f0ac85e3720bd2f~l7OzTUdkN2436924369euoutp01t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1559913347;
        bh=ipSDqzXkxZSsKLogWJP+Bk1GtfirClhZZo/Ssubnam4=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=OiZDw3+a7+lJpCgIYaaNef0VX7qjSyZ3A5FkduDPT+t8pPuB5FGtjtLCbfPOHcQew
         ZmcuK3FZ4C+L1JtwSbb4pqsFA1T4eDwpz0/X5/V10Kq7t1rTPdtzlswZfgNvzEuh+I
         tDwNSfWJ05VEXyY0647j9JGAXJDINcd3EGMuEFws=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190607131547eucas1p17a29021d184c2fdc92215207b42c3b4d~l7OylP_zC2082420824eucas1p1D;
        Fri,  7 Jun 2019 13:15:47 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 5F.40.04377.2836AFC5; Fri,  7
        Jun 2019 14:15:46 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190607131546eucas1p2999c6f139b236f55d5221bf570ec407a~l7OxvxmJD0758407584eucas1p2S;
        Fri,  7 Jun 2019 13:15:46 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190607131545eusmtrp1dc6e0def4d00d6a7fd3a6899b23d219e~l7OxgSPIy2955529555eusmtrp1e;
        Fri,  7 Jun 2019 13:15:45 +0000 (GMT)
X-AuditID: cbfec7f4-12dff70000001119-25-5cfa6382c79a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id E9.E7.04140.1836AFC5; Fri,  7
        Jun 2019 14:15:45 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190607131545eusmtip2eea72019007ee471243f353ff7d9832a~l7OxKTzzU1429714297eusmtip2e;
        Fri,  7 Jun 2019 13:15:45 +0000 (GMT)
Subject: Re: [PATCH 1/2] drm/bridge: sii902x: re-order conditions to prevent
 out of bounds read
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Jyri Sarha <jsarha@ti.com>
Cc:     Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
From:   Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <08cc5236-0741-3b08-d133-9d354ad20d1d@samsung.com>
Date:   Fri, 7 Jun 2019 15:15:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190607072704.GA25229@mwanda>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIKsWRmVeSWpSXmKPExsWy7djPc7pNyb9iDL5M1bHoPXeSyeL1v+ks
        Fv+3TWS2uPL1PZtFd2cHq8XWW9IWnROXsDuwe+z9toDFY3bHTFaP7d8esHrc7z7O5PHx6S0W
        j+M3tjN5fN4kF8AexWWTkpqTWZZapG+XwJVxZVpewW+OissH9zA2MG5g72Lk5JAQMJF48Ho5
        WxcjF4eQwApGie03PzFDOF8YJb4cm8cO4XxmlLhwfDdTFyMHWMuNYyUQ8eWMEj83/mGCcN4y
        Sny/cZcRZK6wQKLE8hd3mEFsEQEPiRnnvoDtYBY4wCjxeOM8sOVsApoSfzffZAOxeQXsJG5/
        2w0WZxFQkTh3+AsTiC0qECHxZecmRogaQYmTM5+wgNicAjoSS9cfA4szC8hLbH87hxnCFpe4
        9WQ+E8Rz+9gl1u/lg7BdJD68f88MYQtLvDq+BRoAMhKnJ/ewQNj1EvdXtID9LyHQwSixdcNO
        qAZricPHL7KCvM8MdPT6XfqQkHCU+LKFH8Lkk7jxVhDiAj6JSdumM0OEeSU62oQgZihK3D+7
        FWqeuMTSC1/ZJjAqzULy1ywkv8xC8ssshLULGFlWMYqnlhbnpqcWG+WllusVJ+YWl+al6yXn
        525iBCak0/+Of9nBuOtP0iFGAQ5GJR5eB4afMUKsiWXFlbmHGCU4mJVEeMsu/IgR4k1JrKxK
        LcqPLyrNSS0+xCjNwaIkzlvN8CBaSCA9sSQ1OzW1ILUIJsvEwSnVwDgv6i779YPTQhZf+zbT
        cImHyuw/X6cGOco/NXy2fdYzJ1v/U9WHWqxMSxPXGmemH63vqYzaEHFedOOXz2IXBLTydX8I
        dW9Qmp7O8jyRPemW+oH2Qu7c/rvTHa4un9n97BPHR7vC1c9EFW9ujrSKs1oiax+yaFHgSTbB
        /0XfrjoxrvtkubDixBklluKMREMt5qLiRAC+EV1ZRAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRmVeSWpSXmKPExsVy+t/xe7qNyb9iDK60mVn0njvJZPH633QW
        i//bJjJbXPn6ns2iu7OD1WLrLWmLzolL2B3YPfZ+W8DiMbtjJqvH9m8PWD3udx9n8vj49BaL
        x/Eb25k8Pm+SC2CP0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3J
        LEst0rdL0Mu4Mi2v4DdHxeWDexgbGDewdzFycEgImEjcOFbSxcjFISSwlFFi7rXtQHFOoLi4
        xO75b5khbGGJP9e62CCKXjNKHJ72hg0kISyQKLH8xR2wIhEBD4kZ576AFTELHGCU6Lj8jhEk
        ISRQL3Hz+FmwIjYBTYm/m2+CNfMK2Enc/rYbbBuLgIrEucNfmEBsUYEIidm7GlggagQlTs58
        AmZzCuhILF1/DGwms4C6xJ95l5ghbHmJ7W/nQNniEreezGeawCg0C0n7LCQts5C0zELSsoCR
        ZRWjSGppcW56brGRXnFibnFpXrpecn7uJkZgFG479nPLDsaud8GHGAU4GJV4eGcw/YwRYk0s
        K67MPcQowcGsJMJbduFHjBBvSmJlVWpRfnxRaU5q8SFGU6DnJjJLiSbnAxNEXkm8oamhuYWl
        obmxubGZhZI4b4fAwRghgfTEktTs1NSC1CKYPiYOTqkGxrM9646fqP+oEx7+QbDFs3bKZrn9
        sYeDzyzy21V8W2vrkiiPDIune86Lt0v9eblej/FB66Uep1Uqno2nqyw5WEU3Fz/cwsh9YPP8
        nrldj0+81Iwrdg4UyRS4v/ODvcJe28jJa0vN2r6JtKQbOyfeTn3/ddo2kbv86YIlky17fO5z
        TDdu/KH6WImlOCPRUIu5qDgRAG0tCx/YAgAA
X-CMS-MailID: 20190607131546eucas1p2999c6f139b236f55d5221bf570ec407a
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

Queued to drm-misc-next.

--
Regards
Andrzej

