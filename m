Return-Path: <kernel-janitors+bounces-484-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8693B7FBCE4
	for <lists+kernel-janitors@lfdr.de>; Tue, 28 Nov 2023 15:40:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 411B8282CD6
	for <lists+kernel-janitors@lfdr.de>; Tue, 28 Nov 2023 14:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C24E5ABA2;
	Tue, 28 Nov 2023 14:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q4KjlMdx"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66F59D4C
	for <kernel-janitors@vger.kernel.org>; Tue, 28 Nov 2023 06:40:03 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-332ca7f95e1so3877064f8f.0
        for <kernel-janitors@vger.kernel.org>; Tue, 28 Nov 2023 06:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701182402; x=1701787202; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pf2DfL3Xh784BuSAN82jj5QlQKywpWu+Wh7+Xy6CbRs=;
        b=Q4KjlMdxTapkbOb2ioTBUKEAMM7mscUzFNvl3IAywCoIfG02lqJK80lq+VHdm//JGf
         JX2d69F9/hLq216t5NI151MiQ2IJg57vE2zhNSc7F2BE+eTSgIDcLd9vsNkF5pqQGR2y
         6Dcv353IlXNpTW35MLzdf4JK8uvEhJFSe6QzHfMVCtJFVvrMfNJdRsdRB8QbKp7+v0Bp
         K2QYm99Idl60pHeSvrHeLaYr21n4urgY31MaErZ8cY+Lwc11/li5F4jx6IdihmfQU34W
         Ed94XFQr1VLlnj2flMInPylulZqAiS1jg1ngVhcN3wEtq8QthlFsxYWgdKIQx3ncZdPU
         3Yww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701182402; x=1701787202;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pf2DfL3Xh784BuSAN82jj5QlQKywpWu+Wh7+Xy6CbRs=;
        b=iwMgrlCJtIE/DdLn/m+Vf/134v1fbWwy8zqG8IAFl4pMGvFD/eH9Vu0cc9yK9ah5DP
         3ULSaPDXVuGj+y/yFz0n0AcrqBQN0wSM60hpgbiak8FZpH+6dcTuBKFvCi5jYZxeSB8/
         /pJZF6js3a+dUpvn0wmo+Hyj3Wl9bJuKUrZzUbwMoV3Lh8AznxG3T94qURP6i6Ejdtqq
         dChUroiNHGqjlbzJXs4ctxkHyRcqWNomXlkdMpYAYi2zdhqZltECUpNiXqHYqOCGDuo5
         RGxrBz25RoL339VM9cMhtRJSnw76BzpB0yX0SkIDU9QA9U1m5V8SsCEz6zDyOYInNYZB
         1nCQ==
X-Gm-Message-State: AOJu0YysC9GFAa7D/iqEIF+ld5ceZTmzawTiebSehe6Kxs804pXUrULk
	TxZG5AGwI/vBxew2mb6fm4T4G0yo9dwKbp+Bs2EqT5MU
X-Google-Smtp-Source: AGHT+IGYMuSYtzC3hhgkKzrn7uQuIfeDdduNP779y1aGb9C8fmBYxztzj7SxI0lLQ+DhL8H4tStW1Q==
X-Received: by 2002:a5d:484c:0:b0:32f:80cf:c3cd with SMTP id n12-20020a5d484c000000b0032f80cfc3cdmr11478470wrs.4.1701182401913;
        Tue, 28 Nov 2023 06:40:01 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t6-20020a05600001c600b00332ff21038fsm6730985wrx.106.2023.11.28.06.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 06:40:01 -0800 (PST)
Date: Tue, 28 Nov 2023 17:39:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: Jackson Lee <jackson.lee@chipsnmedia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] media: chips-media: wave5: remove duplicate check
Message-ID: <9bdce1f1-b2f0-4b11-9dfd-16ca7048281b@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We already verified that "ret" is zero a few lines earlier.  Delete this
duplicate check.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/platform/chips-media/wave5/wave5-hw.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-hw.c b/drivers/media/platform/chips-media/wave5/wave5-hw.c
index 3fcb2d92add8..f1e022fb148e 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-hw.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-hw.c
@@ -578,9 +578,6 @@ int wave5_vpu_dec_init_seq(struct vpu_instance *inst)
 	dev_dbg(inst->dev->dev, "%s: init seq sent (queue %u : %u)\n", __func__,
 		p_dec_info->instance_queue_count, p_dec_info->report_queue_count);
 
-	if (ret)
-		return ret;
-
 	return 0;
 }
 
-- 
2.42.0


