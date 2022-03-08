Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 146A24D1518
	for <lists+kernel-janitors@lfdr.de>; Tue,  8 Mar 2022 11:48:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345790AbiCHKto (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 8 Mar 2022 05:49:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343543AbiCHKtn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 8 Mar 2022 05:49:43 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BA8231231
        for <kernel-janitors@vger.kernel.org>; Tue,  8 Mar 2022 02:48:47 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id t11so27821269wrm.5
        for <kernel-janitors@vger.kernel.org>; Tue, 08 Mar 2022 02:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=oePfju4fJo1u0s2xutLmdABPmoZWfyejObfpQ2SykO4=;
        b=Kvw4rYX1l2sThJBvtCbIACTNXs1/EIDUO7KiaORWiPElVea4Aug/UYOTP+zjI/JyJK
         27zrtK+BkR4xPR0hwcDn0ewK9C/ltgfxEuBhpij0ZOFUwYpQpp12I2BXFpv2fB8mjRDN
         UJV+7o0cMfCQTraeALyQd2k0q9tinPQA9Rk4gNS2DeucN6mxnz61dnJ0pbmqdvMi8Pmw
         687pFuRIOXgKHJO++mTRgs0kINcItgyzAazm2Kp66ihf5JJYF8X9dU7hImFdFRDTphTz
         B8puYe7LgWXVqP+6wEsz4XGPfSyn+/pVJnxRBuLUAZEyU65MRd35xVsEVGq7A+V+9FQj
         zDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=oePfju4fJo1u0s2xutLmdABPmoZWfyejObfpQ2SykO4=;
        b=DwsjYi680vgf7wMJV0yRiB+MAbLnoE3PI6/NXVizG/ohjsRXtoNfzXvmgenz8i5Vsa
         XcBzxM+Hp59sbEeawannq8Zs5GpzstgtVOPfAJi9abuuzrkNthkww7Gts4n+ehBPFoZs
         opFmUIy8S6L8a3LVK8NWsyqSXaygIrm58FacQBkN+mUTq+2necROKnkhTSpe+DrQdAaW
         BoTQ3pvrrpyToUV6Vi3Qm8pB/v//OtRhyvpr7MXj2J4DbYlXhfV8vxT8QpD0r3eoiRQp
         MdbCzjXpgr2tdgOccXIKogT/FTHE4YG8o1/PxBFRxd1HoZAj379lGTpEclPKBuRzgLzf
         woWg==
X-Gm-Message-State: AOAM532K7IZtV6cdCbeDPDEJpKvusQcw32vmB5/PV01TmQlZIANawuxp
        m9YsU7rFD+Kmj8Dc4gr9NhKmH8W8zTzFhTcr
X-Google-Smtp-Source: ABdhPJzJ87arojJYxVBgmLEfJTdVqi9wnz2y1QmFwmq0HFgSG6F6XH8GI/oU72rHX3ZHD0Ni89Qz0w==
X-Received: by 2002:adf:80d0:0:b0:1dc:90a8:4a1d with SMTP id 74-20020adf80d0000000b001dc90a84a1dmr11506035wrl.180.1646736525957;
        Tue, 08 Mar 2022 02:48:45 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id r12-20020a05600c2c4c00b003816932de9csm1823380wmg.24.2022.03.08.02.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 02:48:45 -0800 (PST)
Date:   Tue, 8 Mar 2022 10:48:43 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org
Subject: Re: [PATCH] backlight: backlight: Slighly simplify
 devm_of_find_backlight()
Message-ID: <Yic0i9DFzv3bWoTz@google.com>
References: <f998a4291d865273afa0d1f85764a9ac7fbc1b64.1644738084.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f998a4291d865273afa0d1f85764a9ac7fbc1b64.1644738084.git.christophe.jaillet@wanadoo.fr>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, 13 Feb 2022, Christophe JAILLET wrote:

> Use devm_add_action_or_reset() instead of devm_add_action()+hand writing
> what is done in the release function, should an error occur.
> 
> This is more straightforward and saves a few lines of code.
> 
> While at it, remove a useless test in devm_backlight_release(). 'data' is
> known to be not NULL when this function is called.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/video/backlight/backlight.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
