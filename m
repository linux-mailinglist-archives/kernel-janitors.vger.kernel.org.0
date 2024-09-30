Return-Path: <kernel-janitors+bounces-5703-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAC398A097
	for <lists+kernel-janitors@lfdr.de>; Mon, 30 Sep 2024 13:29:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 020F61F25A10
	for <lists+kernel-janitors@lfdr.de>; Mon, 30 Sep 2024 11:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D0519ADB6;
	Mon, 30 Sep 2024 11:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="ZdwSKBn5"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B73B19925D;
	Mon, 30 Sep 2024 11:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727695319; cv=none; b=OkB142PUu8O150fBDQGeDJEtmQ08iWj8lX7ekKgcJe+kGhR3bX/oLMP1PFHcEMUrtg6lOJFA1zOELHRbO5RD63L14t3S6gqZ6t37cnIKhSfxyJ8p9unBPuDOpk9X0JsvI/i2gcx0ScdoN2kdoUjZAtLevQAKKzfN5XBV4ZUxEF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727695319; c=relaxed/simple;
	bh=cQVGGq5xQOiRJgIv8/0eVuPLYc+ntYYQOa3eK7PlFn8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rfMqdmOvYarbOsY2FwufSY6eKp8o3LB0s80l82PR7Uc0PtRcR3c7Zd5WEj5MHpEcyNmp5q95wnEiDOerTeKymyRbMPa6gehAL/00gdaYaBkKu4x6a7Mtxx4wZ0qiOVLDvZObrZ4eWxKjWvc9JWxkccE4K9KwLwU7b/qR3b4EuPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=ZdwSKBn5; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UVwqg9pSLhRbnrHgL5k+5dBK/PrMq/KHM37Icoezd/0=;
  b=ZdwSKBn5snaHNt5KRSYKxd2+0XuNlbB5QiNmgqtZyqBSloro/wGyWGHc
   8UHHvnowXQA8HP9/if4H9vdzCXibWmWMdEhz9b/wBaSGCQR5gAqfhygnY
   aNy2yEIUS9yv55H+EWtZfK+5LFcVsnv/TrGNqJMAtmezbsu1La+qswK1B
   U=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.11,165,1725314400"; 
   d="scan'208";a="185956913"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 13:21:28 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: kernel-janitors@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 31/35] slimbus: messaging: Reorganize kerneldoc parameter names
Date: Mon, 30 Sep 2024 13:21:17 +0200
Message-Id: <20240930112121.95324-32-Julia.Lawall@inria.fr>
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
 drivers/slimbus/messaging.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/slimbus/messaging.c b/drivers/slimbus/messaging.c
index 242570a5e565..e7aa9bd4b44b 100644
--- a/drivers/slimbus/messaging.c
+++ b/drivers/slimbus/messaging.c
@@ -13,8 +13,8 @@
  *
  * @ctrl: Controller handle
  * @reply: Reply received from the device
- * @len: Length of the reply
  * @tid: Transaction ID received with which framework can associate reply.
+ * @len: Length of the reply
  *
  * Called by controller to inform framework about the response received.
  * This helps in making the API asynchronous, and controller-driver doesn't need


