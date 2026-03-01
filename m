Return-Path: <kernel-janitors+bounces-10239-lists+kernel-janitors=lfdr.de@vger.kernel.org>
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFRFB8hnpGlcfgUAu9opvQ
	(envelope-from <kernel-janitors+bounces-10239-lists+kernel-janitors=lfdr.de@vger.kernel.org>)
	for <lists+kernel-janitors@lfdr.de>; Sun, 01 Mar 2026 17:22:32 +0100
X-Original-To: lists+kernel-janitors@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D211D09AE
	for <lists+kernel-janitors@lfdr.de>; Sun, 01 Mar 2026 17:22:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 71FA93013854
	for <lists+kernel-janitors@lfdr.de>; Sun,  1 Mar 2026 16:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F4330F7F3;
	Sun,  1 Mar 2026 16:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="cBXl3qaJ"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E0B175A6C;
	Sun,  1 Mar 2026 16:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772382140; cv=none; b=C1F51nsGTFy/8s7U2HCFpdAEUBpsBgop+Du0sU1IkX9hXNtOuvtqN3Bo9ClmH7VwCDhF3kjjSaJi98bDxCrGrmkbvlLzAqbCffuBX+aBVqGeeGOmnR19wynS0khh2t075oL7bTbU//4GRC+tbKE3z0lRhGNgA0fCPoWbgB9n2ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772382140; c=relaxed/simple;
	bh=+EFaN8ukVl2jbon2CP+tjXmZpNoO68XrGZDN1hGeeDc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GkW7tvsy1bCgLE226YFNuB92IUD6D0nw8CIqHUP44gov4BnfA/Ry0cZ/s9KurCX0oxvN2ocppAY8saL/xrLkAgpHd1+m0Y+n+O/6jXBHtVEJaMyFPyW+rTvmBKbojvsHsEdusDRCAhPvWcV0nooLRi1uEPuoO8Qqqn/cNuizW5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=cBXl3qaJ; arc=none smtp.client-ip=80.12.242.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPSA
	id wjXVvgvwZrKIuwjXVvxE5w; Sun, 01 Mar 2026 17:21:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1772382066;
	bh=ZDU6YEmeKfV0DZTfQRWPUrC0979+SE4F08nNSXKB+Rw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=cBXl3qaJB63B45EjFaVLtaEMsSamPxFhByNIgYPTgYFgmSON8X/UUgQNg64hh/H4j
	 IgNLkQj8avGmaSvnjhYtEAHOiCfWoq7pQQF3Q1HWXI5zdupSU42eeZBfCDufBD7yri
	 wVYaDVGx1owXInYbbJVk3Hu5ZhwOVnnRowAqGuTewtkBTtJqvkgDJLFmF+SmBCMYqo
	 8c6W2IETu6BFBEj2s65kc94Aw+hQ5Vv12/6xptjN9vsOFdA/qThREfY7/EXZTzl0xF
	 kYJcUJongu+PD9SyKiWJrixnC1kWZHG7E8umBOUkGkkOmUw5N4s6+0V+5iqid8NvbV
	 NDba2IlekOFnQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 01 Mar 2026 17:21:06 +0100
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Eddie James <eajames@linux.ibm.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa@kernel.org>,
	"Oliver O'Halloran" <oohall@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH] i2c: fsi: Fix a potential leak in fsi_i2c_probe()
Date: Sun,  1 Mar 2026 17:21:01 +0100
Message-ID: <fd805c39f8de51edf303856103d782138a1633c8.1772382022.git.christophe.jaillet@wanadoo.fr>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[wanadoo.fr:s=t20230301];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[linux.ibm.com,kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-10239-lists,kernel-janitors=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,wanadoo.fr,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[wanadoo.fr];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christophe.jaillet@wanadoo.fr,kernel-janitors@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[wanadoo.fr:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[kernel-janitors];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 95D211D09AE
X-Rspamd-Action: no action

In the commit in Fixes:, when the code has been updated to use an explicit
for loop, instead of for_each_available_child_of_node(), the assumption
that a reference to a device_node structure would be released at each
iteration has been broken.

Now, an explicit of_node_put() is needed to release the reference.

Fixes: 095561f476ab ("i2c: fsi: Create busses for all ports")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/i2c/busses/i2c-fsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 82c87e04ac6f..b2dc5ae1d0e4 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -729,6 +729,7 @@ static int fsi_i2c_probe(struct fsi_device *fsi_dev)
 		rc = i2c_add_adapter(&port->adapter);
 		if (rc < 0) {
 			dev_err(dev, "Failed to register adapter: %d\n", rc);
+			of_node_put(np);
 			kfree(port);
 			continue;
 		}
-- 
2.53.0


