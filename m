Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 137EE74D1B9
	for <lists+kernel-janitors@lfdr.de>; Mon, 10 Jul 2023 11:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232836AbjGJJgJ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 10 Jul 2023 05:36:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232750AbjGJJfn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 10 Jul 2023 05:35:43 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8A16E7F
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jul 2023 02:34:26 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fc0aecf15bso16130105e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jul 2023 02:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688981665; x=1691573665;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DIkNJXrfeAXdU6LyOguKwi2Z7Ylg4KQ+PIrj1Vet5Bo=;
        b=H3ctb6FEJbcH3zCNxTLZj1KJckXm68BTXHywjITt6N1wHwTBE8YWA1jawWv/shu6S+
         NT9PuJTCLHSZ4+vWYdacAZi8xWpKhSNR8nxOlO+M2pf2ndY3OfkVMglR65alBcDFssaO
         BEphrGjmuuhmHMpbP7I0ke1YXQZ8GXHGaGUbbLyiyq4JwAjp64FWvYlsYzBAt5/85FO2
         eeYh0ME0af5rcPK4EYeLLIurICOtTgmFHS/I7PlZXjSTsjf+nC4OCIlW6b+YMkppuWAZ
         gBxa7E/hHhC+3QCBrJdM1z26wCirTkBIL15YTp5yX2ICtrjgCIXCLGEKgbtbThZ2uxp5
         lgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688981665; x=1691573665;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DIkNJXrfeAXdU6LyOguKwi2Z7Ylg4KQ+PIrj1Vet5Bo=;
        b=M8Zgz4ts7nl5Zsvw7J5VkApWWzfODCypHxpyJ9ne1jRJeookchLghcLe9hBaayFV6n
         p6g3PUcSy/OqhNm7AkU7oaW+QRuMpJnMPKUFdjpPAUk3z34Nh2CmOsqM9pb3JDftRlLr
         3lGYLeUAzl6mHtle3+qZDAa2kFJxqe7CcHD2HhezDcd/XMmdCKy/MpaIdOiyeNIEf/pq
         YK3kjld8Fu3vHz2KAewQ1WX2hPwAeblKCS4Tkc/1gQwg0u9oW3DaNdk3+MHsaV0i35UL
         6M8rDZxvyuW25zLSfv2BkSo6rE9mJYmBCUTC6Vrd6aY+VtfG63gFDBl3l/03mAjd5n5G
         iusQ==
X-Gm-Message-State: ABy/qLb+hjHrxzqvVFfCuBzWs8NoVRO1n1EYSTKH7X0k2KhuYy9K14uC
        F5khoBaoWbTLa0gmAC5nrSt7Iw==
X-Google-Smtp-Source: APBJJlHfQ+vP9gLJf9Y0ooi1WF/rziyDZkixdQqDwNlNcdLXuvSUKme2SFNVFWekSyhEZEVhq2Wjhw==
X-Received: by 2002:a1c:e902:0:b0:3fb:1b78:38d2 with SMTP id q2-20020a1ce902000000b003fb1b7838d2mr12750353wmc.4.1688981665022;
        Mon, 10 Jul 2023 02:34:25 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l20-20020a7bc354000000b003fbb8c7c799sm9840084wmj.30.2023.07.10.02.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 02:34:22 -0700 (PDT)
Date:   Mon, 10 Jul 2023 12:34:19 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Will Deacon <will@kernel.org>, joro@8bytes.org
Cc:     Dan Carpenter <error27@gmail.com>,
        Jacob Pan <jacob.jun.pan@linux.intel.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Kevin Tian <kevin.tian@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, iommu@lists.linux.dev,
        kernel-janitors@vger.kernel.org, joro@8bytes.org
Subject: Re: [PATCH] iommu/sva: fix signedness bug in iommu_sva_alloc_pasid()
Message-ID: <5574a5bc-e108-4206-b189-03ec79bc08ec@kadam.mountain>
References: <6b32095d-7491-4ebb-a850-12e96209eaaf@kili.mountain>
 <5e474464-34ee-414a-8eb3-b11e74540b14@kadam.mountain>
 <20230710092713.GA32673@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230710092713.GA32673@willie-the-truck>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jul 10, 2023 at 10:27:14AM +0100, Will Deacon wrote:
> On Fri, Jul 07, 2023 at 10:17:23AM +0300, Dan Carpenter wrote:
> > Ping!
> 
> Ah, Joerg isn't on CC. Fixing that now...
> 

Sorry!  I use a script to send patches and for a while if the patch had
a Fixes tag then my script would remove the top name listed from
get_maintainer.pl.  Doh!

I should probably resend this?

regards,
dan carpenter

