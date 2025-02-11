Return-Path: <kernel-janitors+bounces-7046-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C70BEA3013D
	for <lists+kernel-janitors@lfdr.de>; Tue, 11 Feb 2025 03:01:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91F7C3A5DE2
	for <lists+kernel-janitors@lfdr.de>; Tue, 11 Feb 2025 02:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804E622087;
	Tue, 11 Feb 2025 02:01:27 +0000 (UTC)
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id D6D4226BD8B;
	Tue, 11 Feb 2025 02:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739239287; cv=none; b=O8J/qhhdKGDdNRdTMGfWwckmSzLeT6ijfWK43EIn548BRqD6YJXWSjf9rP+tP2KE1DrW/H77KO6inUd9RhAx3wjuxtPQHOASNHUkUoQqXej8idXypNUqlqZX6zAVl/xncZobn63fEbnN3GTN+W94haQIA3iKwhqDkw7I8iZc0DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739239287; c=relaxed/simple;
	bh=3ax8vtqSe9pTLglNHy6vFAddA/Wf6iiGjIJ5CuYXdik=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=tgFHA6vc8hc94OYMbEJPHJRVlU6gAKVjqD36tJGNC/Gp5ssSsmOvIZ+nGH+nQ0eTwL7wUrancb9GHRsJc5o+cxc0XIJXCSt107CTZPNFfBZ+4k697ilMzCh7WhSCSFGwvy2FgThg4QbOEpQrPZ7hI2JCUSxmWSHs2iCGz7XIImg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id A0DBA602A7271;
	Tue, 11 Feb 2025 10:01:19 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: jacek.lawrynowicz@linux.intel.com,
	min.ma@amd.com,
	lizhi.hou@amd.com,
	ogabbay@kernel.org
Cc: Su Hui <suhui@nfschina.com>,
	quic_jhugo@quicinc.com,
	George.Yang@amd.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2] accel/amdxdna: Add missing include linux/slab.h
Date: Tue, 11 Feb 2025 09:53:55 +0800
Message-Id: <20250211015354.3388171-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When compiling without CONFIG_IA32_EMULATION, there can be some errors:

drivers/accel/amdxdna/amdxdna_mailbox.c: In function ‘mailbox_release_msg’:
drivers/accel/amdxdna/amdxdna_mailbox.c:197:2: error: implicit declaration
of function ‘kfree’.
  197 |  kfree(mb_msg);
      |  ^~~~~
drivers/accel/amdxdna/amdxdna_mailbox.c: In function ‘xdna_mailbox_send_msg’:
drivers/accel/amdxdna/amdxdna_mailbox.c:418:11: error:implicit declaration
of function ‘kzalloc’.
  418 |  mb_msg = kzalloc(sizeof(*mb_msg) + pkg_size, GFP_KERNEL);
      |           ^~~~~~~

Add the missing include.

Fixes: b87f920b9344 ("accel/amdxdna: Support hardware mailbox")
Signed-off-by: Su Hui <suhui@nfschina.com>
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
---
v2:
 - move the header to the include block above and keep it sorted(Jacek Lawrynowicz).

 drivers/accel/amdxdna/amdxdna_mailbox.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
index 814b16bb1953..e5301fac1397 100644
--- a/drivers/accel/amdxdna/amdxdna_mailbox.c
+++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
@@ -8,6 +8,7 @@
 #include <linux/bitfield.h>
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
+#include <linux/slab.h>
 #include <linux/xarray.h>
 
 #define CREATE_TRACE_POINTS
-- 
2.30.2


