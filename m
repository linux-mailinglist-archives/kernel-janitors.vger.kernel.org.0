Return-Path: <kernel-janitors+bounces-4918-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E489479E0
	for <lists+kernel-janitors@lfdr.de>; Mon,  5 Aug 2024 12:31:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE911B22EE8
	for <lists+kernel-janitors@lfdr.de>; Mon,  5 Aug 2024 10:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01E3A157460;
	Mon,  5 Aug 2024 10:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="kriIqqh2"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from msa.smtpout.orange.fr (out-70.smtpout.orange.fr [193.252.22.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACCE157491
	for <kernel-janitors@vger.kernel.org>; Mon,  5 Aug 2024 10:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722853807; cv=none; b=HPZ2NczJqvdL28/tI7dPsUgaIUuwkYe9kfYZlnRbUIaHYcjYsFWI6qVvl0vnMV8iRKMlIfCzEGZ8WZb4E6qLgw/loN2m7c1wM1zS9QiGMZU9rGvP/X5cQJj4ftJLAQ32pixE/3/6iYDfGLuopqRz2vIRQ/JKghBalwCFsa2YEnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722853807; c=relaxed/simple;
	bh=WM4jDsNl88icLtOhSZc2z02eEcUwms+W5Nt3XUgfBA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e8TC44DcRFWBJhMmwO+xrjDsYfr5NeZ7Txa3FloHI7P//60A0pgPp4tY7wZBLv2oE4c3X5YKqb8HiYSz/TH+N2JX3Cv5TDx9/lRKXtivrPRvrMEJ4L7MxWTAh7G2pDJ98Ql5QazJsIrxYMV5L51fbBMMbgxPdnqProzGWk75RhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=kriIqqh2; arc=none smtp.client-ip=193.252.22.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id auyPsh8Id6NRTauybsps9S; Mon, 05 Aug 2024 12:30:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1722853805;
	bh=SUPvmmO6LqCQ5AJ+3l+Xza8HDESgMwZoQBA6LVUiG6Y=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=kriIqqh2bjejAkv2YmddnEc0Y4ilI3Oz9+o896mHu/UmgG34i37XlCUGmgJBCJKY+
	 7Nx1UNUqr3mKPSgDFgAzj0KALd2FGAv9NWF16moXTKyZ24nytpJD1ZZ2yv5rieCf20
	 BSyRL5QCZ5i1BDZ1wwBc6XITuqwkPKziCioYcsxpHfXffY+cObAvFgYrlche/TVshv
	 kKkgnTILIeJlvPEKTJkuDvXXovt90EOd9WLtU1qAvjgLUCRFfWK5NyPCPJIBdGnk74
	 d8NYE2cKJhkVFYmDemegMJnJ+AuVEzjhZnFx8m6xs4jgUZ5y2NnPJfJOcRTDTaZrVY
	 owXjzL7fktMkA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 05 Aug 2024 12:30:05 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: willy@infradead.org,
	srinivas.kandagatla@linaro.org
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 3/3] nvmem: Update a comment related to struct nvmem_config
Date: Mon,  5 Aug 2024 12:29:49 +0200
Message-ID: <10fd5b4afb1a43f4c4665fe4f362e671a729b37f.1722853349.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1722853349.git.christophe.jaillet@wanadoo.fr>
References: <cover.1722853349.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update a comment to match the function used in nvmem_register().
ida_simple_get() was replaced by ida_alloc() in commit 1eb51d6a4fce
("nvmem: switch to simpler IDA interface")

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Changes in v2:
  - No chnages

v1: https://lore.kernel.org/all/032b8035bd1f2dcc13ffc781c8348d9fbdf9e3b2.1713606957.git.christophe.jaillet@wanadoo.fr/
---
 include/linux/nvmem-provider.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index 3ebeaa0ded00..9a5f262d20f5 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -103,7 +103,7 @@ struct nvmem_cell_info {
  *
  * Note: A default "nvmem<id>" name will be assigned to the device if
  * no name is specified in its configuration. In such case "<id>" is
- * generated with ida_simple_get() and provided id field is ignored.
+ * generated with ida_alloc() and provided id field is ignored.
  *
  * Note: Specifying name and setting id to -1 implies a unique device
  * whose name is provided as-is (kept unaltered).
-- 
2.45.2


