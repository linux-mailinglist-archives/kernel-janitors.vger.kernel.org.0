Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6016F72B8E9
	for <lists+kernel-janitors@lfdr.de>; Mon, 12 Jun 2023 09:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234959AbjFLHmn (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 12 Jun 2023 03:42:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235126AbjFLHmf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 12 Jun 2023 03:42:35 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2EEE19B5
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Jun 2023 00:42:01 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-30aea656e36so2631493f8f.1
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Jun 2023 00:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686555640; x=1689147640;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tnCxW0itTMo6yA3XNQbbmF8xoq0kbOuc9xf7ZwUXCgc=;
        b=oD3jLd9Ms4CANQ7cIYYHpm24DsqzeQCTDZg94yHVmsn9dVx/r5QOk53sPovi+MRYqm
         O/I6JQ7dVMJ6UJJiqK6RMcp4xMNphRo+M6fMoeKTNkxqwooLiy1JsN+nJf2FdbRZJcqF
         yoa7eW3/1ANpV0lBD94Qoy1XnoxDxwPRFy1R9Oo6bbOmfeZnwHttczdVAsxqOiKQuKPg
         oe6ux8BqJceE1pBD6qtNq7ycDN6wPXHpnQAuMgNTFcWy+K/kwBXTJVbz9H4GMfxGnxVW
         +BU2tJY4OPgdeQrnRP6Dx4G+Tp/mpQ/HE2K9WOmKiXlAyxjznt7TnV8zpSBd3Bq4LRaP
         yqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686555640; x=1689147640;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tnCxW0itTMo6yA3XNQbbmF8xoq0kbOuc9xf7ZwUXCgc=;
        b=A5tYmlEcpAdHM3ekc4s4hZfQqwQCeydcNq5XAuzWrB+EPTN334IjrAzt5mi1N7G/VV
         Dkhfg09Vir1R8kMNVg+bNq3/aOGsbax7SFxSo9UF4962OqeG8XJoCiTbzMN/85ii71uy
         yGflidkYpsrQsK7SEQFAWd72B1cuJarDEyOugZxPtFW6uvMG+99zkt9giKynSG/RpvVa
         LocfI3t7guL1o657CkRq+vARhT+Nitz0J+VCVcHxYDEzVOulH14cQ8DYo7nl92ixfDv2
         bcw1kdtKs5HezcwuJhgf+6DF2m20n5UDk+cqE5C71f1mvNdiEQg/7RkXZmXa61MFULhC
         u4sw==
X-Gm-Message-State: AC+VfDyzs4WGmde4WvXeQ8TlTizJRR3K6eSuk4zUuXOWksrmaDDn3Ui2
        3s8OwXhyBOSi4xCSFkDoW4chvjCUrS8y1lTiDt8=
X-Google-Smtp-Source: ACHHUZ4pmw8BWg0wWjjye8G9cWexophtsTqyab55gNCps5/WPk8Yrdx2UsNUrSaI5OFSkNxilzQIDQ==
X-Received: by 2002:a7b:c8da:0:b0:3f7:e8fc:678d with SMTP id f26-20020a7bc8da000000b003f7e8fc678dmr5977585wml.13.1686553672137;
        Mon, 12 Jun 2023 00:07:52 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e13-20020a05600c218d00b003f709a7e46bsm10317708wme.46.2023.06.12.00.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 00:07:50 -0700 (PDT)
Date:   Mon, 12 Jun 2023 10:07:46 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Marc Zyngier <maz@kernel.org>,
        Christoffer Dall <christoffer.dall@arm.com>
Cc:     Oliver Upton <oliver.upton@linux.dev>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] KVM: arm64: timers: Fix resource leaks in
 kvm_timer_hyp_init()
Message-ID: <e0dd820f-52d2-4c54-97f3-5aa02e0bd6e0@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Smatch detected this bug:
    arch/arm64/kvm/arch_timer.c:1425 kvm_timer_hyp_init()
    warn: missing unwind goto?

There are a couple error paths which do not release their resources
correctly.  Fix them.

Fixes: 9e01dc76be6a ("KVM: arm/arm64: arch_timer: Assign the phys timer on VHE systems")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 arch/arm64/kvm/arch_timer.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index 05b022be885b..c2df8332d2bd 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -1422,7 +1422,7 @@ int __init kvm_timer_hyp_init(bool has_gic)
 		if (err) {
 			kvm_err("kvm_arch_timer: can't request ptimer interrupt %d (%d)\n",
 				host_ptimer_irq, err);
-			return err;
+			goto out_free_irq;
 		}
 
 		if (has_gic) {
@@ -1430,7 +1430,7 @@ int __init kvm_timer_hyp_init(bool has_gic)
 						    kvm_get_running_vcpus());
 			if (err) {
 				kvm_err("kvm_arch_timer: error setting vcpu affinity\n");
-				goto out_free_irq;
+				goto out_free_ptimer_irq;
 			}
 		}
 
@@ -1443,6 +1443,10 @@ int __init kvm_timer_hyp_init(bool has_gic)
 	}
 
 	return 0;
+
+out_free_ptimer_irq:
+	if (info->physical_irq > 0)
+		free_percpu_irq(host_ptimer_irq, kvm_get_running_vcpus());
 out_free_irq:
 	free_percpu_irq(host_vtimer_irq, kvm_get_running_vcpus());
 	return err;
-- 
2.39.2

