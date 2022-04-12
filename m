Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 744D54FCABD
	for <lists+kernel-janitors@lfdr.de>; Tue, 12 Apr 2022 02:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242925AbiDLAzu (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 11 Apr 2022 20:55:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244999AbiDLAyh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 11 Apr 2022 20:54:37 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2719F1FA6A
        for <kernel-janitors@vger.kernel.org>; Mon, 11 Apr 2022 17:49:04 -0700 (PDT)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220412004900epoutp03f19a1b9fff33ac41328d387ca838a787~k-7qHnihz1771217712epoutp03l
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Apr 2022 00:49:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220412004900epoutp03f19a1b9fff33ac41328d387ca838a787~k-7qHnihz1771217712epoutp03l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1649724540;
        bh=bM4sT/dgihgAzz88a52hmeLcMkFadU2IK7Fg+HHouf4=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=snAocxfmpBJk6AAnwd97sXKQQEkS+b+e8iIavrHNbuXmpr8/9smoRaINGNOJXX0/s
         BFLZ703PHf1oCTE5LCSpD0LxRvrMPBLp1h6xsuoOTvbPtVqTCICgEZnoQe2BomJ6Q4
         YM93gRjoh8Vue0WTlddots3fi75IyK594dXsBZyQ=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20220412004859epcas1p2b08431c5bfb6bf8408bc99d361f5e549~k-7pdA3Xk0880608806epcas1p2I;
        Tue, 12 Apr 2022 00:48:59 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.36.132]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4KcnCt2bs2z4x9QM; Tue, 12 Apr
        2022 00:48:58 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
        epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
        06.6D.28648.A7CC4526; Tue, 12 Apr 2022 09:48:58 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
        20220412004857epcas1p4f8308bd4193fba5c5bbca9ca0871aa2c~k-7n_cJxX1381013810epcas1p4E;
        Tue, 12 Apr 2022 00:48:57 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220412004857epsmtrp2d28372a02549585bf90ed0ffed134509~k-7n9jlJH0240402404epsmtrp2J;
        Tue, 12 Apr 2022 00:48:57 +0000 (GMT)
X-AuditID: b6c32a39-003ff70000006fe8-3a-6254cc7a4a81
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        10.FD.03370.97CC4526; Tue, 12 Apr 2022 09:48:57 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220412004857epsmtip2f72ae4de545bc88eb275a287cf6aa42b~k-7ngG_RV0321303213epsmtip2L;
        Tue, 12 Apr 2022 00:48:57 +0000 (GMT)
Message-ID: <c7606920-b5c9-f8e3-3026-631a796c195a@samsung.com>
Date:   Tue, 12 Apr 2022 10:01:20 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
        Thunderbird/91.7.0
