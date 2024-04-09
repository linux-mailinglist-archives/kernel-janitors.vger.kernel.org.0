Return-Path: <kernel-janitors+bounces-2456-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0C189E405
	for <lists+kernel-janitors@lfdr.de>; Tue,  9 Apr 2024 21:58:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B402C1F23FB6
	for <lists+kernel-janitors@lfdr.de>; Tue,  9 Apr 2024 19:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E330C1581F7;
	Tue,  9 Apr 2024 19:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="srgfZWEA"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527ED15749A;
	Tue,  9 Apr 2024 19:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712692686; cv=none; b=N6Wk0laEtizAplkzl7j0zZAAb0enMQ5jXkiqRyzM9Vztu50N2dTVqmgMeweELvJR4UMdzmKkAn9mhhSVl299jPM7kpitziOjrhSVBf41h4UxcwvZftIqYqZ0cy2of5R8bbby5HIazGE91LzFMSQMIAf4/GsAuqu+w/yr9VJ3c48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712692686; c=relaxed/simple;
	bh=HzgPkZPw2z1ERgPdsNJAyFRp+HZZ0u3M/9+9ly4OOhk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W5WNVl5fDxD4Jgg8Kt/kGtCDBF+UbksTssFemCrWeTK8LkrXqDJb6LRjGKzOm5T7T6tm3DAXhL3tRyC8X/2GSL7gQzvpYWiahvqS+HF4pzIGWtuzfUK74lrANmlkfoW5i5ZdCu7AHEZAUepJxnfqjPt2REKgyKmAc64VYrSesgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=srgfZWEA; arc=none smtp.client-ip=80.12.242.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id uHaJrwPbhvXmnuHaJrcB6G; Tue, 09 Apr 2024 21:56:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1712692608;
	bh=rtMLf6UwvmJ8a7YW2yYVIRV61rIPwyz3XYXSfkz9AGU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=srgfZWEAbkmKKpnFVj7u8C0Z948g4rrMkUmAsmKX0VI+62OBfb5p932FdT+yTVTTb
	 2aIDyiUQh+WGGAXuy+i7NuWotkjvnGgng4dwRquRYehqm+3NprgMYgvW6/45zONhXX
	 8QKlBfJrLe1kQDyg+dsRhQ2rDi9RCKS4pdf4Bxh2ugvSkxBPwNbOLYaTO05sUvBUHX
	 F6Hdo4beplrx7yo5MZdxeFhn0NcrdCG0sU4LfdVTQKHmzFngRkjLmi8jbbIigTE8s4
	 3f3MNR1pf4YksJBDWnQSQPRIw9TFk3smEd+PDJn1MASpRVvjekCeKFEdd3RoBGFLnr
	 cTOEr2BcKF1EA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 09 Apr 2024 21:56:48 +0200
X-ME-IP: 86.243.17.157
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-pm@vger.kernel.org
Subject: [PATCH] thermal: k3_bandgap: Remove some unused fields in struct k3_bandgap
Date: Tue,  9 Apr 2024 21:56:43 +0200
Message-ID: <206d39bed9ec6df9b4d80b1fc064e499389fc7fc.1712687420.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In "struct k3_bandgap", the 'conf' field is unused.
Remove it.

Found with cppcheck, unusedStructMember.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

Apparently, it has never been used. It is not a left-over from a
refactoring.
---
 drivers/thermal/k3_bandgap.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/thermal/k3_bandgap.c b/drivers/thermal/k3_bandgap.c
index e88192d2afea..2a703770fc91 100644
--- a/drivers/thermal/k3_bandgap.c
+++ b/drivers/thermal/k3_bandgap.c
@@ -78,7 +78,6 @@ static const int k3_adc_to_temp[] = {
 
 struct k3_bandgap {
 	void __iomem *base;
-	const struct k3_bandgap_data *conf;
 };
 
 /* common data structures */
-- 
2.44.0


