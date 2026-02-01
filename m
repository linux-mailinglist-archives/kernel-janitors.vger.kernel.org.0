Return-Path: <kernel-janitors+bounces-10088-lists+kernel-janitors=lfdr.de@vger.kernel.org>
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oB4iLtFmf2mwpgIAu9opvQ
	(envelope-from <kernel-janitors+bounces-10088-lists+kernel-janitors=lfdr.de@vger.kernel.org>)
	for <lists+kernel-janitors@lfdr.de>; Sun, 01 Feb 2026 15:44:33 +0100
X-Original-To: lists+kernel-janitors@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BEDC63AF
	for <lists+kernel-janitors@lfdr.de>; Sun, 01 Feb 2026 15:44:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AECF230071E1
	for <lists+kernel-janitors@lfdr.de>; Sun,  1 Feb 2026 14:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D7B350D4C;
	Sun,  1 Feb 2026 14:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=ljfogelstrom.se header.i=@ljfogelstrom.se header.b="ujHWMwRU"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from ljfogelstrom.se (ljfogelstrom.se [217.154.245.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF0A3FC9
	for <kernel-janitors@vger.kernel.org>; Sun,  1 Feb 2026 14:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.154.245.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769957069; cv=none; b=f7p1x2HMONOipox5sA657C7LFfyx3+Vp1ZJRGqY9kKnF1S7/rXxEe47hUtOUqFCkQwR88sDO+bbt1FbGiTbHZSBp/uhReTah+NOzvImYG/WaxZCPpkUxAu+MMqEMFG/EXKXop9A+Ji1VGJ4+e8JKSmVVduYDKEHQdjLdMOMbAE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769957069; c=relaxed/simple;
	bh=UVfnwWShyBggTLKnmQH4EAC+mNsM/omfk2f1X219k9E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RuS+NPbRDZfne98zacpPf6W6U+O7WaFx/2JMJWGtIRjoNXjz7X4ilBfZW0NSyQ70ONw1XIwfzwQTVJ9X12iXlnm8VlI4QG54fCBLNVqWO4iehKc7kgdRM7CS9dcERP4B6aruSt+IvQjNyuA6qTjawjJPn+TEU+6oKVAeF511vKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ljfogelstrom.se; spf=pass smtp.mailfrom=ljfogelstrom.se; dkim=temperror (0-bit key) header.d=ljfogelstrom.se header.i=@ljfogelstrom.se header.b=ujHWMwRU; arc=none smtp.client-ip=217.154.245.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ljfogelstrom.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ljfogelstrom.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ljfogelstrom.se;
	s=1024; t=1769957065;
	bh=UVfnwWShyBggTLKnmQH4EAC+mNsM/omfk2f1X219k9E=;
	h=From:To:Cc:Subject:Date;
	b=ujHWMwRUVjPnSjJJ0s01ZfpaGjZW6ToX/S5OollWUHc4VZ5dk5gKAXijuUL8SK6Q1
	 xjUXNkGbN9lmSimafhDtpowXpPS3EFuPmszgopv7HJXpFXgiPZlTcGE2syoJ2uPOyi
	 A5hgSUuWLytkIqSXkZ0/IhhPqZHdpi8Be4WljAdg=
Received: by ljfogelstrom.se (Postfix, from userid 0)
	id 5878D23FFA; Sun, 01 Feb 2026 14:44:25 +0000 (UTC)
From: root <info@ljfogelstrom.se>
To: shuah@kernel.org,
	skhan@linuxfoundation.org,
	kernel-janitors@vger.kernel.org
Cc: LJ Fogelstrom <info@ljfogelstrom.se>
Subject: [PATCH] selftests/filesystems/mount-notify: fix unused result compiler warning
Date: Sun,  1 Feb 2026 14:43:17 +0000
Message-ID: <20260201144416.1637814-1-root@ljfogelstrom.se>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ljfogelstrom.se,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ljfogelstrom.se:s=1024];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10088-lists,kernel-janitors=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ljfogelstrom.se:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[info@ljfogelstrom.se,kernel-janitors@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[kernel-janitors];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ljfogelstrom.se:email,ljfogelstrom.se:dkim,ljfogelstrom.se:mid]
X-Rspamd-Queue-Id: 15BEDC63AF
X-Rspamd-Action: no action

From: LJ Fogelstrom <info@ljfogelstrom.se>

Compiling with GCC emits Wwarn-unused-result for these two
statements, so they are now wrapped in an assert similar to the rest of
the code.

(Apologies for sending this twice; I am new and missed to include the
maintainers the first time)

Signed-off-by: L. J. Fogelstrom <info@ljfogelstrom.se>
---
 .../selftests/filesystems/mount-notify/mount-notify_test.c      | 2 +-
 .../selftests/filesystems/mount-notify/mount-notify_test_ns.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c b/tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c
index 6381af6a40e3..a3ffc07d26e4 100644
--- a/tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c
+++ b/tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c
@@ -464,7 +464,7 @@ TEST_F(fanotify, rmdir)
 	ASSERT_GE(ret, 0);
 
 	if (ret == 0) {
-		chdir("/");
+		ASSERT_EQ(chdir("/"), 0);
 		unshare(CLONE_NEWNS);
 		mount("", "/", NULL, MS_REC|MS_PRIVATE, NULL);
 		umount2("/a", MNT_DETACH);
diff --git a/tools/testing/selftests/filesystems/mount-notify/mount-notify_test_ns.c b/tools/testing/selftests/filesystems/mount-notify/mount-notify_test_ns.c
index 320ee25dc8a5..0e85e49cb259 100644
--- a/tools/testing/selftests/filesystems/mount-notify/mount-notify_test_ns.c
+++ b/tools/testing/selftests/filesystems/mount-notify/mount-notify_test_ns.c
@@ -491,7 +491,7 @@ TEST_F(fanotify, rmdir)
 	ASSERT_GE(ret, 0);
 
 	if (ret == 0) {
-		chdir("/");
+		ASSERT_EQ(chdir("/"), 0);
 		unshare(CLONE_NEWNS);
 		mount("", "/", NULL, MS_REC|MS_PRIVATE, NULL);
 		umount2("/a", MNT_DETACH);
-- 
2.52.0


