Return-Path: <kernel-janitors+bounces-252-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C71A77E9C60
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 Nov 2023 13:47:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 095FF1C208A8
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 Nov 2023 12:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CF671D6A4;
	Mon, 13 Nov 2023 12:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eraibkIo"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015251C6A5
	for <kernel-janitors@vger.kernel.org>; Mon, 13 Nov 2023 12:47:34 +0000 (UTC)
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EF54D7E;
	Mon, 13 Nov 2023 04:47:33 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5446c9f3a77so6848103a12.0;
        Mon, 13 Nov 2023 04:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699879651; x=1700484451; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gI+IXBV+qpvJ7bjdWxUIsbkCiBzZ5O6FKXwTdFM3SRM=;
        b=eraibkIoka4RsWhXT/VuLpMqmKSnMQIZTbpeXTuIARVG2etpRxGi94pxzOWWz893yT
         cEF1i+FdJCDbb+7CQ1RgUkJYXC8bYMf+wLVZsqjzl539YOcCoyq068/rM+UC+I5Nh0Mz
         vsXbsY4irZCaazP+VIGzbSXaKgEH2+IXVhugmhmzI+aE4VfYWBvXdifdpnRVV0OEWT4D
         zLEj22yOKoBEVWe4P27B20m1VckA/5bSaS5W/hHz2VzA/IlpwL/Jx303FXiBcAeKmpbR
         lv3rxq/YWTXqpnaH1OQ8NWClZ+HBtTVwPRXJRhcwnqjotXyFJDIwnbJP/K1NOMxQWg/a
         RRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699879651; x=1700484451;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gI+IXBV+qpvJ7bjdWxUIsbkCiBzZ5O6FKXwTdFM3SRM=;
        b=C7rXEU0cyuuZjARygYmAl1faoahhgqZ6lh1S8fDKUabPh3XMsrjxHs8hsxwz5AKF6I
         d+abrZ0gwRgAxu83MffGf9hkqZifCo2zC3W+dzi0JHV3mmVoJ3SAVyosuc7kNEYqto6o
         UbCJU1h77pVdhrCEm8WuzzH5Fx5bAte4ABLO9DWghgkxzJ0tm5iflv1VIMDXze+/42bD
         3vC+x9BbbU4IrqHI3zDWAEeXhGrXSE+3lqAVx6bTLVIV2kAhfDzBCKuSjFzx72H1KVaL
         8si8EHK07B0njYd9I0FfC7j63ggbfhcFM2W6pwR2l80kWYPzwugycNaP8zlkF2eoNInt
         61fw==
X-Gm-Message-State: AOJu0Yw8JWTsG6F2AtE34PI6PwURgBTweLWAH17imd68jepGA/ur2RyT
	Dz/BLQBQFYHKFLU+9ZTlrbE=
X-Google-Smtp-Source: AGHT+IHbwahlfNhfkHJ8gKKKfnq9f/xQ9hlrwf5bhtgfIFyKxaS8hg1JuXDeqkmVwLGGOP2FkPmM8Q==
X-Received: by 2002:a17:906:32d9:b0:9cc:97b:5a15 with SMTP id k25-20020a17090632d900b009cc097b5a15mr4312892ejk.64.1699879651148;
        Mon, 13 Nov 2023 04:47:31 -0800 (PST)
Received: from felia.fritz.box ([2a02:810d:7e40:14b0:d4a9:adca:9d2f:e54c])
        by smtp.gmail.com with ESMTPSA id ck20-20020a170906c45400b0099ce188be7fsm3976519ejb.3.2023.11.13.04.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 04:47:30 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-mm@kvack.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] mmap: remove the IA64-specific vma expansion implementation
Date: Mon, 13 Nov 2023 13:47:28 +0100
Message-Id: <20231113124728.3974-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>

With commit cf8e8658100d ("arch: Remove Itanium (IA-64) architecture"),
there is no need to keep the IA64-specific vma expansion.

Clean up the IA64-specific vma expansion implementation.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 mm/mmap.c | 37 +------------------------------------
 1 file changed, 1 insertion(+), 36 deletions(-)

diff --git a/mm/mmap.c b/mm/mmap.c
index 1971bfffcc03..72a3bdea4fa4 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2207,42 +2207,7 @@ struct vm_area_struct *find_extend_vma_locked(struct mm_struct *mm, unsigned lon
 }
 #endif
 
-/*
- * IA64 has some horrid mapping rules: it can expand both up and down,
- * but with various special rules.
- *
- * We'll get rid of this architecture eventually, so the ugliness is
- * temporary.
- */
-#ifdef CONFIG_IA64
-static inline bool vma_expand_ok(struct vm_area_struct *vma, unsigned long addr)
-{
-	return REGION_NUMBER(addr) == REGION_NUMBER(vma->vm_start) &&
-		REGION_OFFSET(addr) < RGN_MAP_LIMIT;
-}
-
-/*
- * IA64 stacks grow down, but there's a special register backing store
- * that can grow up. Only sequentially, though, so the new address must
- * match vm_end.
- */
-static inline int vma_expand_up(struct vm_area_struct *vma, unsigned long addr)
-{
-	if (!vma_expand_ok(vma, addr))
-		return -EFAULT;
-	if (vma->vm_end != (addr & PAGE_MASK))
-		return -EFAULT;
-	return expand_upwards(vma, addr);
-}
-
-static inline bool vma_expand_down(struct vm_area_struct *vma, unsigned long addr)
-{
-	if (!vma_expand_ok(vma, addr))
-		return -EFAULT;
-	return expand_downwards(vma, addr);
-}
-
-#elif defined(CONFIG_STACK_GROWSUP)
+#if defined(CONFIG_STACK_GROWSUP)
 
 #define vma_expand_up(vma,addr) expand_upwards(vma, addr)
 #define vma_expand_down(vma, addr) (-EFAULT)
-- 
2.17.1