Subject: Re: [PATCH] drm/exynos: fix IS_ERR() vs NULL check in probe
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Cc:     Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Robert Foss <robert.foss@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        kernel-janitors@vger.kernel.org
From:   Inki Dae <inki.dae@samsung.com>
In-Reply-To: <20220408102134.GA14120@kili>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKJsWRmVeSWpSXmKPExsWy7bCmnm7VmZAkg513BS16z51ksngwbxub
        xet/01ks/m+byGxx5et7NosvmyawWWy9JW2x9/VWdouzTW/YLWac38dksfbIXXaLT7MeMlvM
        mPySzYHXY+3H+6wee78tYPG4c20Pm8f2bw9YPe53H2fy+Pj0FotH35ZVjB6fN8kFcERl22Sk
        JqakFimk5iXnp2TmpdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYAnaykUJaYUwoU
        CkgsLlbSt7Mpyi8tSVXIyC8usVVKLUjJKTAt0CtOzC0uzUvXy0stsTI0MDAyBSpMyM6Y9XYh
        e8EHzopTf+cyNjBO5+hi5OSQEDCReLlkKVsXIxeHkMAORomOxYsYIZxPjBL75nxkh3A+M0q8
        O3GGCabl+M0jrBCJXYwSO6fMZIFw3jNKPHxwgxGkilfATuJK/x+gwRwcLAKqEk/nJ0OEBSVO
        znzCAmKLCkRI/Lr1iB3EFhZwkdi2tJMZxGYWEJe49WQ+2DIRgXCJBdubwe5jFnjELLF+9new
        +WxAMyeuuM8GYnMKaEmcanvDCNEsL9G8dTYzxKU3OCRefyiFsF0kTt5+BRUXlnh1fAs7hC0l
        8fndXrAFEgKTGSXuXF/BAuHMYJQ4/PM6I0SVscT+pZOZQL5hFtCUWL9LHyKsKLHz91yoxXwS
        7772sIKUSAjwSnS0CUGUKEkcu3gDaoqExIUlE9kgbA+JmXd/s01gVJyFFC6zkPw/C8k7sxAW
        L2BkWcUollpQnJueWmxYYAqP7uT83E2M4PSsZbmDcfrbD3qHGJk4GA8xSnAwK4nwPgsLSRLi
        TUmsrEotyo8vKs1JLT7EaAqMnInMUqLJ+cAMkVcSb2hiaWBiZmRsYmFoZqgkzrtq2ulEIYH0
        xJLU7NTUgtQimD4mDk6pBqZYhbm8QefLvmzwXPl1/13Zjw2vPu7QTee783aZwNGbUnenVrTx
        njhzgyF9u0Ff7P+rq0QDnulNuGb98erXnrYvSzfKiBetnCu2O+Pn8wOCf7Jnq11tlzTNZvWp
        41oUnbTT+m5Y8drItOaEC1edZ54POtwo2biK/2O2Jc/bNaXu0q0um5c5hQjInQi5l8a47viZ
        lY6b/mQa72SfwLRB5RN7drC58/a/Ehq3l1vf/zhF727F4+ScNMvfnxc/LfuTWzgxcZsid1p4
        9AGVpM4iZS3en7m33ukuyV4RVftr3ef0lcUzi13Z1296HBai4K78NLnUZ6Ug75Z8o5Msk997
        OqzoNQ/2cLm29X2zT0iPWJASS3FGoqEWc1FxIgCn2tW7WAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRmVeSWpSXmKPExsWy7bCSvG7lmZAkg/2zdCx6z51ksngwbxub
        xet/01ks/m+byGxx5et7NosvmyawWby4d5HFYustaYu9r7eyW5xtesNuMeP8PiaLtUfuslt8
        mvWQ2WLG5JdsDnweaz/eZ/XY+20Bi8eda3vYPLZ/e8Dqcb/7OJPHx6e3WDz6tqxi9Pi8SS6A
        I4rLJiU1J7MstUjfLoErY9bbhewFHzgrTv2dy9jAOJ2ji5GTQ0LAROL4zSOsXYxcHEICOxgl
        jrTeZ+pi5ABKSEhs2coBYQpLHD5cDFIuJPCWUWL68lAQm1fATuJK/x82kBIWAVWJp/OTIcKC
        EidnPmEBsUUFIiSW7ZoKZgsLuEhsW9rJDGIzC4hL3HoynwnEFhEIl5jydBI7yAXMAs+YJVqu
        T2GD2FUr0d+6A6yIDWj+xBX3weKcAloSp9reMILsZRZQl1g/TwhiprxE89bZzBMYhWYhOWMW
        knWzEDpmIelYwMiyilEytaA4Nz232LDAKC+1XK84Mbe4NC9dLzk/dxMjOB61tHYw7ln1Qe8Q
        IxMH4yFGCQ5mJRHeZ2EhSUK8KYmVValF+fFFpTmpxYcYpTlYlMR5L3SdjBcSSE8sSc1OTS1I
        LYLJMnFwSjUwqa3wuNYawymQkFRo2mvjEi7Fe+9NdaTWwn8uuwOf3rXJ75T3FF4evPt/gv/0
        cw6VM0IOT+I4XND9cGX0yskJJ/R2JOxiz9LJ0vrgeVZ49rL2HVnrFO8eaeJd5b9t18/H25du
        ZnoZ7+34v+aW0F2mWXZij14lnX314smbz2VT9/9TujE995yFSVLBB/4F7/xnfV7TIJB+sIql
        IN9HZLZIk8+mwrk5varrpCZ9X3DJ1SUjzKVL/XOEzeruzEX+05sTlBL/H37VlHr5/1WBz8cK
        THI/6lneTm8/67P75/PLxlm8S2bOn7o/USRr+9HozaavsyOzl7ze9idAcLG+fdTMrm3+LSL5
        ngvLS1wCGX+5K7EUZyQaajEXFScCANdao2o2AwAA
X-CMS-MailID: 20220412004857epcas1p4f8308bd4193fba5c5bbca9ca0871aa2c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220408102327epcas1p409b13bf2da7e19b0a24571ce50e3ea92
References: <CGME20220408102327epcas1p409b13bf2da7e19b0a24571ce50e3ea92@epcas1p4.samsung.com>
        <20220408102134.GA14120@kili>
X-Spam-Status: No, score=-6.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan Carpenter.

Same patch[1] was posted so I will pick it up. 

[1] https://www.spinics.net/lists/arm-kernel/msg967488.html

Thanks,
Inki Dae

22. 4. 8. 19:21에 Dan Carpenter 이(가) 쓴 글:
> The of_drm_find_bridge() does not return error pointers, it returns
> NULL on error.
> 
> Fixes: dd8b6803bc49 ("exynos: drm: dsi: Attach in_bridge in MIC driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> -EPROBE_DEFER is the correct return, right?
> 
>  drivers/gpu/drm/exynos/exynos_drm_mic.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
> index 9e06f8e2a863..07e04ceb2476 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
> @@ -434,9 +434,9 @@ static int exynos_mic_probe(struct platform_device *pdev)
>  
>  	remote = of_graph_get_remote_node(dev->of_node, 1, 0);
>  	mic->next_bridge = of_drm_find_bridge(remote);
> -	if (IS_ERR(mic->next_bridge)) {
> +	if (!mic->next_bridge) {
>  		DRM_DEV_ERROR(dev, "mic: Failed to find next bridge\n");
> -		ret = PTR_ERR(mic->next_bridge);
> +		ret = -EPROBE_DEFER;
>  		goto err;
>  	}
>  
