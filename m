Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8C9B6E794C
	for <lists+kernel-janitors@lfdr.de>; Wed, 19 Apr 2023 14:06:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232403AbjDSMGU (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 19 Apr 2023 08:06:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230141AbjDSMGS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 19 Apr 2023 08:06:18 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFD95E5C
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Apr 2023 05:06:17 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f18123d9f6so2576005e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Apr 2023 05:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681905976; x=1684497976;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0SGp6UegVJWx6aR3RC/PZCyw5QeN9ZGCt9AfUp7rqBw=;
        b=E2qSge/3RG3k2oRg5faHcELod1zVFt2vIz4MIWnoRKRdktrusPXSwMXFKkSeDEjgtk
         jpnKMocder88erLaDhGIkk1/K+ZtZTuP6zyhR8TKRhXKDonjglvgMYpnCH4Ks6tFXwh6
         axOqyKCePso53Qo6aMymCSO33oOjfvworzd1gRfwYihIoKkhbrRmbqfOTjSrQYZKpfp4
         HMj/cUREvFIvXUCJaq9LZNG2uLDMQQ2iXVpLbIzwDDEEfh0rpDcmXKiD6/B3V/iZqqGH
         m3A7ff5GTaRrBCqmzfb5918IlxFdlfr0KLfn79ehd6PwCvg/VxV+pvLv8BqUHme/FiKf
         mnTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681905976; x=1684497976;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0SGp6UegVJWx6aR3RC/PZCyw5QeN9ZGCt9AfUp7rqBw=;
        b=RrVD3pNjQdJensZxcQc5t7Yi3vAdabBS5hHVspTLFBBfBeNtdxDnGajsFs08qKrKuk
         Z50xo/0Cw+gC0gZGyEt7NfxII8dJrdEV7olGAwOoQCZtuLRFXa/gLXXn/tgRCWdZY41e
         GgkbUrZs2RwchRVAr5ofbvXldXrq4fbTJuCjPVaARp1tzcEIWiARioiuKxT6a9xpzSWC
         C9vZZSP4rHKVTkbSeSkpKaZLLsZ+hWP8uO8fHXdtrqomC1wzoInyoC3yK6uk14awshQP
         AFE5yUC6PG3vHFm55DgOUBg1EIx6KJ4F0INWlrGkrRCIc/7gi0xOoFcmVjXm2qmG3aVb
         +NxQ==
X-Gm-Message-State: AAQBX9e+LmQHjBKy2RCpfVLXQiM/ZosqloFu+szu2XpgHXU/OpotU6uh
        nekOMgGTaNrEaHuq3Ik0btBooA==
X-Google-Smtp-Source: AKy350biUA6SKhQarBStU1/9S3mFeGVO3Bt/tsD8dekKvDbR3BFxcT0EtVXfsJ8w1cJOBiraYJ9VDA==
X-Received: by 2002:adf:fa8b:0:b0:2ee:fc1b:b7ba with SMTP id h11-20020adffa8b000000b002eefc1bb7bamr4329401wrr.39.1681905976289;
        Wed, 19 Apr 2023 05:06:16 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s9-20020a05600c45c900b003f092f0e0a0sm3280775wmo.3.2023.04.19.05.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 05:06:15 -0700 (PDT)
Date:   Wed, 19 Apr 2023 15:06:12 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Andre Przywara <andre.przywara@arm.com>,
        Oliver Upton <oliver.upton@linux.dev>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Eric Auger <eric.auger@redhat.com>,
        Steven Price <steven.price@arm.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] KVM: arm64: Fix buffer overflow in
 kvm_arm_set_fw_reg()
Message-ID: <cfb3114d-d7d4-4f1f-82e6-7f5a9024ed7c@kili.mountain>
References: <4efbab8c-640f-43b2-8ac6-6d68e08280fe@kili.mountain>
 <861qkgkt06.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <861qkgkt06.wl-maz@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Apr 19, 2023 at 12:31:53PM +0100, Marc Zyngier wrote:
> Thanks for the fix. In the future, please Cc me on KVM/arm64 patches

Sorry Marc, that wasn't intentional at all.  I don't know what happened.
I have a script that I use send patches and it messed up both times.  I
will investigate and fix.

regards,
dan carpenter

