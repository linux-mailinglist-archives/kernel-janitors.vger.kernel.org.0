Return-Path: <kernel-janitors+bounces-5673-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE93598A02D
	for <lists+kernel-janitors@lfdr.de>; Mon, 30 Sep 2024 13:21:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71CA21F21EA0
	for <lists+kernel-janitors@lfdr.de>; Mon, 30 Sep 2024 11:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D31F18DF62;
	Mon, 30 Sep 2024 11:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="Dx1h3Jcr"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC2518A948;
	Mon, 30 Sep 2024 11:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727695297; cv=none; b=IL5pmcMvvsnRl3FU8NYNYsiFq/TK7/eF8pisql1M+DT7FOY13mxGx8Fs3Y81gmoIqcxqpFI4TGbDIRIeoFVU9GuYnvYofvnEYUaDD3eFudcRv4ZrHtneeP7NsOUuJwcuPbmkW+UKJ7hHs54pWPNrtYfYzI4PFghl432GagYZV64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727695297; c=relaxed/simple;
	bh=n1JOm71HR+/h2E/GBfc4P5DyXBreHp5k5MSp54kYLtg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qWbYHVrrZFGky8gUFpOMlNdsXQe44GuAYBigKnhhaGkfTENbmuyq1CIbEeDISer55vgHsGfXwGplpalQKjLzmOVG7FVkvKLuAtw+JEJVIm1GxJ30rJsEMTPZWYRKoJ+6Hz/3BJ7e6iwLW5aAmOKX0oQBCUPbOVUjEO9nF9lt9XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=Dx1h3Jcr; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m1K2e1v8eA7zyau+k+mv5AjQIDyIY2ickueHj6rrgVk=;
  b=Dx1h3JcrezOB3aw8YIX1IwoBaLmFS2Te2wEg4O5IfP8vtvzy53CHFbsV
   hhkDEY76T1UQ+KlEnNP6Ioz7eOu/xXD0BB9OJob5RQbUsciCQI2FClps8
   p+IZAjwU1u4Ku+1vkseeDgbQTRSYwYFQa5AeAYnlvnkUb/ywRlQF7owS/
   8=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.11,165,1725314400"; 
   d="scan'208";a="185956870"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 13:21:26 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org
Subject: [PATCH 02/35] resource: Reorganize kerneldoc parameter names
Date: Mon, 30 Sep 2024 13:20:48 +0200
Message-Id: <20240930112121.95324-3-Julia.Lawall@inria.fr>
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
 kernel/resource.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/resource.c b/kernel/resource.c
index 2d266b5ff881..7242909795be 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -1993,8 +1993,8 @@ get_free_mem_region(struct device *dev, struct resource *base,
  * devm_request_free_mem_region - find free region for device private memory
  *
  * @dev: device struct to bind the resource to
- * @size: size in bytes of the device memory to add
  * @base: resource tree to look in
+ * @size: size in bytes of the device memory to add
  *
  * This function tries to find an empty range of physical address big enough to
  * contain the new resource, so that it can later be hotplugged as ZONE_DEVICE


