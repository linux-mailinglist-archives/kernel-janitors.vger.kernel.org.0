Return-Path: <kernel-janitors+bounces-6161-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DD59AB4D4
	for <lists+kernel-janitors@lfdr.de>; Tue, 22 Oct 2024 19:17:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 831381F245D1
	for <lists+kernel-janitors@lfdr.de>; Tue, 22 Oct 2024 17:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E45C81BCA14;
	Tue, 22 Oct 2024 17:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Q1kmPONG"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E68C6EB7C
	for <kernel-janitors@vger.kernel.org>; Tue, 22 Oct 2024 17:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729617459; cv=none; b=gM933WJq/Ld5xdem9YPpBaoHMeMTQXcbXIa9Rp0khDOLmIHeikdZPcZW0QCjwx1wCc3yTWIx5SMLc4Ox78b9wWIF2E6BVtZKXm8zyoxiEC3evKvTnZTC4leZ48RLpEU1gpk3DmI7MH0Sm9WK23egNjqLfZEebu0ZHbh4LLAx2cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729617459; c=relaxed/simple;
	bh=4f40dfBoHxEpPr6RULcDzDS5/7/zM+/MBm/SCblIAUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZBK62559ARa4nFMQbExN+SUehQ7kPbkoXcayvCxkmcy/2YR/ogJM5gXdHZW8uxbczTcdOB+ZsqlAMBtr1afoHSV5hWJfWk8RXqKcihgt5df6NTYBK7T+NSNi74dKfaQeaabWK8HuWUI9vURZ1Z1mVfntzEx0s0GHDvfITyUWRYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Q1kmPONG; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37d462c91a9so4244985f8f.2
        for <kernel-janitors@vger.kernel.org>; Tue, 22 Oct 2024 10:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729617455; x=1730222255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnlqVZ4BO/KcWRbWj4X5jgmlgSPyqQsEw0oozV3PjCg=;
        b=Q1kmPONGUltIFv5UnUQSPTJGSMqyWAEQXqocG5vXrPPdK3IR3u94L8cerM1wILwHds
         0X3NcrdMvFY2JShFYBrh0fwVNX10ZuPYF/y30Xpy6fwJgfPnTaj6xdigYPUONqnICTf/
         Gmml5DoTninZ/irJTm1vyq/mrICSx0RDrcsDIiYeyFjvOjB1Mbaz9n7p/gRJvcpbYIL6
         0FVoQl1F5zVbLyjdGbN7Yhf8Gxolq6vaTVQwn0SoDabCN1FygKhu9unPk+dxmF5jeD2G
         LAc8PSpSbH281M6QsyJT5c2sZRZfOAQiTAwmKQ113EWosoQvtWWEpA8NYj4vybrHCEbN
         opoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729617455; x=1730222255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bnlqVZ4BO/KcWRbWj4X5jgmlgSPyqQsEw0oozV3PjCg=;
        b=d4p4i6vV+fPOQm4lJmdV1jNXEhJIio+vWM+B7s7Td3N49wyDULIdfojoQDnFmJD0Jt
         xZ+zfGx9V8MeHDk9IZhoJ4wA4f+mXCg7LWT5N96ElyzsW4mmBoNt0XncgCO04bfUnmvD
         0KI8MSfX+qJLOEq+j+xanOqX4CRuH33mFnrX94Kes683ByiB1C7SZCbSNC6T31wya4dx
         vTrpQ7B/y+oPPn2QeNTkubyqPoIsLr2/R3x2Q3ijgDRdVDUbjhqYJIai3WF1ykm/V7NB
         gzxYahCDdUh+hjP+OFo3LF2+Y0TUO9WzYcLXHvPcTTWm3a3gMGbELXNV6vZKpEFbtAYq
         4n7g==
X-Forwarded-Encrypted: i=1; AJvYcCXuh2zOGwbAYpVPQcYCR/4U9D/5S3mf/W7yyNBz2IDjPeaIZE1RWvMcWOWl0RQogj2Fkgr2B0urtpnE0SoiAFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYXZ5W9pWP9yFWM1bguYD6r9uiuMGhJvNK/HomgpHlLURMyVTF
	Sy7mbNsWWV2eskcqHqJadW/aajM8jbe5z26CN9INqIeJGZ0E6nyKlZVfToz8EQ0=
X-Google-Smtp-Source: AGHT+IFPUocm/4nviahA9kVMkkKDFQ5l6iajdVlX1sr2xtvR0ubt2qGXvimvsdW1+ViSPBkb4GzA0Q==
X-Received: by 2002:adf:fa45:0:b0:377:6073:48df with SMTP id ffacd0b85a97d-37ef0c05405mr2619872f8f.58.1729617455376;
        Tue, 22 Oct 2024 10:17:35 -0700 (PDT)
Received: from localhost.localdomain ([2804:7f0:bc02:9a54:2a00:afff:fe18:d85c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec1407f4asm4944538b3a.207.2024.10.22.10.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 10:17:34 -0700 (PDT)
From: Henrique Carvalho <henrique.carvalho@suse.com>
To: markus.elfring@web.de
Cc: bharathsm@microsoft.com,
	kernel-janitors@vger.kernel.org,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	make24@iscas.ac.cn,
	pc@manguebit.com,
	ronniesahlberg@gmail.com,
	samba-technical@lists.samba.org,
	sfrench@samba.org,
	sprasad@microsoft.com,
	tom@talpey.com,
	ematsumiya@suse.de,
	Henrique Carvalho <henrique.carvalho@suse.com>
Subject: [PATCH v2] fs_context.c: smb3_reconfigure: Handle kstrdup failures for passwords
Date: Tue, 22 Oct 2024 14:15:15 -0300
Message-ID: <20241022171515.3330183-1-henrique.carvalho@suse.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <5fecc08a-c3b7-4745-abc9-0f5b4de03c22@web.de>
References: <5fecc08a-c3b7-4745-abc9-0f5b4de03c22@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In smb3_reconfigure(), after duplicating ctx->password and
ctx->password2 with kstrdup(), we need to check for allocation
failures.

If ses->password allocation fails, return -ENOMEM.
If ses->password2 allocation fails, free ses->password, set it
to NULL, and return -ENOMEM.

Fixes: c1eb537bf456 ("cifs: allow changing password during remount")
Signed-off-by: Haoxiang Li <make24@iscas.ac.cn>
Signed-off-by: Henrique Carvalho <henrique.carvalho@suse.com>
---
V1 -> V2: Decoupled checks for ses->password and ses->password2. Ensured
ses->password is freed and set to NULL if ses->password2 allocation
fails. Corrected return value. Improved commit message.

 fs/smb/client/fs_context.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/smb/client/fs_context.c b/fs/smb/client/fs_context.c
index 28c4e576d460a..5c5a52019efad 100644
--- a/fs/smb/client/fs_context.c
+++ b/fs/smb/client/fs_context.c
@@ -920,8 +920,15 @@ static int smb3_reconfigure(struct fs_context *fc)
 	else  {
 		kfree_sensitive(ses->password);
 		ses->password = kstrdup(ctx->password, GFP_KERNEL);
+		if (!ses->password)
+			return -ENOMEM;
 		kfree_sensitive(ses->password2);
 		ses->password2 = kstrdup(ctx->password2, GFP_KERNEL);
+		if (!ses->password2) {
+			kfree_sensitive(ses->password);
+			ses->password = NULL;
+			return -ENOMEM;
+		}
 	}
 	STEAL_STRING(cifs_sb, ctx, domainname);
 	STEAL_STRING(cifs_sb, ctx, nodename);
-- 
2.46.0


