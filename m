Return-Path: <kernel-janitors+bounces-5705-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFFC98A09B
	for <lists+kernel-janitors@lfdr.de>; Mon, 30 Sep 2024 13:29:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8BB09B27895
	for <lists+kernel-janitors@lfdr.de>; Mon, 30 Sep 2024 11:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D36E19C567;
	Mon, 30 Sep 2024 11:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="oawkM+uW"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCB6199EB1;
	Mon, 30 Sep 2024 11:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727695320; cv=none; b=X3BoibYlph2aAUAsXxPpKUzgpTXVA3MDzrw+8lFMW0dhyeSF6EO2SINTd7KRaJp6ynaz8TqlSagSTeFx3G4yv7IL5xFJ6LtwduVIMpV1SJJGxI16WAwC5ALfYSMh7Hhitba3or6/cMcV/X3eGu9VbK3L1KxIQkbuCec9Si2sR/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727695320; c=relaxed/simple;
	bh=rfFmGNnDAH23u6kgfulRPaCFamPZ42rj7AhC1dGVmdo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kGRrki9JpYf5euFKZe1557wLfZf+987ySrnJB3n4z2v0goVK3maOkRCwwXO8RVUU9wc0iZw2KvngoudF8OST/X28Hw9fGfU74wU2anBGK0r89ZR+yvU69ELHWputzQKigpLo+33w71HTSyCVdH6PbIfMtD+IsXbB6/Mfw8iJlTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=oawkM+uW; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=As21i+AYjH6I558pmvLKybWqR5DdPiZUU5tIGJp5RUA=;
  b=oawkM+uWrPYVpcryQLmmlZ6Cpu5y/dtCHipEMNE+nKGP5h8xi6tEmG7N
   rpr/T7cfvmpLK4gAOtUIfc5Z+2H5pLojqtnVyWrgYXF9lfH1GktO8JJGT
   fuOw8y8HCGbHzrD5LBrMpfNLQGWgQGoyKFMJkv345Z+fIdUMrth1pnMla
   0=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.11,165,1725314400"; 
   d="scan'208";a="185956914"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 13:21:28 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel-janitors@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 32/35] mm/mmu_notifiers: Reorganize kerneldoc parameter names
Date: Mon, 30 Sep 2024 13:21:18 +0200
Message-Id: <20240930112121.95324-33-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240930112121.95324-1-Julia.Lawall@inria.fr>
References: <20240930112121.95324-1-Julia.Lawall@inria.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorganize kerneldoc parameter names to match the parameter
order in the function header.

Problems identified using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 mm/mmu_notifier.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
index fc18fe274505..dd29b96f924a 100644
--- a/mm/mmu_notifier.c
+++ b/mm/mmu_notifier.c
@@ -956,9 +956,9 @@ static int __mmu_interval_notifier_insert(
 /**
  * mmu_interval_notifier_insert - Insert an interval notifier
  * @interval_sub: Interval subscription to register
+ * @mm: mm_struct to attach to
  * @start: Starting virtual address to monitor
  * @length: Length of the range to monitor
- * @mm: mm_struct to attach to
  * @ops: Interval notifier operations to be called on matching events
  *
  * This function subscribes the interval notifier for notifications from the


