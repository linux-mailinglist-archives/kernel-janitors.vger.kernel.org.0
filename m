Return-Path: <kernel-janitors+bounces-6741-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0299FB952
	for <lists+kernel-janitors@lfdr.de>; Tue, 24 Dec 2024 05:44:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6140163972
	for <lists+kernel-janitors@lfdr.de>; Tue, 24 Dec 2024 04:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 723E414A617;
	Tue, 24 Dec 2024 04:44:23 +0000 (UTC)
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id D811D3EA76;
	Tue, 24 Dec 2024 04:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735015463; cv=none; b=gqp0BqGtf4FPWHNKtqvexD8e3/8UdkXgzQdkckPvN0GJaMqypOkAT4YNNy9xhvW+q3YgSuUECBnZH6h39zSuIev3ouDWo3kcgd1WVeLRDkGeCrIF1zztVcjigCvSdgg5zXZdJqMDnDAfmCuW6g0+lPrDQE6hewJGO7fC7jB7No8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735015463; c=relaxed/simple;
	bh=L1bNjLdDDNiP/yjZ/+aS4/J5iAh2QDaOO7KMYaS2AXE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=nTq9aRZBHcLiC72fYmsJdbZNiJqLc2vmBPHZy2Tc/i3x9kTZFolPU7CMvJMFWssxWzur8XkNWDRbK25fhiMywaJLAZV/xtDsty/FODiXaw+h7gK/MXsvp1TEIM1eQFOIkpuZLb6zB4uv17vt4qpDU4/DgyV4DtI7NYmHTQi2dLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id DDC3A60234D86;
	Tue, 24 Dec 2024 12:44:13 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: tj@kernel.org,
	jiangshanlai@gmail.com
Cc: Su Hui <suhui@nfschina.com>,
	matthew.brost@intel.com,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] workqueue: add printf attribute to __alloc_workqueue()
Date: Tue, 24 Dec 2024 12:43:58 +0800
Message-Id: <20241224044357.727530-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix a compiler warning with W=1:
kernel/workqueue.c: error:
function ‘__alloc_workqueue’ might be a candidate for ‘gnu_printf’
format attribute[-Werror=suggest-attribute=format]
 5657 |  name_len = vsnprintf(wq->name, sizeof(wq->name), fmt, args);
      |  ^~~~~~~~

Fixes: 9b59a85a84dc ("workqueue: Don't call va_start / va_end twice")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 kernel/workqueue.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 8b07576814a5..0c752812ae09 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -5641,6 +5641,7 @@ static void wq_adjust_max_active(struct workqueue_struct *wq)
 	} while (activated);
 }
 
+__printf(1, 0)
 static struct workqueue_struct *__alloc_workqueue(const char *fmt,
 						  unsigned int flags,
 						  int max_active, va_list args)
-- 
2.30.2


