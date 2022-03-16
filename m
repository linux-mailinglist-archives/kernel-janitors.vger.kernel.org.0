Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 066924DAF51
	for <lists+kernel-janitors@lfdr.de>; Wed, 16 Mar 2022 13:03:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348091AbiCPME5 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 16 Mar 2022 08:04:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355550AbiCPME4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 16 Mar 2022 08:04:56 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6CAF2FFF4
        for <kernel-janitors@vger.kernel.org>; Wed, 16 Mar 2022 05:03:42 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id o8so91423pgf.9
        for <kernel-janitors@vger.kernel.org>; Wed, 16 Mar 2022 05:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:in-reply-to:references:subject:message-id:date
         :mime-version:content-transfer-encoding;
        bh=JiHN7XmRS+SYUBCPe0gyRHWbAjMuvrxUE+WC4hwwzho=;
        b=mVFCpnF7/RjX3aFaOy68GwNb1uCu+IOpemvKwOMBGAdGNTa6b2Tl8LnON4jx9z+k/F
         RjAGDXcysLfBeu4nhhiuIMM8L9xMRNR+ubM5qHCBmunYJnCLMxJ+xR7roIznNxIO2G4J
         0HoFYeWINC3cnRAbUALy2Tih+AFX+J/3HfPXuMRTUG1R1P+OIAUzVBX6FNeu3NbnVvc6
         u7k2eM7A6cVjQbtHaap0sZvPOKlo7Rbp7q/A5MB81p2TPN8ZBPjeigrlK5mAyndIICp9
         EWrEfM3oCKCHlsnQYTSymbDBYHP/BRA9UFhz9r2bu73k9y7yGf65EBlVWEt4SadM1Z9/
         TLHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
         :message-id:date:mime-version:content-transfer-encoding;
        bh=JiHN7XmRS+SYUBCPe0gyRHWbAjMuvrxUE+WC4hwwzho=;
        b=8KxdtHrpqsJKQ5c9w25BxIkSfapLEfxwUheAYbLIwA2A9Thb1Bl5ry7wAFK7aavB0R
         2ffCVTpnUFS2P4bABNli0IOatAO2cr6Z0veQOJvf6SQOf6yQSxocZ80thfwiFK+I+19K
         FkmiXJpyUl2DTiycJG2qoHXrSFnqg/Db+T0tT+F40T1Fy9W1AnMn68FYl6VNgMKDufA3
         s9t3UwlWtZpF4gbr2Vf2xR0CsAlkLh/GZhztQHRLwjr5Ybs6jmpfWROi2SUtZqQeyDtx
         RgxNUHdhBi3hNIx3pyIjFWwVgS18LIHmOqizFAwkAxVsEOphj69lGcclC4W5XrJ+zCTk
         CR3A==
X-Gm-Message-State: AOAM533ptM9UGbrPMaKa709AAa29MCF73PaI9RtmyRZa/E9HmSy2rgQn
        PgIFc/zl/aYtLuNOJWsvWlXh/JydNvF0JroQ
X-Google-Smtp-Source: ABdhPJw7Oqt0Ocr9gLniQbQHuiSK7XmA5wve7pII903vkazHvPbwm34ZrzTu+sLQZ0Ht85z9P2gpNA==
X-Received: by 2002:a63:2a43:0:b0:376:4b9:f7e0 with SMTP id q64-20020a632a43000000b0037604b9f7e0mr27737461pgq.437.1647432222004;
        Wed, 16 Mar 2022 05:03:42 -0700 (PDT)
Received: from [127.0.1.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id q16-20020a056a00151000b004f7cdeddfffsm2916424pfu.115.2022.03.16.05.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 05:03:41 -0700 (PDT)
From:   Jens Axboe <axboe@kernel.dk>
To:     Colin Ian King <colin.i.king@gmail.com>,
        linux-block@vger.kernel.org,
        Paolo Valente <paolo.valente@linaro.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <20220315221539.2959167-1-colin.i.king@gmail.com>
References: <20220315221539.2959167-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] block/bfq-iosched: Fix spelling mistake "tenative" -> "tentative"
Message-Id: <164743222101.14148.17065709710229801081.b4-ty@kernel.dk>
Date:   Wed, 16 Mar 2022 06:03:41 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 15 Mar 2022 22:15:39 +0000, Colin Ian King wrote:
> There is a spelling mistake in a bfq_log_bfqq message. Fix it.
> 
> 

Applied, thanks!

[1/1] block/bfq-iosched: Fix spelling mistake "tenative" -> "tentative"
      commit: 8ef22dc4a7cbef5870e612edfbf9cd058ddaaa50

Best regards,
-- 
Jens Axboe


