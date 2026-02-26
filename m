Return-Path: <kernel-janitors+bounces-10231-lists+kernel-janitors=lfdr.de@vger.kernel.org>
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBQCH/a2oGnClwQAu9opvQ
	(envelope-from <kernel-janitors+bounces-10231-lists+kernel-janitors=lfdr.de@vger.kernel.org>)
	for <lists+kernel-janitors@lfdr.de>; Thu, 26 Feb 2026 22:11:18 +0100
X-Original-To: lists+kernel-janitors@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0221AF7FB
	for <lists+kernel-janitors@lfdr.de>; Thu, 26 Feb 2026 22:11:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B419730B9DD8
	for <lists+kernel-janitors@lfdr.de>; Thu, 26 Feb 2026 21:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62103472794;
	Thu, 26 Feb 2026 21:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="mCtjL7eH"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-14.smtpout.orange.fr [80.12.242.14])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FF847277D;
	Thu, 26 Feb 2026 21:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772140001; cv=none; b=JdvP51r7D5BWbUNczfZ5nm1QO11JzqKaUOc0z8/Bzj532hVhRQTQlsx8OZc6Zbu80MeDFSEKdDjCLlF5/L317ZMBwC79euUyO1fa41vCyhWsHy9beMGfLM39jvzbpvjrb9Q0gdvTK4Zpw9pS6/AjLYk/NvG2O5NhI+qaXpE/gYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772140001; c=relaxed/simple;
	bh=OTverRsJf3zRrZm8xLDRYc8nbCvn9xgjenOwfuanfpM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cs0I47/2IXU/DSKg2PSNh5/CNUGyQzsOpkavH6Xws2Un6lMF1wNHIcMo5H/H2qzE0vAibR01KAUlLtyw9RMLp2uqFkSVgAs9DQdCmG2cq9MeB1PcTUcij8oDdSfM7NLbYTP73upX69HfUyu5xJCItymFznw3K6A/4upkiTZo7jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=mCtjL7eH; arc=none smtp.client-ip=80.12.242.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPSA
	id viY3viyNVADIAviY4vHEFP; Thu, 26 Feb 2026 22:05:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1772139930;
	bh=1OETAWCs24Uv+jRKuDOfg+migguacq1G5+KDrHSlOgA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=mCtjL7eHdhOo6qFv9fL/7cJIfHk7TR59qZWYkv1mWCZPkXtUQKRIta/yJasPeeHuw
	 w3JSJdw3p9y1bmXbMQckfozCv7e+0Nx6zgOKEzUoDnQGHr11f+yBKlYBygq2uEr48v
	 RGXIXbTrei3Mano+CcfeqCs9R+f9YnpGgzzam6pBvymU6JsVoDIszUYIBhlRyLJB3K
	 y9ke2gU1hcjXGdOgybG9H4MiNHrqpzDjXoqAM4K2x2/B2SvTJ0jCkUWy6sFhGawSL8
	 Y3OrmLQSOKkG7/DF+bOoH4gTJMRtXU4CBHLPcZOVmtHocaCYVhNUg3N6q2OwwPikuU
	 9Ps/h4ladgtYw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 26 Feb 2026 22:05:30 +0100
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	iommu@lists.linux.dev
Subject: [PATCH] iommufd: Constify struct dma_buf_attach_ops
Date: Thu, 26 Feb 2026 22:05:21 +0100
Message-ID: <67e9126bbffa1d5c05124773a8dd4a3493be77ac.1772139886.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[wanadoo.fr,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[wanadoo.fr:s=t20230301];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,wanadoo.fr,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-10231-lists,kernel-janitors=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christophe.jaillet@wanadoo.fr,kernel-janitors@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[wanadoo.fr:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[kernel-janitors];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[wanadoo.fr];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0A0221AF7FB
X-Rspamd-Action: no action

'struct dma_buf_attach_ops' is not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increases overall security, especially when the structure holds some
function pointers.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  81096	  13899	    192	  95187	  173d3	drivers/iommu/iommufd/pages.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  81160	  13835	    192	  95187	  173d3	drivers/iommu/iommufd/pages.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.
---
 drivers/iommu/iommufd/pages.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
index 8124c554f2cc..9bdb2945afe1 100644
--- a/drivers/iommu/iommufd/pages.c
+++ b/drivers/iommu/iommufd/pages.c
@@ -1450,7 +1450,7 @@ static void iopt_revoke_notify(struct dma_buf_attachment *attach)
 	pages->dmabuf.phys.len = 0;
 }
 
-static struct dma_buf_attach_ops iopt_dmabuf_attach_revoke_ops = {
+static const struct dma_buf_attach_ops iopt_dmabuf_attach_revoke_ops = {
 	.allow_peer2peer = true,
 	.invalidate_mappings = iopt_revoke_notify,
 };
-- 
2.53.0


