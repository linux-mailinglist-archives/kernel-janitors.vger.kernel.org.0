Return-Path: <kernel-janitors+bounces-1392-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7545683330D
	for <lists+kernel-janitors@lfdr.de>; Sat, 20 Jan 2024 08:02:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7C871C21B53
	for <lists+kernel-janitors@lfdr.de>; Sat, 20 Jan 2024 07:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADA9153A0;
	Sat, 20 Jan 2024 07:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="YiMuukR6"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-14.smtpout.orange.fr [80.12.242.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D84A1FD2
	for <kernel-janitors@vger.kernel.org>; Sat, 20 Jan 2024 07:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705734149; cv=none; b=Ak3lfeuBVjDbjw1k0fQ6zWR1ExSi0VUOfz9WFpjnh7rX8SoYSVno7jOK9Js3P1U7LJGROmoY06nXTgQtdIV8JB44E08WCF3Hh1faC57hzIjQ+To/V9T3BJSSwlghDNYVJNjN8vV0WwrReYPFs+qgaUlO+2t/EI5UiVcfICVsEnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705734149; c=relaxed/simple;
	bh=+raE6lOGseWsvkEpBBecN/MtD9iAHPDNgahekW3q5GU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=saOmkyCIoeR/J+ye3VP+FHBbViS/kStBqDhPODfRWaO+aUpqZxXmDZccjQc3gjfMUawxL3w/FYASZhaiflwh+uTmL6pemBXPe9JsmzXGgvc+nIX9Vl1i2OC0KYpGWGFu09lzDuo9rgw7UEurpqSbU931BWrOYg0Vi02TCrjz0pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=YiMuukR6; arc=none smtp.client-ip=80.12.242.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id R5N0rXUqwgeksR5N0rlBX4; Sat, 20 Jan 2024 08:02:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1705734144;
	bh=18XLp0+EYYrAsuDVOy2pHg/nOe1su8/7QeJJlWWEvhU=;
	h=From:To:Cc:Subject:Date;
	b=YiMuukR6dGihg1Gp7l16Aam7/wZ7d2LC+OC01I779DK7RYfMMrugmalINYjN/lSWH
	 hNYAqPISCeG8kZRyNAJW46GlAf0LOHCXOmvuITWTFRyC4qwHl+EI1PCyqYDWhDB0RE
	 WMX99n5JDI8qDZgYxYPWIzP9SpphFKt3Dlnf6afAmm9i1ltQoWjgaE+SjhjB8cQVnu
	 3h/rlrqEXkffCK3f3RWo4t34Ytk/qh07RQeDh6BOPaA43AYWKtlYvCFSkhxTcYCvEP
	 QnBqFncfz+7iJ/RJ4NlLj9tEDNCyNdOYHE1ejbCOEOthmSwSzUahUVZc1axPngRjbh
	 2+8MFBNdLsdWQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 20 Jan 2024 08:02:24 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH net-next] xdp: Remove usage of the deprecated ida_simple_xx() API
Date: Sat, 20 Jan 2024 08:02:20 +0100
Message-ID: <8e889d18a6c881b09db4650d4b30a62d76f4fe77.1705734073.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ida_alloc() and ida_free() should be preferred to the deprecated
ida_simple_get() and ida_simple_remove().

Note that the upper limit of ida_simple_get() is exclusive, but the one of
ida_alloc_range() is inclusive. So a -1 has been added when needed.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 net/core/xdp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/core/xdp.c b/net/core/xdp.c
index 4869c1c2d8f3..27b585f3fa81 100644
--- a/net/core/xdp.c
+++ b/net/core/xdp.c
@@ -75,7 +75,7 @@ static void __xdp_mem_allocator_rcu_free(struct rcu_head *rcu)
 	xa = container_of(rcu, struct xdp_mem_allocator, rcu);
 
 	/* Allow this ID to be reused */
-	ida_simple_remove(&mem_id_pool, xa->mem.id);
+	ida_free(&mem_id_pool, xa->mem.id);
 
 	kfree(xa);
 }
@@ -242,7 +242,7 @@ static int __mem_id_cyclic_get(gfp_t gfp)
 	int id;
 
 again:
-	id = ida_simple_get(&mem_id_pool, mem_id_next, MEM_ID_MAX, gfp);
+	id = ida_alloc_range(&mem_id_pool, mem_id_next, MEM_ID_MAX - 1, gfp);
 	if (id < 0) {
 		if (id == -ENOSPC) {
 			/* Cyclic allocator, reset next id */
@@ -317,7 +317,7 @@ static struct xdp_mem_allocator *__xdp_reg_mem_model(struct xdp_mem_info *mem,
 	/* Insert allocator into ID lookup table */
 	ptr = rhashtable_insert_slow(mem_id_ht, &id, &xdp_alloc->node);
 	if (IS_ERR(ptr)) {
-		ida_simple_remove(&mem_id_pool, mem->id);
+		ida_free(&mem_id_pool, mem->id);
 		mem->id = 0;
 		errno = PTR_ERR(ptr);
 		goto err;
-- 
2.43.0


