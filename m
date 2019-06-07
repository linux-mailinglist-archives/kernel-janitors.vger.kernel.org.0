Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD09B3873B
	for <lists+kernel-janitors@lfdr.de>; Fri,  7 Jun 2019 11:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727228AbfFGJnS (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 7 Jun 2019 05:43:18 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:45368 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726823AbfFGJnR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 7 Jun 2019 05:43:17 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190607094316euoutp01bd673371bb4b64b622627d1ed340855b~l4VP8XBDR1049510495euoutp014
        for <kernel-janitors@vger.kernel.org>; Fri,  7 Jun 2019 09:43:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190607094316euoutp01bd673371bb4b64b622627d1ed340855b~l4VP8XBDR1049510495euoutp014
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1559900596;
        bh=2aCYatxWWCHU9hiTSSHj1lqwR1mNeFA1loxdsGx/xSw=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=SJ2OXf8tb/F5iDjwAPmep4p2YJ89NUWF2qXshsO6fSGiWwPyz8+U15d+TFdizvZpR
         F6Gj0dsHoR5mdwPkZTRAPhjP8yhwXTfG2spUPVWICkk91HAgFxGc4aVD3/m5RENhrD
         NUeX0IvQWN6qL+uzQ8jYini0YkuUPowQQRZlU+5Y=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190607094315eucas1p10e8f942c903b3ea97f12293314f630ee~l4VOrT5w40728407284eucas1p1P;
        Fri,  7 Jun 2019 09:43:15 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id E6.1F.04325.3B13AFC5; Fri,  7
        Jun 2019 10:43:15 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190607094314eucas1p2a6f327eee49033b24ad9a8c3c607fa08~l4VNs66M30106201062eucas1p2G;
        Fri,  7 Jun 2019 09:43:14 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190607094314eusmtrp2e0796f8ae434085e0b1b1b3c45964149~l4VNdTQDv0958609586eusmtrp2h;
        Fri,  7 Jun 2019 09:43:14 +0000 (GMT)
X-AuditID: cbfec7f5-b8fff700000010e5-53-5cfa31b392f3
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 4C.D4.04146.2B13AFC5; Fri,  7
        Jun 2019 10:43:14 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190607094313eusmtip154b6b09db91c8d5c7da944e482aa87b0~l4VM3DzmW2310523105eusmtip1h;
        Fri,  7 Jun 2019 09:43:13 +0000 (GMT)
Subject: Re: [PATCH 2/2] drm/bridge: sii902x: fix a signedness bug in
 sii902x_audio_codec_init()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Jyri Sarha <jsarha@ti.com>
Cc:     Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
From:   Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <cd974289-db19-5e80-bd64-4b5f05dcb845@samsung.com>
Date:   Fri, 7 Jun 2019 11:43:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190607072727.GB25229@mwanda>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMKsWRmVeSWpSXmKPExsWy7djPc7qbDX/FGDw+wWrRe+4kk8Xrf9NZ
        LP5vm8hsceXrezaL7s4OVoutt6QtOicuYXdg99j7bQGLx+yOmawe2789YPW4332cyePj01ss
        HsdvbGfy+LxJLoA9issmJTUnsyy1SN8ugSvj4bRlbAW/2Cse35nD3MC4j62LkYNDQsBE4sxr
        /y5GLg4hgRWMEjevTWCEcL4wSiw+N4kJwvnMKLHr0zJmmI7jq0Mg4ssZJZ53LmSBcN4ySvyZ
        NJ21i5GTQ1ggSeLGsc9MILaIgIfEjHNf2ECKmAUOMEo83jiPHSTBJqAp8XfzTTYQm1fATuL8
        znvMIDaLgIrEijNzwWxRgQiJ+8c2sELUCEqcnPmEBcTmFNCR+PPhC1icWUBeYvvbOcwQtrjE
        rSfzwc6WEDjELnH6116wZRICLhK7515mgrCFJV4d3wIVl5H4v3M+VLxe4v6KFmaI5g5Gia0b
        djJDJKwlDh+/yAryPzPQ1et36UOEHSVa/i1mhAQLn8SNt4IQN/BJTNo2HRpavBIdbUIQ1YoS
        989uhRooLrH0wle2CYxKs5B8NgvJN7OQfDMLYe8CRpZVjOKppcW56anFxnmp5XrFibnFpXnp
        esn5uZsYgUnp9L/jX3cw7vuTdIhRgINRiYfXg/1njBBrYllxZe4hRgkOZiUR3rILP2KEeFMS
        K6tSi/Lji0pzUosPMUpzsCiJ81YzPIgWEkhPLEnNTk0tSC2CyTJxcEo1MKY4LuYU+5hqaS6k
        Lb2t0FzkJ4v/1wmrAuJXBd0/8ffwwrXsl+rlm57zMTWejGo9OnfCFo/jAkFRam8P3xRN8DrL
        HjC7mcFusr2zX+pzGZ3/3zszndItzq44EH2O4+Li2bUXNbaz9ta9fPY+JPDvjmvrhJ+fSdq4
        yKdudk/JRttXXhNnpS35tk+JpTgj0VCLuag4EQDnmxUaRgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRmVeSWpSXmKPExsVy+t/xu7qbDH/FGPz/xWrRe+4kk8Xrf9NZ
        LP5vm8hsceXrezaL7s4OVoutt6QtOicuYXdg99j7bQGLx+yOmawe2789YPW4332cyePj01ss
        HsdvbGfy+LxJLoA9Ss+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUn
        syy1SN8uQS/j4bRlbAW/2Cse35nD3MC4j62LkYNDQsBE4vjqkC5GLg4hgaWMErf27mbvYuQE
        iotL7J7/lhnCFpb4c62LDcQWEnjNKLF7sR6ILSyQJHHj2GcmEFtEwENixrkvbCCDmAUOMEp0
        XH7HCNFQLzHl1wmwoWwCmhJ/N98EG8QrYCdxfuc9sAUsAioSK87MBbNFBSIkzrxfwQJRIyhx
        cuYTMJtTQEfiz4cvrCA2s4C6xJ95l5ghbHmJ7W/nQNniEreezGeawCg0C0n7LCQts5C0zELS
        soCRZRWjSGppcW56brGhXnFibnFpXrpecn7uJkZgFG479nPzDsZLG4MPMQpwMCrx8Dow/IwR
        Yk0sK67MPcQowcGsJMJbduFHjBBvSmJlVWpRfnxRaU5q8SFGU6DnJjJLiSbnAxNEXkm8oamh
        uYWlobmxubGZhZI4b4fAwRghgfTEktTs1NSC1CKYPiYOTqkGRsGc4kr7tXM3aj9iSHnU4lQQ
        nHhnv8/RO/65NtyvKuI363q43hVRrF8dalE67+qZwDSF+p/fH222Pfwqb6lqzv0zKzvTuhe2
        X2BPT13CcTbBJk8yNsRIb2O94WlOsQvbgrZpf7WXLQz8prD5T8b+4zWLJha9dahcp5Imf995
        UmPYZHPGfK2FSizFGYmGWsxFxYkAp3SJ9NgCAAA=
X-CMS-MailID: 20190607094314eucas1p2a6f327eee49033b24ad9a8c3c607fa08
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190607072751epcas1p1e28023f2b62a6d052a19e4c0558188e1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190607072751epcas1p1e28023f2b62a6d052a19e4c0558188e1
References: <CGME20190607072751epcas1p1e28023f2b62a6d052a19e4c0558188e1@epcas1p1.samsung.com>
        <20190607072727.GB25229@mwanda>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 07.06.2019 09:27, Dan Carpenter wrote:
> The "num_lanes" variable needs to be signed for the error handling to
> work.  The "i" variable can be a regular int as well.
>
> Fixes: ff5781634c41 ("drm/bridge: sii902x: Implement HDMI audio support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>


Colin send already fix for this.


Regards

Andrzej


> ---
>  drivers/gpu/drm/bridge/sii902x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index 6b03616d6bc3..dd7aa466b280 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -719,7 +719,7 @@ static int sii902x_audio_codec_init(struct sii902x *sii902x,
>  		.max_i2s_channels = 0,
>  	};
>  	u8 lanes[4];
> -	u32 num_lanes, i;
> +	int num_lanes, i;
>  
>  	if (!of_property_read_bool(dev->of_node, "#sound-dai-cells")) {
>  		dev_dbg(dev, "%s: No \"#sound-dai-cells\", no audio\n",


